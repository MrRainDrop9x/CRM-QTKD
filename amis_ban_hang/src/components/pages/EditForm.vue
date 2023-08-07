<template>
  <MisaToolBar :editStatus="true" title="Sửa tiềm năng" />
  <CRMBodyCenter />
</template>

<script>
import MisaToolBar from '../base/MisaToolBar.vue'
import CRMBodyCenter from '../base/CRM_BodyCenter.vue'
import { URL_LEADS_API } from '@/constants/url'
import fetchAPI from '@/utils/fetchAPI'
import { mapMutations } from 'vuex'
export default {
  name: 'EditForm',
  components: {
    MisaToolBar,
    CRMBodyCenter,
  },
  data() {
    // Biến lưu trữ giữ liệu tiềm năng
    return {
      leadCode: this.$route.params.id,
    }
  },
  methods: {
    ...mapMutations([
      'setLeadNeedEdit',
      'resetLeadNeedEdit',
      'setLeadInfomation',
      'setEditStatus',
    ]),
  },
  async created() {
    this.setEditStatus(true)

    this.emitter.emit('editFormCreated', this.leadCode)
    /**
     * Lấy 1 bản ghi tiềm năng theo id
     */
    const getLeadDetailsByLeadCode = async () => {
      try {
        let leadDetails = await fetchAPI(
          `${URL_LEADS_API}/${this.leadCode}`,
          'GET'
        )
        this.setLeadNeedEdit(leadDetails)
      } catch (error) {
        console.log(error)
      }
    }
    await getLeadDetailsByLeadCode()
  },
  beforeUnmount() {
    this.resetLeadNeedEdit()
    this.setLeadInfomation()
    this.setEditStatus(false)
  },
}
</script>

<style></style>
