import { createStore } from 'vuex'
import moduleA from './checkBoxChange'
import deleteLeads from './deleteLeads'
import showModal from './showModal'
import leadEntity from './leadEntity'
import showToast from './showToast'
import editLead from '@/store/editLead'
import filterLead from '@/store/filterLead'
// Tạo mới một store instance
const store = createStore({
  modules: {
    moduleA,
    deleteLeads,
    showModal,
    leadEntity,
    showToast,
    editLead,
    filterLead,
  },
})

export default store
