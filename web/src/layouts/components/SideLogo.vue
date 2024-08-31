<!--
 * @Author: Yokaze 2479757568@qq.com
 * @Date: 2024-08-31 01:43:00
 * @LastEditors: Yokaze 2479757568@qq.com
 * @LastEditTime: 2024-08-31 05:04:27
 * @FilePath: \KazeAdmin-Nest\web-2\src\layouts\components\SideLogo.vue
 * 🐱🐱🐱🐱🐱🐱
-->
<!--------------------------------
 - @Author: Ronnie Zhang
 - @LastEditor: Ronnie Zhang
 - @LastEditTime: 2023/12/16 18:50:28
 - @Email: zclzone@outlook.com
 - Copyright © 2023 Ronnie Zhang(大脸怪) | https://isme.top
 --------------------------------->

<template>
  <router-link class="h-60 f-c-c" to="/">
    <TheLogo />
    <h2
      v-show="!appStore.collapsed"
      class="ml-20 max-w-140 flex-shrink-0 text-20 color-primary font-bold"
    >
      {{ title }}
    </h2>
  </router-link>
</template>

<script setup>
import { useAppStore } from '@/store'

const title = import.meta.env.VITE_TITLE

const appStore = useAppStore()
</script>
