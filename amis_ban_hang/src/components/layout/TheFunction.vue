<template>
  <div v-if="!changeUI" class="function">
    <div class="function__left">
      <div class="function-title">
        <p>{{ title }}</p>
        <div class="icon-down"></div>
      </div>
      <div class="function-fix">
        <p>Sửa</p>
        <div class="show-tooltip icon-refresh-wrap" @click="handleRefresh">
          <div class="icon-refresh"></div>
          <TooltipComp contentTooltip="Nạp dữ liệu" />
        </div>
      </div>
    </div>
    <div class="function__right">
      <div class="show-tooltip">
        <div class="base-input-text-field witdth-100">
          <div class="witdth-100 relative">
            <div class="icon-search"></div>
            <div>
              <input
                v-model="wordNeedToSearch"
                @keydown.enter="handleSearch"
                style="width: 240px; background-color: #fff"
                class="padding-left-32"
                placeholder="Tìm kiếm theo Địa chỉ, Tổ chức, ..."
              />
            </div>
          </div>
        </div>
        <TooltipComp
          contentTooltip="Tìm kiếm theo Địa chỉ, Tổ chức, Email cá nhân, Họ và tên, ĐT di động, ĐT cơ quan, Email cơ quan, mã số thuế"
        />
      </div>
      <div style="margin: 0 8px 0 10px">
        <BaseButton
          buttonContent="Thêm"
          hasIcon
          pathLink="/crm/lead/add"
          backgroundColorActive="#0d47a1"
        />
      </div>
      <div class="show-menu">
        <button class="button-more"></button>
      </div>
      <div>
        <button class="switch-view-type">
          <div class="icon-dropdown"></div>
          <div class="arrow_drop_down_16 btn-drop"></div>
        </button>
      </div>
    </div>
  </div>
  <!--  -->
  <div v-if="changeUI" class="function">
    <div class="function__left">
      <p>
        Đã chọn <span class="count-selected">{{ deleteSelectNumber }}</span>
      </p>
      <div style="margin-left: 16px; margin-right: 8px">
        <p @click="handleDeselect" style="color: #2b4eee; cursor: pointer">
          Bỏ chọn
        </p>
      </div>
      <div class="all">
        <div class="icon--16">
          <div class="icon--mountTag"></div>
        </div>
        <ButtonB
          buttonText="Gắn thẻ"
          hasTertiary
          backgroundColor="#ffffff"
          hasIcon
          hasBorderRight
          style="margin-right: 8px"
        />
      </div>
      <div class="all">
        <div class="icon--16">
          <div class="icon--updateInfo"></div>
        </div>
        <ButtonB
          hasIcon
          backgroundColor="#ffffff"
          hasTertiary
          buttonText="Cập nhật thông tin"
          style="margin-right: 8px"
        />
      </div>

      <div class="all">
        <div class="icon--16">
          <div class="icon--selectTransaction"></div>
        </div>
        <ButtonB
          hasIcon
          backgroundColor="#ffffff"
          hasTertiary
          buttonText="Chọn vào chiến dịch"
          style="margin-right: 8px"
        />
      </div>

      <div class="all">
        <div class="icon--16">
          <div class="icon--convert"></div>
        </div>
        <ButtonB
          hasIcon
          backgroundColor="#ffffff"
          hasTertiary
          buttonText="Chuyển đổi"
          style="margin-right: 8px"
        />
      </div>

      <div class="all">
        <div class="icon--16">
          <div class="icon--handoverWork"></div>
        </div>
        <ButtonB
          hasIcon
          backgroundColor="#ffffff"
          hasTertiary
          buttonText="Bàn giao công việc"
          style="margin-right: 8px"
        />
      </div>

      <div class="show-menu" @click="onClickShowMenu">
        <button class="button-more"></button>
        <div :hidden="!showMore" class="show-more__lists">
          <div class="show-more__item">
            <ButtonBasic
              content="Chọn lộ trình đi tuyến"
              iconLeft="ic-choose-to-routing"
            />
            <ButtonBasic content="Email Marketeting" iconLeft="ic-send-email" />
            <ButtonBasic content="Gửi SMS" iconLeft="icon-chat-gray" />
            <ButtonBasic
              @click="clickOnExportBtn"
              content="Xuất khẩu"
              iconLeft="ic-export"
            />
            <ButtonBasic content="Chia sẻ" iconLeft="ic-share-right" />
            <ButtonBasic
              @click="showModal"
              content="Xóa"
              iconLeft="icon-delete-look-red"
            />
          </div>
          <div class="show-more__item"></div>
          <div class="show-more__item"></div>
        </div>
      </div>
    </div>
    <div class="function__right">
      <div class="show-tooltip">
        <BaseTextField
          placeholder="Tìm kiếm theo Địa chỉ, Tổ chức, ..."
          hasIconSearch
          backgroundColor="#fff"
          width="240px"
        />
        <TooltipComp
          contentTooltip="Tìm kiếm theo Địa chỉ, Tổ chức, Email cá nhân, Họ và tên, ĐT di động, ĐT cơ quan, Email cơ quan, mã số thuế"
        />
      </div>
    </div>
  </div>
</template>

<script>
import BaseButton from '../base/BaseButton.vue'
import BaseTextField from '../base/BaseTextField.vue'
import TooltipComp from '../base/TooltipComp.vue'
import ButtonB from '@/components/base/FunctionB.vue'
import { mapState, mapMutations } from 'vuex'
import ButtonBasic from '../base/ButtonBasic.vue'
import { URL_EXPORT_LEADS } from '@/constants/url'

export default {
  name: 'TheFunction',
  components: {
    BaseButton,
    BaseTextField,
    TooltipComp,
    ButtonBasic,
    ButtonB,
  },
  props: {
    title: {
      type: String,
      required: true,
    },
  },
  data() {
    let showMore = false
    let wordNeedToSearch
    let deleteSelectNumber = 1
    return {
      deleteSelectNumber,
      wordNeedToSearch,
      showMore,
      ...mapState(['changeCheckBox', 'leadsIDNeedDelete', 'isShowModal']),
    }
  },
  computed: {
    /**
     * Nếu 1 trong các hàng dữ liệu được chọn thì phần chức năng sẽ thay đổi giao diện
     */
    changeUI() {
      return this.$store.state.moduleA.changeCheckBox
    },
  },
  methods: {
    ...mapMutations(['showModal', 'hiddenModal']),
    /**
     * Phát sự kiện bỏ chọn tất cả
     */
    handleDeselect() {
      this.emitter.emit('deselectAll')
    },
    handleSearch() {
      this.emitter.emit('firedSearchFunction', this.wordNeedToSearch)
    },
    /**
     * Hiển thị thêm các chức năng tại button có kí hiệu 3 chấm
     */
    onClickShowMenu() {
      this.showMore = !this.showMore
    },

    /**
     * Xuất dữ liệu ra file excel
     */
    clickOnExportBtn() {
      fetch(URL_EXPORT_LEADS, {
        method: 'GET',
        headers: {
          'Content-Type': 'text/csv',
        },
        responseType: 'blob',
      })
        .then(res => res.blob())
        .then(response => {
          const url = window.URL.createObjectURL(new Blob([response]))
          const link = document.createElement('a')
          link.href = url
          link.setAttribute('download', 'CRM_Lead_22.08.2022_11.42.26_709.xlsx')
          // document.body.appendChild(link)
          link.click()
          // document.body.removeChild(link)
        })
        .catch(error => console.log(error))
    },

    /**
     * Xử lý sự kiện reload dữ liệu tiềm năng
     */
    handleRefresh() {
      this.emitter.emit('refreshLeadData')
    },
  },
  created() {
    // Nhận sự kiện click vào 1 ô checkbox thì thay đổi số đếm bản ghi đang được chọn
    this.emitter.on('countSelect', i => {
      this.deleteSelectNumber = i
    })
  },
}
</script>

<style scoped>
.base-input-text-field input:focus,
.base-input-text-field .preventHover:focus {
  border: 1px solid #4262f0;
  background-color: #fff;
}
.base-input-text-field input {
  height: 32px;
  padding: 0 16px;
  padding-left: 30px;
  border-radius: 4px;
  outline: none;
  width: v-bind(width);
  background-color: #ffff;
  border: 1px solid transparent;
  -webkit-transition: border-color ease-in-out 0.15s,
    box-shadow ease-in-out 0.15s;
  transition: border-color ease-in-out 0.15s, box-shadow ease-in-out 0.15s;
}

/* .base-input-text-field input:hover {
  border-color: transparent;
} */
.base-input-text-field {
  display: flex;
}
.icon-search {
  position: absolute;
  top: 50%;
  transform: translateY(-50%);
  left: 8px;
}
.relative {
  position: relative;
}
.base-input-text-field {
}
.witdth-100 {
  width: 100%;
}
.icon--downblack--small {
  cursor: pointer;
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -48px -31px;
}
.all {
  position: relative;
}

.icon--16 {
  position: absolute;
  top: 8px;
  left: 8px;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 16px;
  height: 16px;
}
.icon--sort-setting {
  background: url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -272px -176px;
  width: 16px;
  height: 16px;
}

.icon--mountTag {
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -160px 0;
}

.icon--updateInfo {
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -128px 0;
}

.icon--selectTransaction {
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -335px -80px;
}

.icon--convert {
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -368px -457px;
}

.icon--handoverWork {
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -128px -176px;
}
.show-more__lists {
  padding: 8px 0;
  z-index: 99;
  position: absolute;
  transform-origin: left top;
  max-width: 280px;
  overflow: auto;
  border-radius: 4px;
  outline: 0;
  max-height: calc(100vh - 48px);
  min-width: 79px !important;
  min-height: 48px !important;
  box-shadow: 0 2px 6px #00000052;
  background: #fff;
}
.count-selected {
  font-family: Bold;
  color: #1f2229;
}

.icon-refresh-wrap {
  padding: 8px;
  cursor: pointer;
  margin-left: 12px;
}
.icon-refresh-wrap:hover {
  border-radius: 50%;
  background-color: #c5c9d3;
  z-index: 20;
}
.arrow_drop_down_16 {
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -48px -32px;
  cursor: pointer;
}
.icon-dropdown {
  text-transform: none !important;
  font-weight: 500 !important;
  /* border: 1px solid #d3d7de!important; */
  /* min-width: 64px; */
  /* height: 32px; */
  line-height: 20px !important;
  /* padding: 5px 8px; */
  /* border-radius: 4px; */
  -moz-background-clip: padding;
  /* -webkit-background-clip: padding-box; */
  /* background-clip: padding-box; */
  /* border: 1px solid #e2e4e9; */
  -ms-box-sizing: border-box;
  -o-box-sizing: border-box;
  /* box-sizing: border-box; */
  /* background-color: #fff; */
  color: #1f2229;
  /* font-size: 13px; */
  /* line-height: 13px; */
  /* font-family: Roboto,Arial,Helvetica,sans-serif; */
  /* font-weight: 400; */
  font-feature-settings: normal;
  font-variant: normal;
  /* cursor: pointer; */
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  /* transition: all .3s ease-in-out; */
  -moz-transition: all 0.3s ease-in-out;
  /* -webkit-transition: all .3s ease-in-out; */
  /* position: relative; */
  -ms-box-sizing: border;
  -o-box-sizing: border;
  box-sizing: border;
}

.icon-dropdown::after {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -128px -304px;
}
.switch-view-type {
  display: flex;
  text-transform: none !important;
  font-weight: 500 !important;
  border: 1px solid #d3d7de !important;
  height: 32px;
  width: 55px;
  line-height: 20px !important;
  padding: 7px;
  border-radius: 4px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  border: 1px solid #e2e4e9;
  -ms-box-sizing: border-box;
  -o-box-sizing: border-box;
  box-sizing: border-box;
  background-color: #fff;
  color: #1f2229;
  font-size: 13px;
  line-height: 13px;
  font-family: Roboto, Arial, Helvetica, sans-serif;
  font-weight: 400;
  font-feature-settings: normal;
  font-variant: normal;
  cursor: pointer;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -webkit-transition: all 0.3s ease-in-out;
  position: relative;
}
.switch-view-type:hover {
  background-color: #f0f2f4;
}

.show-menu {
  margin-right: 8px;
  position: relative;
}
.button-more {
  width: 36px;
  text-transform: none !important;
  font-weight: 500 !important;
  border: 1px solid #d3d7de !important;
  min-width: 34px;
  height: 32px;
  border-radius: 4px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  border: 1px solid #e2e4e9;
  -ms-box-sizing: border-box;
  -o-box-sizing: border-box;
  box-sizing: border-box;
  background-color: #fff;
  color: #1f2229;
  font-size: 13px;
  line-height: 13px;
  font-family: Roboto, Arial, Helvetica, sans-serif;
  font-weight: 400;
  font-feature-settings: normal;
  font-variant: normal;
  cursor: pointer;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -webkit-transition: all 0.3s ease-in-out;
  position: relative;
  -ms-box-sizing: border;
  -o-box-sizing: border;
  box-sizing: border;
}

.button-more:hover {
  background-color: #f0f2f4;
}

.button-more::before {
  content: '';
  width: 16px;
  height: 16px;
  display: inline-block;
  background: transparent url('../../assets/Resource/img/icon_collection.svg')
    no-repeat -48px 0;
}
.function__right {
  display: flex;
}
.function {
  min-height: 56px;
  width: 100%;
  background-color: rgb(226, 228, 233);
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 16px;
  border-bottom: 1px solid rgb(214, 218, 224);
}
.function__left {
  display: flex;
  align-items: center;
}
.function-title {
  display: flex;
  align-items: center;
  margin-right: 18px;
}
.function-title > p {
  font-size: 20px;
  font-family: bold;
  cursor: pointer;
}
.icon-down {
  margin-left: 4px;
  cursor: pointer;
}

.function-fix {
  display: flex;
  align-items: center;
  margin-top: 2px;
  z-index: 99;
}

.function-fix > p {
  color: rgb(64, 94, 236);
}
.function-fix > p:hover {
  text-decoration: underline;
  cursor: pointer;
}
.icon-refresh {
}

.link {
  text-decoration: none;
}
</style>
