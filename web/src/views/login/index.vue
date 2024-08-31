

<template>
  <v-app> <v-btn></v-btn></v-app>
  <div class="wh-full flex-col bg-[url(@/assets/images/LS-1.jpg)] bg-center bg-cover">
    <!-- 登录页卡片 -->
    <div
      class="m-auto max-w-700 min-w-345 f-c-c rounded-40 bg-opacity-20 bg-cover p-12 card-shadow auto-bg"
      style="
        background: rgba(0, 0, 0, 0.44);
        backdrop-filter: blur(40px);
        border: 3px solid rgba(255, 255, 255, 0.7);
      "
    >
      <!-- 登录面板背景图片 -->
      <!-- <div class="hidden w-380 px-20 py-35 md:block">
        <img src="@/assets/images/login_banner.webp" class="w-full" alt="login_banner">
      </div> -->
      <div class="w-320 flex-col px-18 py-30">
        <h2 class="f-c-c text-24 text-#ffffff font-normal text-30">
          <img src="@/assets/images/logo.png" class="mr-20 h-50" />
          {{ title }}
        </h2>
        <n-input
          v-model:value="loginInfo.username"
          autofocus
          class="mt-32 h-42 items-center"
          placeholder="请输入用户名"
          :maxlength="20"
        >
          <template #prefix>
            <i class="i-fe:user mr-12 opacity-20" />
          </template>
        </n-input>
        <n-input
          v-model:value="loginInfo.password"
          class="mt-20 h-42 items-center"
          type="password"
          show-password-on="mousedown"
          placeholder="请输入密码"
          :maxlength="20"
          @keydown.enter="handleLogin()"
        >
          <template #prefix>
            <i class="i-fe:lock mr-12 opacity-20" />
          </template>
        </n-input>

        <div class="mt-20 flex items-center">
          <n-input
            v-model:value="loginInfo.captcha"
            class="h-42 items-center"
            palceholder="请输入验证码"
            :maxlength="4"
            @keydown.enter="handleLogin()"
          >
            <template #prefix>
              <i class="i-fe:key mr-12 opacity-20" />
            </template>
          </n-input>
          <img
            v-if="captchaUrl"
            :src="captchaUrl"
            alt="验证码"
            height="40"
            class="ml-12 w-80 cursor-pointer"
            @click="initCaptcha"
          />
        </div>

        <n-checkbox
          class="mt-20"
          :checked="isRemember"
          label="记住我"
          :on-update:checked="(val) => (isRemember = val)"
        />

        <div class="mt-20 flex items-center">
          <!-- <n-button
            class="h-42 flex-1 rounded-5 text-16"
            type="primary"
            ghost
            @click="quickLogin()"
          >
            游客登录一键登录
          </n-button> -->

          <n-button
            class="ma-0 h-42 flex-1 rounded-5 text-16"
            type="primary"
            :loading="loading"
            @click="handleLogin()"
          >
            登录
          </n-button>
        </div>
      </div>
    </div>
    <!-- 页脚版权 -->
    <!-- <TheFooter class="py-12" /> -->
  </div>
</template>

<script setup>
import { useStorage } from '@vueuse/core';
import api from './api';
import { lStorage, throttle } from '@/utils';
import { useAuthStore } from '@/store';

const authStore = useAuthStore();
const router = useRouter();
const route = useRoute();
const title = import.meta.env.VITE_TITLE;

const loginInfo = ref({
  username: '',
  password: '',
});

const captchaUrl = ref('');
const initCaptcha = throttle(() => {
  captchaUrl.value = `${import.meta.env.VITE_AXIOS_BASE_URL}/auth/captcha?${Date.now()}`;
}, 500);

const localLoginInfo = lStorage.get('loginInfo');
if (localLoginInfo) {
  loginInfo.value.username = localLoginInfo.username || '';
  loginInfo.value.password = localLoginInfo.password || '';
}
initCaptcha();

// 游客登录一键登录
// function quickLogin() {
//   loginInfo.value.username = 'admin';
//   loginInfo.value.password = 'admin';
//   handleLogin(true);
// }

const isRemember = useStorage('isRemember', true);
const loading = ref(false);
async function handleLogin(isQuick) {
  const { username, password, captcha } = loginInfo.value;
  if (!username || !password) return $message.warning('请输入用户名和密码');
  if (!isQuick && !captcha) return $message.warning('请输入验证码');
  try {
    loading.value = true;
    $message.loading('正在验证，请稍后...', { key: 'login' });
    const { data } = await api.login({ username, password: password.toString(), captcha, isQuick });
    if (isRemember.value) {
      lStorage.set('loginInfo', { username, password });
    } else {
      lStorage.remove('loginInfo');
    }
    onLoginSuccess(data);
  } catch (error) {
    // 10003为验证码错误专属业务码
    if (error?.code === 10003) {
      // 为防止爆破，验证码错误则刷新验证码
      initCaptcha();
    }
    $message.destroy('login');
    console.error(error);
  }
  loading.value = false;
}

async function onLoginSuccess(data = {}) {
  authStore.setToken(data);
  $message.loading('登录中...', { key: 'login' });
  try {
    $message.success('登录成功', { key: 'login' });
    if (route.query.redirect) {
      const path = route.query.redirect;
      delete route.query.redirect;
      router.push({ path, query: route.query });
    } else {
      router.push('/');
    }
  } catch (error) {
    console.error(error);
    $message.destroy('login');
  }
}
</script>
