<template>
  <MisaToolBar />
  <CRMBodyCenter />
</template>

<script>
import MisaToolBar from '../base/MisaToolBar.vue'
import CRMBodyCenter from '../base/CRM_BodyCenter.vue'
import { mapMutations } from 'vuex'
export default {
  name: 'NewPotential',
  components: {
    MisaToolBar,
    CRMBodyCenter,
  },
  methods: {
    ...mapMutations(['setLeadInfomation']),
  },
  data() {
    return {}
  },
  created() {
    this.$store.state.leadEntity.isDupplicateLeadCode = false
  },
  beforeUnmount() {
    // Trước khi unmount thì reset toàn bộ store liên quan đến việc thêm mới
    this.setLeadInfomation()
  },
}
</script>

<style scoped></style>
