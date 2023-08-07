import LEAD_ENTITY_EMPTY from '@/constants/lead-entity'
import { URL_LEADS_API } from '@/constants/url'

const leadEntitiy = {
  state: () => ({
    // Thông tin của một tiềm năng
    leadInfomation: LEAD_ENTITY_EMPTY,
    // Có lỗi khi validate không
    isErrorOnValidate: false,
    // Mã tiềm năng có bị trùng không
    isDupplicateLeadCode: false,
  }),
  mutations: {
    /**
     * Gán giá trị cho mã tiềm năng
     * @param {*} state
     * @param {*} leadCode
     */
    setLeadCode(state, leadCode) {
      state.leadInfomation.leadCode = leadCode
    },

    /**
     * Gán giá trị họ tên
     * @param {*} state
     * @param {*} lastName
     */
    setLastName(state, lastName) {
      state.leadInfomation.lastName = lastName
    },

    /**
     * Gán giá trị cho tên
     * @param {*} state
     * @param {*} firstName
     */
    setFirstName(state, firstName) {
      state.leadInfomation.firstName = firstName
    },

    /**
     * Điện thoại di động
     * @param {*} state
     * @param {*} mobile
     * @Author: NHHAI (20/08/2022)
     */
    setMobile(state, mobile) {
      state.leadInfomation.mobile = mobile
    },

    /**
     * Test chuyển đổi
     * @param {*} state
     * @param {*} testChuyenDoi
     * @Author: NHHAI (20/08/2022)
     */
    setTestChuyenDoi(state, testChuyenDoi) {
      state.leadInfomation.testChuyenDoi = testChuyenDoi
    },

    /**
     * Xưng hô
     * @param {*} state
     * @param {*} salutationName
     * @Author: NHHAI (20/08/2022)
     */
    setSalutationName(state, salutationName) {
      state.leadInfomation.salutationName = salutationName
    },

    /**
     * Chức danh
     * @param {*} state
     * @param {*} titleName
     * @Author: NHHAI (20/08/2022)
     */
    setTitleName(state, titleName) {
      state.leadInfomation.titleName = titleName
    },

    /**
     * Nguồn gốc
     * @param {*} state
     * @param {*} leadSourceName
     * @Author: NHHAI (20/08/2022)
     */
    setLeadSourceName(state, leadSourceName) {
      state.leadInfomation.leadSourceName = leadSourceName
    },

    /**
     * Phân loại khách hàng
     * @param {*} state
     * @param {*} leadTypeName
     * @Author: NHHAI (20/08/2022)
     */
    setLeadTypeName(state, leadTypeName) {
      state.leadInfomation.leadTypeName = leadTypeName
    },

    /**
     * Phòng ban
     * @param {*} state
     * @param {*} departmentName
     * @Author: NHHAI (20/08/2022)
     */
    setDepartmentName(state, departmentName) {
      state.leadInfomation.departmentName = departmentName
    },

    /**
     *
     * @param {*} state
     * @param {*} isDupplicateLeadCode
     * @Author: NHHAI (20/08/2022)
     */
    setIsDupplicateLeadCode(state, isDupplicateLeadCode) {
      state.isDupplicateLeadCode = isDupplicateLeadCode
    },

    /**
     * Reset gia tri tiem nang ve mac dinh
     * @param {*} state
     * @Author: NHHAI (20/08/2022)
     */
    setLeadInfomation(state) {
      for (const key in state.leadInfomation) {
        if (Object.hasOwnProperty.call(state.leadInfomation, key)) {
          state.leadInfomation[key] = ''
        }
      }
    },
  },
  actions: {
    /**
     * Thêm một tiềm năng
     * @param {*} state
     * @returns trạng thái phương thức thêm một tiềm năng
     * @author:NHHAI (19/08/2022)
     *
     */
    async postLead(state, leadInfomation) {
      return await (
        await fetch(URL_LEADS_API, {
          method: 'POST',
          headers: {
            'Content-type': 'application/json; charset=UTF-8',
          },
          body: JSON.stringify(leadInfomation), // body data type must match "Content-Type" header
        }).catch(error => console.log(error))
      ).json()
    },
  },

  getters: {
    leadInfomation: state => {
      return state.leadInfomation
    },

    getTestChuyenDoi: state => {
      return state.leadInfomation.testChuyenDoi
    },

    getLeadCode: state => {
      return state.leadInfomation.leadCode
    },
  },
}

export default leadEntitiy
