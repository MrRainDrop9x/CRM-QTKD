// Store lưu trữ thông tin về lead cần chỉnh sửa
import LEAD_ENTITY_EMPTY from '@/constants/lead-entity'
const editLead = {
  state: () => ({
    leadNeedEdit: LEAD_ENTITY_EMPTY,
    editStatus: false,
  }),
  mutations: {
    setEditStatus(state, editStatus) {
      state.editStatus = editStatus
    },

    setLeadNeedEdit(state, lead) {
      state.leadNeedEdit = lead
    },

    setFirstNameEdit(state, firstName) {
      state.leadNeedEdit.FirstName = firstName
    },

    setLastNameEdit(state, lastName) {
      state.leadNeedEdit.LastName = lastName
    },

    setMobileEdit(state, mobile) {
      state.leadNeedEdit.Mobile = mobile
    },

    setSalutationEdit(state, salutation) {
      state.leadNeedEdit.SalutationName = salutation
    },

    setTitleNameEdit(state, titleName) {
      state.leadNeedEdit.TitleName = titleName
    },
    setLeadSourceNameEdit(state, leadSourceName) {
      state.leadNeedEdit.LeadSourceName = leadSourceName
    },
    setLeadTypeNameEdit(state, leadTypeName) {
      state.leadNeedEdit.LeadTypeName = leadTypeName
    },
    setDepartmentNameEdit(state, departmentName) {
      state.leadNeedEdit.DepartmentName = departmentName
    },
    /**
     * Reset state leadNeedEdit
     * @param {*} state
     * author NHHAI 21/08/2022
     */
    resetLeadNeedEdit(state) {
      for (const key in state.leadNeedEdit) {
        if (Object.hasOwnProperty.call(state.leadNeedEdit, key)) {
          state.leadNeedEdit[key] = ''
        }
      }
    },
  },
  actions: {},
  getters: {
    getBusinessTypeName: state => {
      return state.leadNeedEdit.BusinessTypeName
    },
    getLeadCodeEdit: state => {
      return state.leadNeedEdit.LeadCode
    },

    leadNeedEdit: state => {
      return state.leadNeedEdit
    },

    getFirstNameEdit: state => {
      return state.leadNeedEdit.FirstName
    },

    getLastNameEdit: state => {
      return state.leadNeedEdit.LastName
    },

    getSalutationNameEdit: state => {
      return state.leadNeedEdit.SalutationName
    },

    editStatus: state => {
      return state.editStatus
    },

    getMobile: state => {
      return state.leadNeedEdit.Mobile
    },

    getOfficeMobile: state => {
      return state.leadNeedEdit.OfficeMobile
    },

    getOfficeEmail: state => {
      return state.leadNeedEdit.OfficeEmail
    },

    getEmail: state => {
      return state.leadNeedEdit.Email
    },

    getTaxCode: state => {
      return state.leadNeedEdit.TaxCode
    },

    getCompanyName: state => {
      return state.leadNeedEdit.CompanyName
    },

    getZalo: state => {
      return state.leadNeedEdit.Zalo
    },

    getBankAccount: state => {
      return state.leadNeedEdit.BankAccount
    },

    getBankName: state => {
      return state.leadNeedEdit.BankName
    },

    getSalutationEdit: state => {
      return state.leadNeedEdit.Salutation
    },
    getTitleNameEdit: state => {
      return state.leadNeedEdit.TitleName
    },
    getLeadSourceNameEdit: state => {
      return state.leadNeedEdit.TitleName
    },
    getLeadTypeNameEdit: state => {
      return state.leadNeedEdit.LeadTypeName
    },
    getDepartmentNameEdit: state => {
      return state.leadNeedEdit.DepartmentName
    },
  },
}

export default editLead
