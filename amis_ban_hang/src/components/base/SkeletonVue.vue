<template>
  <div class="skeleton skeleton-text"></div>
</template>

<script>
export default {}
</script>

<style scoped>
.skeleton {
  animation: skeleton-loading 1s linear infinite alternate;
}
.skeleton-text {
  width: 100%;
  height: 1.3rem;
  margin-bottom: 0.25rem;
  border-radius: 0.125rem;
}
.skeleton-checkbox {
  width: 100%;
  height: 1rem;
  margin-bottom: 0.25rem;
  border-radius: 0.125rem;
}
.skeleton-text:last-child {
  margin-bottom: 0;
}
@keyframes skeleton-loading {
  0% {
    /* background-color: linear-gradient(to right, #F0F2F4 , #D3D7DE); */

    background-color: #f0f2f4;
  }
  100% {
    background-color: #d3d7de;
  }
}
</style>
