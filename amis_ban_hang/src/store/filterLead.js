// Store lưu trữ các state dùng cho việc tìm kiếm và phân trang
import { URL_LEADS_API } from '@/constants/url'
import axios from 'axios'
const filterLead = {
  state: () => ({
    totalRecord: 1,
    totalPage: 1,
    currentPage: 1,
    currentPageRecords: 1,
    leadDataFromAPI: [],
  }),
  mutations: {
    setTotalRecord(state, totalRecord) {
      state.totalRecord = totalRecord
    },
    setTotalPage(state, totalPage) {
      state.totalPage = totalPage
    },
    setCurrentPage(state, currentPage) {
      state.currentPage = currentPage
    },
    setCurrentPageRecords(state, currentPageRecords) {
      state.currentPageRecords = currentPageRecords
    },
    setLeadDataFromAPI(state, leadDataFromAPI) {
      state.leadDataFromAPI = leadDataFromAPI
    },
  },
  actions: {
    async getLeadFromAPI({ commit }, paramFilter) {
      let searchWordTemp = paramFilter.searchWord
        ? `searchWord=${paramFilter.searchWord}&`
        : ''
      try {
        const response = await axios.get(
          `${URL_LEADS_API}/filter?${searchWordTemp}pageSize=${paramFilter.pageSize}&pageNumber=${paramFilter.pageNumber}`
        )
        let data = response.data
        commit('setTotalRecord', data.totalRecord)
        commit('setTotalPage', data.totalPage)
        commit('setCurrentPage', data.currentPage)
        commit('setCurrentPageRecords', data.currentPageRecords)
        commit('setLeadDataFromAPI', data.data)
        return data
      } catch (error) {
        error => console.log(error)
      }
    },
  },
  getters: {
    totalPage: state => {
      return state.totalPage
    },
    totalRecord: state => {
      return state.totalRecord
    },
    currentPage: state => {
      return state.currentPage
    },
    currentPageRecords: state => {
      return state.currentPageRecords
    },
  },
}
export default filterLead
