<template>
  <div
    :id="id"
    class="dropdown"
    @keydown.capture="onKeydownDropdown"
    ref="dropdown"
  >
    <div
      class="crm-combo-box"
      @click="onClickDropBox"
      :class="{ isActive: isOpen }"
    >
      <div class="input">
        <span
          class="placeholder"
          :class="{ selected: isSelected && refContent !== '- Không chọn -' }"
          >{{ refContent }}</span
        >
      </div>
      <div
        class="selection-arrow"
        :class="{ 'selection2-arrow': isOpen }"
      ></div>
    </div>
    <div class="dropdown-list" v-show="isOpen">
      <div class="select-search-dropdown">
        <input
          placeholder="Tìm kiếm"
          type="search"
          class="select-search__field"
          ref="inputRef"
          @input="inputOnChange"
          v-model="textInput"
          @keydown="selecItemUpDown"
        />
      </div>
      <div class="dropDownItems" ref="scrollContainer">
        <DropDownItem
          :class="{
            activeItem:
              this.refContent === item.text && refContent !== '- Không chọn -',
            focusItem: index == indexItemFocus,
          }"
          @changeContent="changeContent"
          v-for="(item, index) in dataFilter"
          :key="index"
          :item="item"
          :closeDropdown="callToClose"
          @click="itemOnSelect(index)"
          :ref="'toFocus_' + index"
          @focus="saveItemFocus(index)"
          @keydown="selecItemUpDown(index)"
          @keyup="selecItemUpDown(index)"
        >
          {{ item.text }}
        </DropDownItem>
      </div>
    </div>
  </div>
</template>

<script>
/**
 * Xóa các tông trong bảng chữ cái Việt Nam
 * @param {*} str
 * @Author: NHHAI (19/07/2022)
 */
function removeVietnameseTones(str) {
  str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, 'a')
  str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, 'e')
  str = str.replace(/ì|í|ị|ỉ|ĩ/g, 'i')
  str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, 'o')
  str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, 'u')
  str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, 'y')
  str = str.replace(/đ/g, 'd')
  str = str.replace(/À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ/g, 'A')
  str = str.replace(/È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ/g, 'E')
  str = str.replace(/Ì|Í|Ị|Ỉ|Ĩ/g, 'I')
  str = str.replace(/Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ/g, 'O')
  str = str.replace(/Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ/g, 'U')
  str = str.replace(/Ỳ|Ý|Ỵ|Ỷ|Ỹ/g, 'Y')
  str = str.replace(/Đ/g, 'D')
  // Some system encode vietnamese combining accent as individual utf-8 characters
  // Một vài bộ encode coi các dấu mũ, dấu chữ như một kí tự riêng biệt nên thêm hai dòng này
  str = str.replace(/\u0300|\u0301|\u0303|\u0309|\u0323/g, '') // ̀ ́ ̃ ̉ ̣  huyền, sắc, ngã, hỏi, nặng
  str = str.replace(/\u02C6|\u0306|\u031B/g, '') // ˆ ̆ ̛  Â, Ê, Ă, Ơ, Ư
  // Remove extra spaces
  // Bỏ các khoảng trắng liền nhau
  str = str.replace(/ + /g, ' ')
  str = str.trim()
  // Remove punctuations
  // Bỏ dấu câu, kí tự đặc biệt
  // str = str.replace(
  //   /!|@|%|\^|\*|\(|\)|\+|\=|\<|\>|\?|\/|,|\.|\:|\;|\'|\"|\&|\#|\[|\]|~|\$|_|`|-|{|}|\||\\/g,
  //   ' '
  // )
  return str
}

/**
 * Định nghĩa các nút được nhập từ bàn phím
 * @Author: NHHAI (19/07/2022)
 */
const keyCode = {
  Enter: 13,
  ArrowUp: 38,
  ArrowDown: 40,
  ESC: 27,
}

import DropDownItem from './DropDownItem.vue'
import uuidv4 from '@/utils/random-id'
import { mapMutations, mapGetters } from 'vuex'
import {
  SALUTATION_DATA,
  DEPARTMENT_DATA,
  TITLE_DATA,
  LEAD_SOURCE_DATA,
  LEAD_TYPE_DATA,
  ANNUAL_REVENUE_DATA,
  COUNTRY_DATA,
  DISTRICT_DATA,
  PROVINCE_DATA,
  WARD_DATA,
} from '@/constants/combobox-data'
export default {
  components: {
    DropDownItem,
  },
  setup() {
    let dataComboBox = []

    return {
      id: uuidv4(),
      dataComboBox,
    }
  },
  data() {
    return {
      isOpen: false,
      refContent: '- Không chọn -',
      isSelected: false,
      dataFilter: [],
      textInput: null,
      indexItemFocus: null, // Index của item focus hiện tại
      indexItemSelected: null, // Index của item được selected
    }
  },
  props: {
    placeholder: {
      type: String,
    },
    fieldName: {
      type: String,
    },
  },
  methods: {
    /**
     * Bắt sự kiện enter cho dropdown
     * @Author: NHHAI (19/07/2022)
     */
    onKeydownDropdown() {
      var me = this
      var keyCodePress = event.keyCode
      switch (keyCodePress) {
        case keyCode.Enter: {
          if (!this.isOpen) {
            me.isOpen = true
            this.$nextTick(() => {
              this.focusInput()
            })
          } else {
            this.callToClose()
          }
        }
      }
    },

    /**
     * Tự động auto scroll khi sử dụng bàn phím
     * @Author: NHHAI (19/07/2022)
     */
    fixScrolling() {
      var me = this
      const liH = 33
      this.$refs.scrollContainer.scrollTop = liH * me.indexItemFocus
    },

    /**
     * Lưu lại index của item đã focus
     * NVMANH (31/07/2022)
     */
    saveItemFocus(index) {
      this.indexItemFocus = index
    },

    // Hàm thực hiện việc đóng DropDown
    //@Author: NHHAI (19/07/2022)
    callToClose() {
      this.isOpen = false
    },
    // Nếu click ra ngoài, drop down menu tắt
    //@Author: NHHAI (19/07/2022)
    onClick(event) {
      if (!document.getElementById(this.id).contains(event.target)) {
        this.callToClose()
      }
    },
    // Thay đổi content của dropmenu
    //@Author: NHHAI (19/07/2022)
    changeContent(content) {
      this.refContent = content
    },

    // Sự kiện click vào dropbox
    //@Author: NHHAI (19/07/2022)
    onClickDropBox() {
      // Toggle đóng mở list item của dropmenu
      this.isOpen = !this.isOpen

      // Focus the component, but we have to wait
      // so that it will be showing first.
      this.$nextTick(() => {
        this.focusInput()
      })
    },
    // Forcus vào thẻ input
    focusInput() {
      this.$refs.inputRef.focus()
    },

    /**
     * Click chọn item trong danh sách
     * NVMANH (31/07/2022)
     */
    itemOnSelect(index) {
      // Đánh giấu combobox đã đc chọn hay chưa ?
      this.isSelected = true

      this.indexItemSelected = index
    },

    /**
     * Lấy dữ liệu cho combobox
     * @Author: NHHAI (19/07/2022)
     */
    getDataComboBox() {
      switch (this.fieldName) {
        case 'Xưng hô':
          this.dataComboBox = SALUTATION_DATA
          break
        case 'Phòng ban':
          this.dataComboBox = DEPARTMENT_DATA
          break
        case 'Chức danh':
          this.dataComboBox = TITLE_DATA
          break
        case 'Nguồn gốc':
          this.dataComboBox = LEAD_SOURCE_DATA
          break
        case 'Phân loại khách hàng':
          this.dataComboBox = LEAD_TYPE_DATA
          break
        case 'Doanh thu/ Ngân sách':
          this.dataComboBox = ANNUAL_REVENUE_DATA
          break
        case 'Quốc gia':
          this.dataComboBox = COUNTRY_DATA
          break
        case 'Quận/Huyện':
          this.dataComboBox = DISTRICT_DATA
          break
        case 'Tỉnh/Thành phố':
          this.dataComboBox = PROVINCE_DATA
          break
        case 'Phường/Xã':
          this.dataComboBox = WARD_DATA
          break
      }
    },

    /**
     * Nhập text thì thực hiện filter dữ liệu và hiển thị
     * NVMANH (31/07/2022)
     */
    inputOnChange() {
      var me = this
      // Thực hiện lọc các phần tử phù hợp trong data:
      this.dataFilter = this.dataComboBox.filter(e => {
        let text = removeVietnameseTones(me.textInput)
          .toLowerCase()
          .replace(' ', '')
        let textOfItem = removeVietnameseTones(e.text)
          .toLowerCase()
          .replace(' ', '')
        return textOfItem.includes(text)
      })
    },
    /**
     * Lựa chọn item bằng cách nhấn các phím lên, xuống trên bàn phím
     * NVMANH (31/07/2022)
     */
    selecItemUpDown() {
      var me = this
      var keyCodePress = event.keyCode
      var elToFocus = null
      switch (keyCodePress) {
        case keyCode.ESC:
          this.callToClose()
          break
        case keyCode.ArrowDown:
          // this.isShowListData = true
          elToFocus = this.$refs[`toFocus_${me.indexItemFocus + 1}`]
          if (
            this.indexItemFocus == null ||
            !elToFocus ||
            elToFocus.length == 0
          ) {
            this.indexItemFocus = 0
          } else {
            this.indexItemFocus += 1
            this.fixScrolling()
          }
          break
        case keyCode.ArrowUp:
          this.isShowListData = true
          elToFocus = this.$refs[`toFocus_${me.indexItemFocus - 1}`]
          if (
            this.indexItemFocus == null ||
            !elToFocus ||
            elToFocus.length == 0
          ) {
            this.indexItemFocus = this.dataFilter.length - 1
          } else {
            this.indexItemFocus -= 1
            this.fixScrolling()
          }
          break
        case keyCode.Enter:
          elToFocus = this.$refs[`toFocus_${me.indexItemFocus}`]
          if (elToFocus && elToFocus.length > 0) {
            elToFocus[0].onClick()
            this.callToClose()
            this.isSelected = true
            this.$refs.dropdown.focus()
          }
          break
        default:
          break
      }
    },
    ...mapMutations([
      'setSalutationName',
      'setTitleName',
      'setLeadSourceName',
      'setLeadTypeName',
      'setDepartmentName',
      'setSalutationEdit',
      'setTitleNameEdit',
      'setLeadSourceNameEdit',
      'setLeadTypeNameEdit',
      'setDepartmentNameEdit',
    ]),
  },
  computed: {
    hasInputSearch() {
      return this.inputSearch
    },

    ...mapGetters([
      'getSalutationNameEdit',
      'getSalutationEdit',
      'getTitleNameEdit',
      'getLeadSourceNameEdit',
      'getLeadTypeNameEdit',
      'getDepartmentNameEdit',
    ]),
  },
  watch: {
    refContent() {
      switch (this.fieldName) {
        case 'Xưng hô':
          this.setSalutationName(this.refContent)
          this.setSalutationEdit(this.refContent)
          break
        case 'Chức danh': {
          this.setTitleName(this.refContent)
          this.setTitleNameEdit(this.refContent)
          break
        }
        case 'Nguồn gốc': {
          this.setLeadSourceName(this.refContent)
          this.setLeadSourceNameEdit(this.refContent)
          break
        }
        case 'Phân loại khách hàng': {
          this.setLeadTypeName(this.refContent)
          this.setLeadTypeNameEdit(this.refContent)
          break
        }
        case 'Phòng ban': {
          this.setDepartmentName(this.refContent)
          this.setDepartmentNameEdit(this.refContent)
          break
        }
      }
    },

    // Xưng hô
    getSalutationNameEdit() {
      if (this.fieldName === 'Xưng hô' && this.getSalutationNameEdit) {
        let temp = removeVietnameseTones(this.getSalutationNameEdit)

        for (let i = 0; i < SALUTATION_DATA.length; i++) {
          if (removeVietnameseTones(SALUTATION_DATA[i].text) === temp) {
            let elToFocus = this.$refs[`toFocus_${i}`]
            if (elToFocus && elToFocus.length > 0) {
              elToFocus[0].onClick()
              this.callToClose()
              this.isSelected = true
              this.$refs.dropdown.focus()
            }
          }
        }
      }
    },
    // Chức danh
    getTitleNameEdit() {
      if (this.fieldName === 'Chức danh' && this.getTitleNameEdit) {
        let temp = removeVietnameseTones(this.getTitleNameEdit)
        let data = TITLE_DATA
        for (let i = 0; i < data.length; i++) {
          if (removeVietnameseTones(data[i].text) === temp) {
            let elToFocus = this.$refs[`toFocus_${i}`]
            if (elToFocus && elToFocus.length > 0) {
              elToFocus[0].onClick()
              this.callToClose()
              this.isSelected = true
            }
          }
        }
      }
    },
    getLeadSourceNameEdit() {
      if (this.fieldName === 'Nguồn gốc' && this.getLeadSourceNameEdit) {
        let temp = removeVietnameseTones(this.getLeadSourceNameEdit)
        let data = LEAD_SOURCE_DATA
        for (let i = 0; i < data.length; i++) {
          if (removeVietnameseTones(data[i].text) === temp) {
            let elToFocus = this.$refs[`toFocus_${i}`]
            if (elToFocus && elToFocus.length > 0) {
              elToFocus[0].onClick()
              this.callToClose()
              this.isSelected = true
            }
          }
        }
      }
    },
    getLeadTypeNameEdit() {
      if (
        this.fieldName === 'Phân loại khách hàng' &&
        this.getLeadTypeNameEdit
      ) {
        let temp = removeVietnameseTones(this.getLeadTypeNameEdit)
        let data = LEAD_TYPE_DATA
        for (let i = 0; i < data.length; i++) {
          if (removeVietnameseTones(data[i].text) === temp) {
            let elToFocus = this.$refs[`toFocus_${i}`]
            if (elToFocus && elToFocus.length > 0) {
              elToFocus[0].onClick()
              this.callToClose()
              this.isSelected = true
            }
          }
        }
      }
    },
    getDepartmentNameEdit() {
      if (this.fieldName === 'Phòng ban' && this.getDepartmentNameEdit) {
        let temp = removeVietnameseTones(this.getDepartmentNameEdit)
        let data = DEPARTMENT_DATA
        for (let i = 0; i < data.length; i++) {
          if (removeVietnameseTones(data[i].text) === temp) {
            let elToFocus = this.$refs[`toFocus_${i}`]
            if (elToFocus && elToFocus.length > 0) {
              elToFocus[0].onClick()
              this.callToClose()
              this.isSelected = true
            }
          }
        }
      }
    },
  },
  mounted() {
    this.focusInput()

    // Focus vào trường đầu tiên
    if (this.fieldName === 'Xưng hô') {
      this.$refs.dropdown.focus()
    }
  },
  created() {
    /**
     * Gán sự kiện nếu click ra ngoài thì dropdown sẽ không hiển thị danh sách
     * @Author: NHHAI (19/07/2022)
     */
    window.addEventListener('click', this.onClick)

    this.getDataComboBox()

    this.dataFilter = this.dataComboBox
  },
  beforeUnmount() {
    /**
     * Trước khi unmount xóa sự kiện onclick
     * @Author: NHHAI (19/07/2022)
     */
    window.removeEventListener('click', this.onClick)
  },
}
</script>

<style scoped>
.crm-combo-box {
  overflow: hidden;
}
.dropdown:focus .crm-combo-box {
  border: 1px solid #4262f0 !important;
}

.dropDownItems {
  max-height: 130px;
  overflow-y: scroll;
}

.select-search-dropdown {
  padding: 4px 0;
  cursor: pointer;
  display: flex;
  align-items: center;
  height: 40px;
  border-bottom: solid 1px #d3d7de !important;
}

.select-search-dropdown::after {
  content: '';
  display: inline-block;
  margin-right: 8px;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -32px 0px;
}

.select-search__field {
  width: 100%;
  padding: 4px 4px 4px 16px;
  border: none;
  outline: none;
}

.dropdown {
  position: relative;
  width: fit-content;
  cursor: pointer;
  background: #ffffff;
  min-width: 182px;
  position: relative;
  width: 100%;
}

.dropdown-list {
  overflow: hidden;
  padding-top: 8px;
  padding-bottom: 8px;
  -ms-box-shadow: 0 -1px 8px rgba(0, 0, 0, 0.32);
  -o-box-shadow: 0 -1px 8px rgba(0, 0, 0, 0.32);
  box-shadow: 0 -1px 8px #00000052;
  background: #ffffff;
  border-radius: 4px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  width: 100%;
  bottom: 32px;
  right: 0px;
  position: absolute;
  z-index: 1000;
}
</style>

<style scoped>
.isActive {
  border: 1px solid #4262f0 !important;
}
.dropdown:focus {
  outline: none;
}
.crm-combo-box {
  outline: none;
  width: 100%;
  vertical-align: middle;
  background-color: #fff;
  border: 1px solid #d3d7de;
  border-radius: 4px;
  height: 32px;
  cursor: pointer;
  user-select: text;
  height: 32px;
  position: relative;
  padding: 0 30px 0 16px;
}

.crm-combo-box:active,
.crm-combo-box:focus,
.crm-combo-box:focus-within {
  border-color: 1px solid #4262f0 !important;
}

.crm-combo-box .input {
  width: 100%;
  height: 100%;
  border: none;
  outline: none;
  cursor: pointer;
}
.placeholder {
  line-height: 29px;
  color: #99a1b2;
}

.placeholder.selected {
  color: #1f2229;
}
.selection-arrow {
  background-repeat: no-repeat;
  background-position: center center;
  height: 100% !important;
  width: 32px !important;
  position: absolute;
  top: 0px;
  right: 0px;
}

.selection-arrow::after {
  content: '';
  width: 16px;
  height: 16px;
  display: inline-block;
  position: absolute;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -48px -31px;
  top: 7px;
  right: 8px;
}
.selection-arrow.selection2-arrow::after {
  width: 16px !important;
  height: 16px !important;
  display: inline-block;
  margin: 7px 8px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -32px -32px;
  cursor: pointer;
  position: absolute;
  top: 1px;
  right: 1px;
}
</style>
