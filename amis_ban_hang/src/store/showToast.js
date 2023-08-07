// Kiểm soát việc hiển thị của thôn báo toast

const showToast = {
  state: () => ({
    isShowToast: false,
  }),
  mutations: {
    // hiện
    showToast(state) {
      state.isShowToast = true
    },
    // ẩn
    hiddenToast(state) {
      state.isShowToast = false
    },

    // Thực hiện animation hiện rồi ẩn
    toastAction(state) {
      state.isShowToast = true

      setTimeout(() => {
        state.isShowToast = false
      }, '1000')
    },
  },
}

export default showToast
