// Hiển thị hoặc ẩn modal và popup thông báo xóa tiềm năng
const showModal = {
  state: () => ({
    isShowModal: false,
  }),
  mutations: {
    showModal(state) {
      state.isShowModal = true
    },
    hiddenModal(state) {
      state.isShowModal = false
    },
  },
  actions: {},
  getters: {},
}

export default showModal
