<template>
  <div class="modal" :hidden="!this.$store.state.showModal.isShowModal">
    <div class="container">
      <div class="confirm-box">
        <div @click="hiddenModal" class="close-icon">×</div>
        <div class="confirm-content">
          Bạn có chắc chắn muốn xóa Tiềm năng này không?
        </div>
        <div class="confirm-buttons">
          <div style="margin-right: 8px">
            <BaseButton
              @click="hiddenModal"
              color="#1f2229"
              buttonContent="Hủy"
              background-color="#e2e4e9"
              borderColor="transperent"
              backgroundColorHover="#d3d7de"
              backgroundColorActive="#d3d7de"
            />
          </div>
          <BaseButton
            buttonContent="Đồng ý"
            background-color="#ec4243"
            borderColor="transperent"
            backgroundColorHover="#ea2e2e"
            backgroundColorActive="#b71c1c"
            @click="handleDelete"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseButton from './BaseButton.vue'
import { mapState, mapMutations } from 'vuex'
export default {
  name: 'PopupNotification',
  props: {},
  components: {
    BaseButton,
  },
  methods: {
    ...mapMutations([
      'showModal',
      'hiddenModal',
      'deleteLeadsByID',
      'toastAction',
    ]),
    handleDelete() {
      try {
        // Gọi API xóa tiềm năng
        this.deleteLeadsByID()

        // Ẩn modal
        this.hiddenModal()

        // Hiện thông báo xóa thành công
        this.toastAction()

        // Phát một sự kiển để xóa tiềm năng trên ui
        this.emitter.emit('removeLead')
      } catch (error) {
        console.log(error)
      }
    },
  },
  data() {
    return {
      ...mapState(['isShowModal']),
    }
  },
}
</script>

<style scoped>
.confirm-buttons {
  display: flex;
  float: right;
  transform: translateY(5px);
}

.modal {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  overflow-y: auto;
  perspective: 500px;
  perspective-origin: center;
  background-color: rgb(68, 68, 68, 0.2);
  z-index: 9999;
}

.container {
  width: 100%;
}

.confirm-box {
  padding: 16px;
  width: 460px;
  height: 122px;
  margin-top: 85px;
  margin-bottom: 50px;
  transition-duration: 0.4s;
  transition-timing-function: cubic-bezier(0.36, 0.55, 0.19, 1);
  transition-property: all;
  background-color: #fff;
  box-shadow: 0 2px 6px #0003;
  border-radius: 5px;
  animation-duration: 2s;
  animation-iteration-count: infinite;
  opacity: 1;
  position: relative;
  outline: 0;
  overflow: hidden;
  margin-left: auto;
  margin-right: auto;
  z-index: 10000;
}

.close-icon {
  position: absolute;
  cursor: pointer;
  opacity: 0.6;
  text-align: center;
  transition: opacity 0.3s ease-in;
  font-size: 27px !important;
  line-height: 14px !important;
  top: 16px !important;
  right: 16px !important;
  width: 16px !important;
  height: 16px !important;
}

.close-icon:hover {
  opacity: 1;
}

.confirm-content {
  transition-duration: 0.4s;
  transition-timing-function: cubic-bezier(0.36, 0.55, 0.19, 1);
  transition: height 0.4s ease-in;
  display: inline-block;
  width: 100%;
  position: relative;
  overflow: hidden;
  margin-bottom: 0 !important;
  height: auto !important;
  max-height: 65vh;
  padding: 0 0 16px !important;
  margin-top: 16px;
  margin-bottom: 16px;
}
</style>
