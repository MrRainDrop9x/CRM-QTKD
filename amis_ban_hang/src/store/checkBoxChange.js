// Xử lý sự kiện click vào ô check box trong bảng

const checkBoxChange = {
  state: () => ({
    changeCheckBox: false,
  }),
  mutations: {
    // Chọn checkbox
    selectedCheckBox(state) {
      state.changeCheckBox = true
    },
    // Hủy chọn checkbox
    unSelectedCheckBox(state) {
      state.changeCheckBox = false
    },
  },
  actions: {},
  getters: {},
}

export default checkBoxChange
