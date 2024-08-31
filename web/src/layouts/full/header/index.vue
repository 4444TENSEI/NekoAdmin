<!--
 * @Author: Yokaze 2479757568@qq.com
 * @Date: 2024-08-31 01:43:00
 * @LastEditors: Yokaze 2479757568@qq.com
 * @LastEditTime: 2024-08-31 17:53:28
 * @FilePath: \web-2\src\layouts\full\header\index.vue
 * 🐱🐱🐱🐱🐱🐱
-->
<!--------------------------------
 - @Author: Ronnie Zhang
 - @LastEditor: Ronnie Zhang
 - @LastEditTime: 2023/12/16 18:51:10
 - @Email: zclzone@outlook.com
 - Copyright © 2023 Ronnie Zhang(大脸怪) | https://isme.top
 --------------------------------->

<template>
  <AppCard class="flex items-center px-12" border-b="1px solid light_border dark:dark_border">
    <MenuCollapse />

    <BreadCrumb />

    <div class="ml-auto flex flex-shrink-0 items-center px-12 text-18">
      <ToggleTheme />

      <Fullscreen />


      <ThemeSetting class="mr-16" />

      <UserAvatar />
    </div>
  </AppCard>
</template>

<script setup>
import { ToggleTheme } from '@/components'
import { BreadCrumb, Fullscreen, MenuCollapse, UserAvatar } from '@/layouts/components'

function handleLinkClick(link) {
  window.open(link)
}
</script>
