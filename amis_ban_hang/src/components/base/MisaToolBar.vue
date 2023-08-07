<template>
  <div class="tool-bar-wrap">
    <div class="tool-bar">
      <div class="tool-bar-left">
        <div class="left-title">{{ title }}</div>
        <div v-if="!editStatus" class="layout-type">Mẫu tiêu chuẩn</div>
        <div class="layout-setting">Sửa bố cục</div>
      </div>
      <div class="tool-bar-right">
        <div class="button-cancel">
          <BaseButton
            buttonContent="Hủy bỏ"
            backgroundColor="#fff"
            color="#1F2229"
            borderColor="#d3d7de"
            backgroundColorHover="#f0f2f4"
            pathLink="/crm/lead/list"
            backgroundColorActive="#e2e4e9"
          />
        </div>
        <div class="button-save-and-add">
          <BaseButton
            buttonContent="Lưu và thêm"
            backgroundColor="#fff"
            color="#4262F0"
            backgroundColorHover="#e7ebfd"
            backgroundColorActive="#d0d8fb"
            @click="saveAndAddEvent"
          />
        </div>
        <div class="button-save" @click="validate">
          <BaseButton
            buttonContent="Lưu"
            backgroundColor="#4262F0"
            backgroundColorActive="#2b4eee"
          />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters, mapMutations } from 'vuex'
import BaseButton from './BaseButton.vue'

export default {
  components: { BaseButton },
  props: {
    title: {
      type: String,
      default: 'Thêm Tiềm năng',
    },
    editStatus: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    ...mapActions(['postLead']),

    ...mapMutations([
      'setIsDupplicateLeadCode',
      'toastAction',
      'setLeadInfomation',
    ]),

    // validate du lieu
    async validate() {
      this.emitter.emit('validate')

      if (!this.$store.state.leadEntity.isErrorOnValidate) {
        let data = await this.postLead(this.leadInfomation)
        if (data.statusCode === 400) {
          this.setIsDupplicateLeadCode(true)
        } else if (data.statusCode === 401 || !this.getTestChuyenDoi) {
          console.log('Không được để trống các trường required')
        } else {
          this.setIsDupplicateLeadCode(false)

          // Hiển thị thông báo thành công
          this.toastAction()

          //phát ra tín hiệu tới BaseTextField để reset form
          this.emitter.emit('resetFormAdd')

          // Chuyển qua trang chi tiết tiềm năng vừa thêm mới
          this.$router.push({ path: `/lead/view/${this.getLeadCode}` })

          // Reset thông tin tiềm năng tại store
          this.setLeadInfomation()
        }
      }
    },

    // Lưu và thêm
    async saveAndAddEvent() {
      this.emitter.emit('validate')
      if (!this.$store.state.leadEntity.isErrorOnValidate) {
        let data = await this.postLead(this.leadInfomation)
        if (data.statusCode === 400) {
          this.setIsDupplicateLeadCode(true)
        } else if (data.statusCode === 401 || !this.getTestChuyenDoi) {
          console.log('Không được để trống các trường required')
        } else {
          this.setIsDupplicateLeadCode(false)

          // Hiển thị thông báo thành công
          this.toastAction()

          //phát ra tín hiệu tới BaseTextField để reset form
          this.emitter.emit('resetFormAdd')

          // Reset thông tin tiềm năng tại store
          this.setLeadInfomation()

          this.emitter.emit('endSaveAndAdd')
        }
      }
    },
  },
  computed: {
    ...mapGetters(['leadInfomation', 'getTestChuyenDoi', 'getLeadCode']),
  },
  created() {
    console.log(this.editStatus)
  },
}
</script>

<style scoped>
.group-field__content {
  padding: 8px 56px;
}

.tool-bar-wrap {
  height: 64px;
  background-color: #e2e4e9;
  position: sticky;
  position: -webkit-sticky;
}
.tool-bar {
  display: flex;
  flex-direction: row;
  align-items: center;
  justify-content: space-between;
  height: 64px;
  padding: 0 16px;
}
.tool-bar-left {
  display: flex;
  align-items: center;
  justify-content: center;
}

.tool-bar-right {
  display: flex;
  align-items: center;
  justify-content: center;
}
.left-title {
  margin-right: 8px;
  font-size: 2rem;
  font-family: Bold;
}

.layout-type {
  margin-right: 9px;
  padding: 4px 0 0 8px;
  cursor: pointer;
  font-size: 16px;
  font-family: Bold;
}

.layout-setting {
  padding-top: 4px;
  color: #4262f0;
  cursor: pointer;
}

.layout-setting:hover {
  text-decoration: underline;
}

.button-cancel {
  margin-right: 8px;
}

.button-save-and-add {
  margin-right: 8px;
}
</style>
