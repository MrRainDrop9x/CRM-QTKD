// Xóa 1 hay nhiều tiềm năng theo id
import { URL_LEADS_API } from '@/constants/url'

const deleteLeads = {
  state: () => ({
    leadsIDNeedDelete: [],
  }),
  mutations: {
    /**
     * Thêm id của tiềm năng cần xóa vào mảng chứa danh sách các id tiềm năng cần xóa
     * @param {*} state
     * @param {*} id
     */
    addItemLeadsID(state, id) {
      state.leadsIDNeedDelete.push(id)
    },
    /**
     * Xóa id của tiềm năng cần xóa vào mảng chứa danh sách các id tiềm năng cần xóa
     * @param {*} state
     * @param {*} id
     */
    removeItemLeadsID(state, id) {
      state.leadsIDNeedDelete = state.leadsIDNeedDelete.filter(
        leadID => leadID !== id
      )
    },
    /**
     * hàm delete dữ liệu
     */
    async deleteLeadsByID(state) {
      const response = await fetch(URL_LEADS_API, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify(state.leadsIDNeedDelete), // body data type must match "Content-Type" header
      })
        .then(console.log('delete success!'))
        .catch(console.error())
      return response.json() // parses JSON response into native JavaScript objects
    },
  },
  actions: {},
  getters: {},
}

export default deleteLeads
