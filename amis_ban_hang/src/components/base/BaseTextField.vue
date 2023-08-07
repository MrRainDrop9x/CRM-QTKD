<template>
  <div
    v-if="!hasLabel && type !== 'CRMComboBox' && type !== 'date'"
    class="base-input-text-field witdth-100"
    :class="{
      hoverBackground: hasBackgroundColorInProps,
    }"
  >
    <div
      class="witdth-100 relative"
      :class="{
        error: errorFlag,
      }"
    >
      <div v-if="hasIconSearchFunction" class="icon-search"></div>
      <div class="icon-success"></div>
      <div>
        <input
          ref="inputRef"
          @input="handleChangeValueInput"
          v-model="bindingInput"
          class="witdth-100"
          type="search"
          :placeholder="placeholder"
          :readonly="readOnly"
          :class="[
            {
              'padding-left-32': hasIconSearchFunction,
            },
            { preventHover: this.preventHover },
          ]"
          :tabindex="tabIndex"
        />
      </div>
      <div
        v-if="
          this.$store.state.leadEntity.isDupplicateLeadCode &&
          this.fieldName === 'Mã tiềm năng'
        "
        class="error-msg--dupplicate"
      >
        {{ `giá trị của Mã tiềm năng đã bị trùng.` }}
        <span @click="showDetailLead">Xem ngay</span>
      </div>
      <div class="error-msg">
        {{ `${this.fieldName} không được để trống` }}
      </div>
    </div>
  </div>
  <!-- Text trong form thêm mới -->
  <div
    class="row-item"
    v-if="hasLabel && type !== 'CRMComboBox' && type !== 'date'"
  >
    <div class="label-wrap">
      <label class="misa-label show-tooltip" :class="{ required: required }"
        >{{ labelContent }}
        <TooltipComp :contentTooltip="labelContent" />
      </label>
      <div v-if="this.hasToolTipIcon" class="icon-tooltip show-tooltip">
        <TooltipComp :contentTooltip="fullToolTipContent" />
      </div>
    </div>
    <div class="combobox-content">
      <div class="input-control">
        <div class="input-wrap">
          <BaseTextField
            borderColor="#d3d7de"
            backgroundColor="#fff"
            preventHover
            :readOnly="readOnly"
            :placeholder="placeholder"
            :type="this.type"
            :required="this.required"
            :fieldName="this.labelContent"
            :valueDefault="valueDefault"
            :tabIndex="tabIndex"
          />
        </div>
      </div>
    </div>
  </div>

  <!-- CRM Combo box trong form thêm mới -->
  <div
    class="row-item"
    v-if="hasLabel && type === 'CRMComboBox' && type !== 'date'"
  >
    <div class="label-wrap">
      <label class="misa-label show-tooltip" :class="{ required: required }"
        >{{ labelContent }}
        <TooltipComp :contentTooltip="labelContent" />
      </label>
      <div v-if="this.hasToolTipIcon" class="icon-tooltip show-tooltip">
        <TooltipComp :contentTooltip="fullToolTipContent" />
      </div>
    </div>
    <div class="combobox-content">
      <div class="input-control">
        <div class="input-wrap">
          <CRMComboBox :fieldName="labelContent" :tabindex="tabIndex" />
        </div>
      </div>
    </div>
  </div>
  <!-- Date time picker trong form them moi -->
  <div class="date-time-picker" v-if="hasLabel && type === 'date'">
    <div class="label-wrap" style="min-width: 160px">
      <label class="misa-label show-tooltip" :class="{ required: required }"
        >{{ labelContent }}
        <TooltipComp :contentTooltip="labelContent" />
      </label>
      <div v-if="this.hasToolTipIcon" class="icon-tooltip show-tooltip">
        <TooltipComp :contentTooltip="fullToolTipContent" />
      </div>
    </div>
    <DateTimePicker :tabindex="tabIndex" />
  </div>
</template>

<script>
import TooltipComp from './TooltipComp.vue'
import BaseTextField from './BaseTextField.vue'
import CRMComboBox from './CRMComboBox.vue'
import { mapMutations, mapState, mapGetters } from 'vuex'
import DateTimePicker from './DateTimePicker.vue'

export default {
  data() {
    let errorFlag = false
    let infomation = this.$store.state.leadEntity.leadInfomation
    let bindingInput = this.valueDefault
    return {
      ...mapState(['leadInfomation', 'isDupplicateLeadCode']),
      errorFlag,
      infomation,
      bindingInput,
    }
  },
  props: {
    // Chỉ định placeholder cho thẻ input
    placeholder: {
      type: String,
      default: '',
    },
    // Chỉ định attribute chỉ đọc cho thẻ input
    readOnly: {
      type: Boolean,
      default: false,
    },
    // Chỉ định nội dung thẻ label
    labelContent: {
      type: String,
    },
    // thêm icon tìm kiếm vào thẻ input
    hasIconSearch: {
      type: Boolean,
    },
    // Chỉ định màu nền khi hover
    backgroundColorWhenHover: {
      type: String,
    },
    // chỉ định màu nền
    backgroundColor: {
      type: String,
      default: '#f0f2f4',
    },
    // Chỉ định chiều dài cho button
    width: {
      type: String,
      default: '100%',
    },
    // Chỉ định màu của border
    borderColor: {
      type: String,
      default: 'transparent',
    },
    // Ngăn các sự kiện liên quan đến hover của thẻ input
    preventHover: {
      type: Boolean,
      default: false,
    },
    // Chỉ định trường có required không ?
    required: {
      type: Boolean,
      default: false,
    },
    // Có tooltip icon ở phần label không ?
    hasToolTipIcon: {
      type: Boolean,
      default: false,
    },
    // Nội dung tooltip của icon tooltip
    fullToolTipContent: {
      type: String,
      default: '',
    },
    // Chọn kiểu [CRMComboBox,text]
    type: {
      type: String,
    },
    // Thiết lập có lỗi
    error: {
      type: Boolean,
      default: false,
    },
    // Tên trường
    fieldName: {
      type: String,
    },
    // Chỉ định nội dung mặc định
    valueDefault: {
      type: String,
      default: '',
    },
    // Thiết lập tabindex
    tabIndex: {
      type: Number,
      default: -1,
    },
  },
  computed: {
    /**
     * Kiểm tra props truyền vào có label không ?
     * Author: hainh 17/07/2022
     */
    hasLabel() {
      return this.labelContent ? true : false
    },
    /**
     * Kiểm trả props truyền vào có icon search không ?
     * @Author: hainh 17/07/2022
     */
    hasIconSearchFunction() {
      return this.hasIconSearch ? true : false
    },
    /**
     * Kiểm tra có background color được truyền vào trong props hay không ?
     */
    hasBackgroundColorInProps() {
      return this.backgroundColorWhenHover
    },

    /**
     * Kiểm tra xem state first name có thay đổi hay không
     */
    firstNameChange() {
      return this.$store.state.leadEntity.leadInfomation.firstName
    },
    /**
     * Kiểm tra xem state last name có thay đổi hay không
     */
    lastNameChange() {
      return this.$store.state.leadEntity.leadInfomation.lastName
    },

    ...mapGetters([
      'getLeadCode',
      'getFirstNameEdit',
      'getLastNameEdit',
      'editStatus',
      'getLeadCodeEdit',
      'getMobile',
      'getOfficeMobile',
      'getOfficeEmail',
      'getEmail',
      'getTaxCode',
      'getCompanyName',
      'getZalo',
      'getBankAccount',
      'getBankName',
      'getBusinessTypeName',
    ]),
  },
  watch: {
    // Theo dõi Tên
    firstNameChange() {
      if (this.fieldName === 'Họ và tên') {
        this.bindingInput =
          this.$store.state.leadEntity.leadInfomation.lastName +
          ' ' +
          this.$store.state.leadEntity.leadInfomation.firstName
      }
    },

    // Theo dõi Họ và đệm
    lastNameChange() {
      if (this.fieldName === 'Họ và tên') {
        this.bindingInput =
          this.$store.state.leadEntity.leadInfomation.lastName +
          ' ' +
          this.$store.state.leadEntity.leadInfomation.firstName
      }
    },

    // Tên thay đổi trong store form edit
    getFirstNameEdit() {
      if (this.fieldName === 'Tên') {
        this.bindingInput = this.getFirstNameEdit
      }
    },

    // Họ và đệm trong store thay đổi
    getLastNameEdit() {
      if (this.fieldName === 'Họ và đệm') {
        this.bindingInput = this.getLastNameEdit
      }
    },

    // Mã tiềm năng trong store binding lên ui
    getLeadCodeEdit() {
      if (this.fieldName === 'Mã tiềm năng') {
        this.bindingInput = this.getLeadCodeEdit
      }
    },

    // Binding mobile trong store lên ui
    getMobile() {
      if (this.fieldName === 'ĐT di động') {
        this.bindingInput = this.getMobile
      }
    },

    getOfficeMobile() {
      if (this.fieldName === 'ĐT cơ quan') {
        this.bindingInput = this.getOfficeMobile
      }
    },
    getOfficeEmail() {
      if (this.fieldName === 'Email cơ quan') {
        this.bindingInput = this.getOfficeEmail
      }
    },
    getEmail() {
      if (this.fieldName === 'Email cá nhân') {
        this.bindingInput = this.getEmail
      }
    },
    getTaxCode() {
      if (this.fieldName === 'Mã số thuế') {
        this.bindingInput = this.getTaxCode
      }
    },
    getCompanyName() {
      if (this.fieldName === 'Tổ chức') {
        this.bindingInput = this.getCompanyName
      }
    },
    getZalo() {
      if (this.fieldName === 'Zalo') {
        this.bindingInput = this.getZalo
      }
    },

    getBankAccount() {
      if (this.fieldName === 'Tài khoản ngân hàng') {
        this.bindingInput = this.getBankAccount
      }
    },

    getBankName() {
      if (this.fieldName === 'Mở tại ngân hàng') {
        this.bindingInput = this.getBankName
      }
    },

    getBusinessTypeName() {
      if (this.fieldName === 'Loại hình') {
        this.bindingInput = this.getBusinessTypeName
      }
    },
  },
  components: {
    TooltipComp,
    BaseTextField,
    CRMComboBox,
    DateTimePicker,
  },
  methods: {
    /**
     * Xử lý nhập liệu
     * Lưu các giá trị được nhập vào ô input
     * @Author: NHHAI (19/07/2022)
     */
    handleChangeValueInput() {
      if (this.type === 'text') {
        switch (this.fieldName) {
          case 'Tên':
            this.setFirstName(this.bindingInput)
            this.setFirstNameEdit(this.bindingInput)
            break
          case 'Test chuyển đổi':
            this.setTestChuyenDoi(this.bindingInput)
            break
          case 'Họ và đệm':
            this.setLastName(this.bindingInput)
            this.setLastNameEdit(this.bindingInput)
            break
          case 'ĐT di động':
            this.setMobile(this.bindingInput)
            this.setMobileEdit(this.bindingInput)
            break
          case 'Mã tiềm năng':
            this.setLeadCode(this.bindingInput)
            break
        }
      }
    },

    /**
     * Thực hiện validate các trường dữ liệu
     * @Author: NHHAI (19/07/2022)
     */
    validatorForm() {
      if (this.infomation['firstName'] === '' && this.fieldName === 'Tên') {
        this.errorFlag = true
        this.$store.state.leadEntity.isErrorOnValidate = true

        // Đợi element được mount vào DOM rồi mới chạy focus
        this.$nextTick(() => {
          this.focusInput()
        })
      } else if (
        this.infomation['testChuyenDoi'] === '' &&
        this.fieldName === 'Test chuyển đổi'
      ) {
        this.errorFlag = true
        this.$store.state.leadEntity.isErrorOnValidate = true
        if (this.infomation['firstName']) {
          this.$nextTick(() => {
            this.focusInput()
          })
        }
      } else {
        this.$store.state.leadEntity.isErrorOnValidate = false
      }
    },
    // Forcus vào thẻ input
    //@Author: NHHAI (19/07/2022)
    focusInput() {
      this.$refs.inputRef.focus()
    },

    // Binding mã tiềm năng mới lên ui
    //@Author: NHHAI (19/07/2022)
    genNewLeadCode(newLeadCode) {
      if (this.fieldName === 'Mã tiềm năng') {
        this.bindingInput = newLeadCode
      }
    },

    /**
     * Chuyển qua trang chi tiểt của tiềm năng đã có
     * @Author: NHHAI (19/07/2022)
     */
    showDetailLead() {
      let newLeadCode = this.getLeadCode
      this.$router.push({ path: `/lead/view/${newLeadCode}` })
    },

    // Reset dữ liệu
    resetBindingInput() {
      this.bindingInput = ''
    },

    ...mapMutations([
      'setLastName',
      'setFirstName',
      'setMobile',
      'setTestChuyenDoi',
      'setLeadCode',
      'setFirstNameEdit',
      'setLastNameEdit',
      'setMobileEdit',
    ]),
  },

  mounted() {
    // Click vào nút save thì validate form
    this.emitter.on('validate', () => {
      this.validatorForm()
    })

    if (this.fieldName === 'Họ và tên') {
      this.bindingInput =
        this.$store.state.leadEntity.leadInfomation.lastName +
        ' ' +
        this.$store.state.leadEntity.leadInfomation.firstName
    }

    if (this.fieldName === 'Mã tiềm năng') {
      this.emitter.on('editFormCreated', leadCode => {
        this.bindingInput = leadCode
      })
    }
  },
  created() {
    // Thực hiện đưa mã tiềm năng max + 1 lên ui
    if (this.fieldName === 'Mã tiềm năng' && !this.editStatus) {
      this.emitter.on('bindingNewLeadCode', newLeadCode => {
        this.genNewLeadCode(newLeadCode)
        this.setLeadCode(this.bindingInput)
      })
    }

    // Thực hiện việc reset dữ liệu
    this.emitter.on('resetFormAdd', () => {
      // reset form
      this.resetBindingInput()
    })

    // Kết thúc sự kiện lưu và thêm thì quay lại đầu trang
    this.emitter.on('endSaveAndAdd', () => {
      if (this.fieldName == 'Xưng hô') {
        // Đợi element được mount vào DOM rồi mới chạy focus
        this.$nextTick(() => {
          this.focusInput()
        })
      }
    })
  },
}
</script>

<style scoped>
.date-time-picker {
  display: flex;
}
.witdth-100 {
  width: 100%;
}
.combobox-content {
  flex-grow: 1;
}
.input-control {
  width: 100%;
  height: 100%;
}
.icon-tooltip {
  margin-right: 8px;
  margin-left: 8px;
  cursor: pointer;
  display: inline-block;
  width: 16px;
  height: 16px;
  cursor: pointer;
}
.icon-tooltip::after {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -208px 0px;
}
.row-item {
  display: flex;
  padding: 4px 0;
  margin: 2px 0;
  /* align-items: center; */
}

.label-wrap {
  width: 160px;
  height: 32px;
  line-height: 32px;
  align-items: center;
  display: flex;
}
.misa-label.required::after {
  color: #ec4243;
  content: ' *';
}
.input-wrap {
  border-radius: 4px;
  /* overflow: hidden; */
  width: 100%;
  position: relative;
  display: flex;
}

.hoverBackground input:hover {
  background-color: v-bind(backgroundColorWhenHover);
}
.base-input-text-field {
  display: flex;
}
.base-input-text-field.topLabel {
  flex-direction: column;
}
.base-input-text-field.leftLabel {
  align-items: center;
}
.base-input-text-field input {
  height: 32px;
  padding: 0 16px;
  border-radius: 4px;
  outline: none;
  width: v-bind(width);
  background-color: v-bind(backgroundColor);
  border: 1px solid v-bind(borderColor);
  -webkit-transition: border-color ease-in-out 0.15s,
    box-shadow ease-in-out 0.15s;
  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

.base-input-text-field input:hover {
  border-color: transparent;
}
.base-input-text-field .preventHover:hover {
  border-color: v-bind(borderColor);
}
.base-input-text-field input:focus,
.base-input-text-field .preventHover:focus {
  border: 1px solid #4262f0;
  background-color: #fff;
}

.base-input-text-field input[readonly] {
  background-color: #e2e4e9;
}

.base-input-text-field input[readonly]::placeholder {
  color: #586074;
}

.base-input-text-field input[readonly]:focus {
  border: 1px solid #d3d7de !important;
  background-color: #e2e4e9 !important;
}

.base-input-text-field input[readonly]:hover {
  border: 1px solid #d3d7de !important;
}

.base-input-text-field label {
  display: none;
}

.leftLabel label.hasLabel {
  margin-right: 16px;
  display: initial;
}

.topLabel label.hasLabel {
  margin-bottom: 8px;
  display: initial;
}

.relative {
  position: relative;
}

.icon-search {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  left: 8px;
}
.padding-left-32 {
  padding-left: 32px !important;
}

.error-msg {
  display: none;
  margin-top: 8px;
  color: #ec4141;
}
.error-msg--dupplicate {
  margin-top: 8px;
  color: #ec4141;
}

.error-msg--dupplicate span {
  color: #4262f0;
  cursor: pointer;
}

.error-msg--dupplicate span:hover {
  text-decoration: underline;
}

.error > input {
  border-color: #ec4141 !important;
}

.base-input-text-field .error input:focus,
.base-input-text-field .error input {
  border-color: #ec4141 !important;
}

.base-input-text-field .error .error-msg {
  display: block;
}

.success input {
  border-color: #31b491 !important;
}

.icon-success {
  display: none;
}

.success .icon-success {
  display: block;
  position: absolute;
  right: 8px;
  top: 50%;
  transform: translateY(-50%);
}
</style>
