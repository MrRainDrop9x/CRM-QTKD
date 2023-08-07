<template>
  <div class="lead-details">
    <div class="lead-details__content">
      <div class="lead-header">
        <div class="lead-header__left">
          <div class="lead-info">
            <div class="lead-avt">
              <router-link to="/crm/lead/list">
                <div class="icon-back_24"></div>
              </router-link>
              <div class="img-default">
                <div class="lead-avatar">H</div>
              </div>
            </div>
            <div class="lead-name">
              <div class="lead-name__title">
                {{ leadName }}
              </div>
              <div class="header-info-item">
                <p>Thêm thẻ</p>
              </div>
            </div>
          </div>
        </div>
        <div class="lead-header__right">
          <button @click="goToEditForm" class="link-to-edit">
            <span>Sửa</span>
          </button>
        </div>
      </div>
      <div class="ps-content">
        <div class="content__info-basic"></div>
        <div class="group-menu">
          <div class="item-tab selected">
            Thông tin chi tiết
            <div class="underline-bottom"></div>
          </div>
          <div class="item-tab">Ghi chú</div>
          <div class="item-tab">Tài liệu đính kém</div>
          <div class="item-tab">Hàng hóa quan tâm</div>
          <div class="item-tab">Chiến dịch</div>
          <div class="item-tab">Email</div>
        </div>
        <div class="content__top">
          <BaseTextField
            placeholder="Tìm kiếm trường"
            hasIconSearch
            backgroundColor="#fff"
            width="240px"
            borderColor="#d3d7de"
          />
        </div>
        <!-- Thông tin chung -->
        <div class="content-field">
          <h1>Thông tin chung</h1>
          <div class="content-field-row">
            <div class="content-field-row__left">
              <EditField
                v-for="field in GROUP_FIELD_1"
                :fieldName="field.label"
                :key="field.id"
                :leadDetails="this.leadDetails"
                :hasToolTipIcon="field.hasToolTipIcon"
                :fullToolTipContent="field.fullToolTipContent"
                :dataField="leadDetails[resoucesVNtoEN[field.label]] || ''"
              />
            </div>
            <div class="content-field-row__right">
              <EditField
                v-for="field in GROUP_FIELD_2"
                :fieldName="field.label"
                :key="field.id"
                :dataField="leadDetails[resoucesVNtoEN[field.label]]"
              />
            </div>
          </div>
        </div>

        <!-- Thông tổ chức -->
        <div class="content-field margin-top-28">
          <h1>Thông tin tổ chức</h1>
          <div class="content-field-row">
            <div class="content-field-row__left">
              <EditField
                v-for="field in GROUP_FIELD_3"
                :fieldName="field.label"
                :key="field.id"
                :leadDetails="this.leadDetails"
                :hasToolTipIcon="field.hasToolTipIcon"
                :fullToolTipContent="field.fullToolTipContent"
                :dataField="leadDetails[resoucesVNtoEN[field.label]]"
              />
            </div>
            <div class="content-field-row__right">
              <EditField
                v-for="field in GROUP_FIELD_4"
                :fieldName="field.label"
                :key="field.id"
                :dataField="leadDetails[resoucesVNtoEN[field.label]]"
              />
            </div>
          </div>
        </div>

        <!-- Thông tin địa chỉ -->
        <div class="content-field margin-top-28">
          <h1>Thông tin địa chỉ</h1>
          <div class="content-field-row">
            <div class="content-field-row__left">
              <EditField
                v-for="field in GROUP_FIELD_5"
                :fieldName="field.label"
                :key="field.id"
                :leadDetails="this.leadDetails"
                :hasToolTipIcon="field.hasToolTipIcon"
                :fullToolTipContent="field.fullToolTipContent"
                :dataField="leadDetails[resoucesVNtoEN[field.label]]"
              />
            </div>
            <div class="content-field-row__right">
              <EditField
                v-for="field in GROUP_FIELD_6"
                :fieldName="field.label"
                :key="field.id"
                :dataField="leadDetails[resoucesVNtoEN[field.label]]"
              />
            </div>
          </div>
        </div>

        <!-- Thông tin địa chỉ -->
        <div class="content-field margin-top-28">
          <h1>Thông tin hệ thống</h1>
          <div class="content-field-row">
            <div class="content-field-row__left">
              <EditField
                v-for="field in GROUP_FIELD_7"
                :fieldName="field.label"
                :key="field.id"
                :leadDetails="this.leadDetails"
                :hasToolTipIcon="field.hasToolTipIcon"
                :fullToolTipContent="field.fullToolTipContent"
                :dataField="leadDetails[resoucesVNtoEN[field.label]]"
              />
            </div>
            <div class="content-field-row__right">
              <EditField
                v-for="field in GROUP_FIELD_8"
                :fieldName="field.label"
                :key="field.id"
                :dataField="leadDetails[resoucesVNtoEN[field.label]]"
              />
            </div>
          </div>
        </div>

        <div
          style="width: 100%; height: 170px; background-color: transparent"
        ></div>
      </div>
      <!-- <div style="width: 100%; height: 40px"></div> -->
    </div>
    <div class="side-bar-right-wrap">
      <TheSideBarRight />
    </div>
  </div>
</template>

<script>
import fetchAPI from '@/utils/fetchAPI'
import { URL_LEADS_API } from '@/constants/url'
import TheSideBarRight from '../layout/TheSideBarRight.vue'
import BaseTextField from '@/components/base/BaseTextField.vue'
import * as GROUP_FIELD from '../../constants/fileld-add-form'
import EditField from '../base/EditField.vue'
import resoucesVN from '@/constants/resoucesVN'
export default {
  name: 'LeadDetails',
  components: {
    TheSideBarRight,
    BaseTextField,
    EditField,
  },

  data() {
    // Biến lưu trữ giữ liệu tiềm năng
    let leadDetails
    let resoucesVNtoEN = resoucesVN
    // Các trường thông tin tương ứng
    const GROUP_FIELD_1 = GROUP_FIELD.GROUP_FILED_1
    const GROUP_FIELD_2 = GROUP_FIELD.GROUP_FILED_2
    const GROUP_FIELD_3 = GROUP_FIELD.GROUP_FILED_3
    const GROUP_FIELD_4 = GROUP_FIELD.GROUP_FILED_4
    const GROUP_FIELD_5 = GROUP_FIELD.GROUP_FILED_5
    const GROUP_FIELD_6 = GROUP_FIELD.GROUP_FILED_6
    const GROUP_FIELD_7 = GROUP_FIELD.GROUP_FILED_7
    const GROUP_FIELD_8 = GROUP_FIELD.GROUP_FILED_8

    let leadName
    return {
      resoucesVNtoEN,
      leadID: this.$route.params.id,
      leadDetails,
      GROUP_FIELD_1,
      GROUP_FIELD_2,
      leadName,
      GROUP_FIELD_3,
      GROUP_FIELD_4,
      GROUP_FIELD_5,
      GROUP_FIELD_6,
      GROUP_FIELD_7,
      GROUP_FIELD_8,
    }
  },
  methods: {
    showEditFunc() {
      this.showEdit = !this.showEdit
    },

    goToEditForm() {
      this.$router.push({ path: `/lead/edit/${this.leadDetails.LeadCode}` })
    },
  },
  created() {
    /**
     * Lấy 1 bản ghi tiềm năng theo id
     */
    const getLeadDetailsByID = async () => {
      try {
        this.leadDetails = await fetchAPI(
          `${URL_LEADS_API}/${this.leadID}`,
          'GET'
        )
        this.leadName =
          this.leadDetails.LastName + ' ' + this.leadDetails.FirstName
      } catch (error) {
        console.log(error)
      }
    }

    getLeadDetailsByID()
  },
  mounted() {
    // console.log(this.resoucesVNtoEN)
  },
}
</script>

<style scoped>
.link-to-edit {
  display: block;
  margin-right: 8px;
  cursor: pointer;
  outline: none;
  border: none;
  padding: 5px 16px 5px 8px;
  display: flex;
  align-items: center;
  min-width: 64px;
  height: 32px;
  line-height: 20px !important;
  border-radius: 4px;
  -webkit-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
  position: relative;
}

.link-to-edit span {
  margin-left: 5px;
}
.link-to-edit:hover {
  background-color: #d3d7de;
  border-color: #d3d7de;
  border-radius: 4px;
}
.link-to-edit::before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -128px 0;
}
.selected {
  color: #4262f0;
  font-family: Bold;
  position: relative;
}

.underline-bottom {
  position: absolute;
  height: 2px;
  width: 100%;
  background-color: #4262f0;
  top: 91.5%;
}
.content-field-row__left {
  margin-right: 80px;
}
.content-field-row__right,
.content-field-row__left {
  flex-shrink: 1;
  flex-basis: 50%;
  display: flex;
  flex-direction: column;
}
.content-field {
  padding: 0 16px;
}

.margin-top-28 {
  margin-top: 28px;
}

.content-field > h1 {
  font-weight: normal;
  font-size: 18px;
  margin-top: 2px;
  font-family: Bold;
}

.content-field-row {
  padding: 8px 0;
  display: flex;
}
.content__row {
  display: flex;
  height: 4rem;
  margin: 2px 0;
  padding: 4px 0;
}
.content__top {
  width: 100%;
  padding: 16px;
}

.content__info-basic {
  height: 102px;
}

.item-tab {
  height: 40px;
  white-space: nowrap;
  box-sizing: border-box;
  margin: 0 18px;
  cursor: pointer;
  position: relative;
  display: flex;
  align-items: center;
  width: max-content;
}
.item-tab:hover {
  color: #4262f0;
}
.group-menu {
  position: sticky;
  border-top: solid 1px #d3d7de;
  border-bottom: solid 1px #d3d7de;
  background: #f0f2f4;
  min-height: 40px;
  height: 40px;
  overflow: hidden;
  padding-right: 16px;
  width: 100%;
  height: 40px;
  display: flex;
}
.ps-content {
  width: 100%;
  height: 100%;
  overflow-y: scroll;
  position: relative;
}
.header-info-item > p {
  cursor: pointer;
  color: #4262f0 !important;
  margin-right: 8px !important;
  font-family: Regular;
}
.lead-name__title {
  font-size: 18px;
  font-family: Bold;
  height: 100%;
}
.header-info-item {
  position: relative;
  padding-right: 16px;
}

.lead-name {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  height: auto;
}
.lead-avt a {
  margin-right: 16px;
}

.lead-avt {
  display: flex;
  align-items: center;
  justify-content: space-between;
}
a {
  text-decoration: none;
}
.lead-avatar {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  text-align: center;
  color: #fff;
  font-size: 28px;
  background-color: #ff80ab;
  display: flex;
  align-items: center;
  justify-content: center;
  text-decoration: none;
}

.img-default {
  margin: 0 16px 0 0;
  min-width: 48px;
  width: 48px;
  height: 48px;
  margin-right: 16px;
  border: 1px solid #d3d7de !important;
  border-radius: 50% !important;
  position: relative;
  line-height: 48px;
}
.icon-back_24:hover {
  background-color: #d3d7de;
  border-radius: 50%;
}
.icon-back_24:before {
  content: '';
  width: 24px;
  height: 24px;
  display: inline-block;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat 0 -362px;
  vertical-align: bottom;
}
.lead-info {
  display: flex;
  margin-top: 5px;
}
.lead-details {
  width: 100vw;
  height: 100%;
  display: flex;
}
.lead-details__content {
  height: 100%;
  flex: 1;
}

.lead-header {
  padding: 16px 16px 24px;
  display: flex;
  justify-content: space-between;
  height: 98px;
  position: sticky;
}

::-webkit-scrollbar {
  width: 8px;
  height: 8px;
  background-color: transparent;
  opacity: 0;
}
::-webkit-scrollbar-thumb {
  border: 1px solid transparent;
  border-radius: 10px;
  background: rgba(197, 201, 211, 0);
  background-clip: content-box;
  -webkit-background-clip: content-box;
  transition: all 0.5s ease-in-out;
  opacity: 0;
}
::-webkit-scrollbar-track {
  background: #f1f1f1;
}

::-webkit-scrollbar-track {
  background: transparent !important;
}

.ps-content:hover::-webkit-scrollbar-thumb {
  background: rgba(197, 201, 211, 0.75);
  opacity: 1;
}
</style>
