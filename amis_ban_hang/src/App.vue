<template>
  <div class="grid-layout">
    <TheMenu />
    <TheContent>
      <router-view />
    </TheContent>
    <div
      class="toast"
      :class="{ active: this.$store.state.showToast.isShowToast }"
    >
      <BaseToastMessage type="success" toastMessage="Thành công!" />
    </div>
  </div>

  <PopupNotification />
</template>

<script>
import TheMenu from './components/layout/TheMenu'
import TheContent from './components/layout/TheContent.vue'
import PopupNotification from './components/base/PopupNotification.vue'
import BaseToastMessage from '@/components/base/BaseToastMessage.vue'
export default {
  name: 'App',
  components: {
    TheMenu,
    TheContent,
    PopupNotification,
    BaseToastMessage,
  },
}
</script>

<style>
@import url('./style/icons.css');
@import url('./style/font.css');
@import url('./style/root.css');
@import url('./style/scroll-bar.css');
/* reset css */
* {
  padding: 0;
  margin: 0;
  box-sizing: inherit;
  font-family: inherit;
  color: #1f2229;
  line-height: 16px;
  font-size: 13px;
}

html {
  /* convert 1rem = 10px */
  font-size: 62.5%;
  box-sizing: border-box;
  font-family: Regular;
}

.toast {
  z-index: 9999;
  position: absolute;
  left: 50%;
  transform: translate(-50%, -50px);
  opacity: 0;
  top: 30px;
  transition: all 0.25s ease-in;
}
.toast.active {
  transform: translate(-50%, 0);
  opacity: 1;
}
.grid-layout {
  position: relative;
  display: grid;
  grid-template-columns: 1fr;
  grid-template-rows: 84px auto;
  height: 100vh;
  width: 100vw;
}
.toastMessage {
  /* left: 50%;
  top: 0; */
}
</style>
