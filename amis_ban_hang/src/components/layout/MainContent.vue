<template>
  <div class="content">
    <div class="table-wrap">
      <table class="table" ref="exportable_table">
        <thead>
          <tr>
            <th>
              <div
                title="Tùy chỉnh cột"
                class="btn-settings-column icon-sticky-setting-column"
              >
                <span class="icon-add_colums_16"></span>
              </div>
            </th>
            <th class="inline-flex">
              <BaseCheckbox
                style="margin-left: -1px"
                checkboxAll
                :checked="this.isCheckAll"
                @checkAll="handleCheckAll"
                id="iconCheckAll"
              />
            </th>
            <th
              class="text-align-left relative"
              style="min-width: 100px; padding-right: 10px; padding-left: 20px"
            >
              Thẻ
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 100px">
              Xưng hô
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 146px">
              Họ và tên
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 100px">
              Chức danh
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative">
              ĐT di động
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative">
              ĐT cơ quan
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative">
              Email cơ quan
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative">
              Email cá nhân
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative">
              Tổ chức
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 100px">
              Địa chỉ
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 150px">
              Tỉnh/Thành phố
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Quận/Huyện
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Phường/Xã
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Nguồn gốc
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Loại hình
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative">
              Lĩnh vực
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative">
              Mô tả
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Bố cục
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Chủ sở hữu
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 170px">
              Doanh thu/ Ngân sách
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Dùng chung
              <div class="icon-search-grid"></div>
            </th>
            <th class="text-align-left relative" style="min-width: 120px">
              Facebook
              <div class="icon-search-grid"></div>
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="lead in LEAD_DATA"
            :key="lead.leadID"
            :class="{ 'row-checked': lead.checked }"
            @dblclick="dbClickOnTableRow(lead.leadCode)"
          >
            <td>
              <div
                class="icon-row-edit"
                @click="clickOnRowEditIcon(lead.leadCode)"
              ></div>
            </td>
            <td class="inline-flex">
              <BaseCheckbox
                :checked="lead.checked"
                :id="lead.leadID"
                @checkboxItem="handleCheckBoxItem"
              />
            </td>
            <td class="text-align-left"></td>
            <td class="text-align-left">
              {{ lead.salutationName || '-' }}
            </td>
            <td class="text-align-left text--blue">
              {{
                lead.lastName
                  ? lead.lastName + ' ' + lead.firstName
                  : lead.firstName
              }}
            </td>
            <td class="text-align-left">
              {{ lead.titleName || '-' }}
            </td>
            <td class="text-align-left">
              <div class="text--icon">
                <div v-if="lead.mobile" class="icon-tel"></div>
                <div class="text--blue">{{ lead.mobile || '-' }}</div>
              </div>
            </td>
            <td class="text-align-left text--blue">
              <div class="text--icon">
                <div v-if="lead.officeMobile" class="icon-tel"></div>
                <div class="text--blue">{{ lead.officeMobile || '-' }}</div>
              </div>
            </td>
            <td>{{ lead.officeEmail || '-' }}</td>
            <td class="text--blue">{{ lead.email || '-' }}</td>
            <td>{{ lead.companyName || '-' }}</td>
            <td class="text-eclip">{{ lead.address || '-' }}</td>
            <td>{{ lead.provinceName || '-' }}</td>
            <td>{{ lead.districtName || '-' }}</td>
            <td>{{ '-' }}</td>
            <td>{{ lead.leadSourceName }}</td>
            <td>{{ lead.leadTypeName || '-' }}</td>
            <td>{{ lead.sectorName || '-' }}</td>
            <td>{{ lead.description || '-' }}</td>
            <td>-</td>
            <td>-</td>
            <td>{{ lead.annualRevenueName || '-' }}</td>
            <td>-</td>
            <td>-</td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="navigate">
      <div class="navigate__left">
        <div class="ic-sort-setting-16" title="Tùy chỉnh trường"></div>
        <span
          >Tổng số:
          <span class="bold" style="margin-left: 10px">{{
            this.totalRecord
          }}</span>
        </span>
      </div>
      <div class="navigate__right">
        <div>
          <DropDownMenu
            :arrays="CHANGE_PAGE_SIZE"
            dropdownContent="10 Bản ghi trên trang"
          />
        </div>
        <div class="pagination-icon">
          <div
            class="icon-pre2"
            :class="{ unClickable: this.currentPage == 1 }"
            @click="prevToFirstPage"
          ></div>
          <div
            class="icon-pre1"
            :class="{ unClickable: this.currentPage == 1 }"
            @click="prevPageEvent"
          ></div>

          <div class="navigate__text" style="font-weight: 500">
            <span class="bold" style="margin-right: 8px">{{
              this.currentPage
            }}</span>
            đến
            <span class="bold" style="margin-left: 8px">{{
              this.totalPage
            }}</span>
          </div>
          <div
            class="icon-next1"
            :class="{ unClickable: this.currentPage == this.totalPage }"
            @click="nextPageEvent"
          ></div>
          <div
            class="icon-next2"
            :class="{ unClickable: this.currentPage == this.totalPage }"
            @click="nextToEndPage"
          ></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseCheckbox from '../base/BaseCheckbox.vue'
import DropDownMenu from '../base/DropDownMenu.vue'
import CHANGE_PAGE_SIZE from '../../constants/change-page-size'
import LEAD_DATA from '@/constants/lead-data'
import { URL_LEADS_API } from '@/constants/url'
import fetchAPI from '@/utils/fetchAPI'
import { mapState, mapMutations, mapActions, mapGetters } from 'vuex'

export default {
  name: 'MainContent',
  components: { BaseCheckbox, DropDownMenu },

  setup() {
    return {
      CHANGE_PAGE_SIZE,
      isCheckAll: false,
    }
  },
  data() {
    let dataFilter = {
      pageSize: 10,
      pageNumber: 1,
      searchWord: '',
    }
    return {
      ...mapState(['changeCheckBox', 'leadsIDNeedDelete']),
      LEAD_DATA,
      dataFilter,
    }
  },
  methods: {
    /**
     * Sự kiện tích toàn bộ các hàng
     */
    handleCheckAll() {
      this.isCheckAll = !this.isCheckAll
      if (this.isCheckAll) {
        // Đánh dấu đã tích vào ít nhất một hàng tiềm năng
        this.selectedCheckBox()

        this.LEAD_DATA = this.LEAD_DATA.map(lead => ({
          ...lead,
          checked: true,
        }))

        let countedSelect = 0
        // Trả về tổng số bản ghi được chọn để xóa
        for (let i = 0; i < this.LEAD_DATA.length; i++) {
          if (this.LEAD_DATA[i].checked == true) {
            countedSelect += 1
          }
        }
        this.emitter.emit('countSelect', countedSelect)
      } else {
        // Đánh dấu là chưa tích vào hàng dữ liệu nào
        this.unSelectedCheckBox()

        this.LEAD_DATA = this.LEAD_DATA.map(lead => ({
          ...lead,
          checked: false,
        }))
      }
    },

    /**
     * Sự kiện tích vào từng ô trên mỗi hàng
     * @param {*} idCheckBox
     */
    handleCheckBoxItem(idCheckBox) {
      // Chỉ số checkbox
      let index = -1
      this.LEAD_DATA = this.LEAD_DATA.map((lead, i) => {
        if (lead.leadID === idCheckBox) {
          index = i
          return { ...lead, checked: !lead.checked }
        }
        return { ...lead }
      })

      let countedSelect = 0
      // Trả về tổng số bản ghi được chọn để xóa
      for (let i = 0; i < this.LEAD_DATA.length; i++) {
        if (this.LEAD_DATA[i].checked == true) {
          countedSelect += 1
        }
      }
      this.emitter.emit('countSelect', countedSelect)

      if (this.LEAD_DATA.every(lead => lead.checked === false)) {
        // Đánh dấu là chưa tích vào hàng dữ liệu nào
        this.unSelectedCheckBox()
      }

      if (this.LEAD_DATA[index].checked) {
        // Đánh dấu đã tích vào ít nhất một hàng tiềm năng
        this.selectedCheckBox()

        // Thêm tiềm id của tiềm năng cần xóa
        this.addItemLeadsID(idCheckBox)
      } else {
        // Xóa id tiềm năng khỏi danh sách cần xóa
        this.removeItemLeadsID(idCheckBox)
      }
    },

    /**
     * Sự kiện double click vào các hàng dữ liệu thì chuyển qua
     * chi tiết tiềm năng
     * @param {*} leadCode
     */
    dbClickOnTableRow(leadCode) {
      this.$router.push({ path: `/lead/view/${leadCode}` })
    },

    /**
     * Click vào icon edit thì chuyển qua page edit
     * @param {*} leadCode
     */
    clickOnRowEditIcon(leadCode) {
      this.$router.push({ path: `/lead/edit/${leadCode}` })
    },

    /**
     * Hàm lấy dữ liệu tiềm năng từ api
     */
    getLeadsData: async () => {
      try {
        return await fetchAPI(URL_LEADS_API, 'GET')
      } catch (error) {
        console.log(error)
      }
    },

    deleteLeadOnUI() {
      this.LEAD_DATA = this.LEAD_DATA.filter(lead => lead.checked === false)
    },

    /**
     * Lấy các phương thức global từ store
     */
    ...mapMutations([
      'selectedCheckBox',
      'unSelectedCheckBox',
      'addItemLeadsID',
      'removeItemLeadsID',
      'unSelectedCheckBox',
      'setTotalRecord',
      'setTotalPage',
      'setCurrentPage',
      'setCurrentPageRecords',
    ]),

    /**
     * Đến trang cuối
     * @Author:NHHAI (21/08/2022)
     */
    nextToEndPage() {
      if (this.currentPage !== this.totalPage) {
        let total = this.totalPage
        console.log(this.totalPage)
        this.currentPage = total
        this.dataFilter.pageNumber = total
      }
    },

    /**
     * Trở về trang đầu tiên
     * @Author:NHHAI (21/08/2022)
     */
    prevToFirstPage() {
      if (this.currentPage !== 1) {
        this.currentPage = 1
        this.dataFilter.pageNumber = 1
      }
    },

    /**
     * Chuyển về trang trước
     * @Author:NHHAI (21/08/2022)
     */
    prevPageEvent() {
      if (this.currentPage > 1) {
        this.setCurrentPage(this.currentPage - 1)
        this.dataFilter.pageNumber -= 1
      }
    },

    /**
     * Chuyển về trang sau
     * @Author:NHHAI (21/08/2022)
     */
    nextPageEvent() {
      if (this.currentPage < this.totalPage) {
        this.setCurrentPage(this.currentPage + 1)
        this.dataFilter.pageNumber += 1
      }
    },
    ...mapActions(['getLeadFromAPI']),
  },
  computed: {
    ...mapGetters([
      'totalPage',
      'totalRecord',
      'currentPage',
      'currentPageRecords',
    ]),
  },
  watch: {
    dataFilter: {
      deep: true,
      immediate: true,
      handler() {
        /**
         * Gọi hàm lấy dữ liệu và gán trường checked cho từng tiềm năng
         * @author: NNHAI 05/08/2022
         */
        const asyncMounted = async () => {
          this.LEAD_DATA = await (
            await this.getLeadFromAPI(this.dataFilter)
          ).data
          this.LEAD_DATA = this.LEAD_DATA?.map(lead => {
            return {
              ...lead,
              checked: false,
            }
          })
        }
        asyncMounted()
      },
    },
  },
  created() {
    /**
     * Gọi hàm lấy dữ liệu và gán trường checked cho từng tiềm năng
     * @author: NNHAI 05/08/2022
     */
    const asyncMounted = async () => {
      this.LEAD_DATA = await (await this.getLeadFromAPI(this.dataFilter)).data
      this.LEAD_DATA = this.LEAD_DATA?.map(lead => {
        return {
          ...lead,
          checked: false,
        }
      })
    }
    asyncMounted()

    /**
     * Xử lý sự kiện xóa tiềm năng
     * @author: NNHAI 05/08/2022
     */
    this.emitter.on('removeLead', () => {
      // Xóa hàng dữ liệu tiềm năng trong bảng
      this.deleteLeadOnUI()

      // Đưa component Function về mặc định
      this.unSelectedCheckBox()

      /**
       * Gọi hàm lấy dữ liệu và gán trường checked cho từng tiềm năng
       * @author: NNHAI 05/08/2022
       */
      const asyncMounted = async () => {
        this.LEAD_DATA = await (await this.getLeadFromAPI(this.dataFilter)).data
        this.LEAD_DATA = this.LEAD_DATA?.map(lead => {
          return {
            ...lead,
            checked: false,
          }
        })
      }
      asyncMounted()
    })

    /**
     * Bắt sự kiện thay đổi số bản ghi trên trang
     */
    this.emitter.on('changeContentGlobal', text => {
      if (text == '10 Bản ghi trên Trang') this.dataFilter.pageSize = 10
      if (text == '20 Bản ghi trên Trang') this.dataFilter.pageSize = 20
      if (text == '50 Bản ghi trên Trang') this.dataFilter.pageSize = 50
      if (text == '100 Bản ghi trên Trang') this.dataFilter.pageSize = 100
    })

    /**
     * thực hiện tìm kiếm
     */
    this.emitter.on('firedSearchFunction', contentInputSearch => {
      this.dataFilter.searchWord = contentInputSearch
    })

    /**
     * Hủy chọn toàn bộ
     */
    this.emitter.on('deselectAll', () => {
      this.LEAD_DATA = this.LEAD_DATA.map(lead => ({ ...lead, checked: false }))
      this.unSelectedCheckBox()
    })
  },

  mounted() {
    /**
     * Bắt sự kiện refresh dữ liệu
     * @Author: NHHAI 21/08/2022
     */
    this.emitter.on('refreshLeadData', () => {
      /**
       * Gọi hàm lấy dữ liệu và gán trường checked cho từng tiềm năng
       * @author: NNHAI 05/08/2022
       */
      const asyncMounted = async () => {
        this.LEAD_DATA = await (await this.getLeadFromAPI(this.dataFilter)).data
        this.LEAD_DATA = this.LEAD_DATA?.map(lead => {
          return {
            ...lead,
            checked: false,
          }
        })
      }
      asyncMounted()
    })
  },
}
</script>

<style scoped>
.unClickable {
  cursor: unset !important;
}
.text-eclip {
  white-space: nowrap;
  width: 50px;
  overflow: hidden;
  text-overflow: ellipsis;
}
.icon-pre2,
.icon-pre1,
.icon-next1,
.icon-next2 {
  cursor: pointer;
}
table thead {
  /* border-collapse: separate !important; */
  border-left: 1px solid #f0f2f4;
  border-right: 1px solid #f0f2f4;
}
table thead th {
  border-left: 1px solid #f0f2f4;
  /* border-right: 1px solid #f0f2f4; */
}
th:hover:not(th:nth-child(2)) {
  border-right: 1px solid rgb(222, 225, 230) !important;
  border-left: 1px solid rgb(222, 225, 230) !important;
}

th:hover .icon-search-grid {
  display: initial;
}

.relative {
  position: relative;
}

.icon-search-grid {
  position: absolute !important;
  top: 9px;
  padding: 3px;
  display: none;
  width: 22px;
  height: 22px;
  z-index: 1000;
  border-radius: 50%;
  right: 0;
}

.icon-search-grid:hover {
  background-color: #d3d7de !important;
}

.icon-search-grid:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection_v2.svg)
    no-repeat 0 -505px;
}
.icon-tel {
  display: inline-block;
  width: 16px;
  height: 16px;
  background-repeat: no-repeat;
  background-position: left center;
  cursor: pointer;
  vertical-align: middle;
  margin-right: 8px;
}
.icon-tel:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -320px -48px;
}

/* sticky thanh bên */
.table thead tr th:first-child,
.table tbody tr td:first-child {
  position: sticky;
  left: 0;
  width: 36px;
  box-sizing: border-box;
  border-right: 0px !important;
  border-left: 0px !important;
  z-index: 10;
  padding: 0;
}

.table thead tr th:first-child {
  background-color: #f0f2f4 !important;
}

.table tbody td:nth-child(2),
.table thead th:nth-child(2) {
  background-color: #fff !important;
  position: sticky;
  left: 36px;
  z-index: 10;
  padding: 0;
  padding-left: 1px;
  height: 40px;
}
.table tbody td:nth-child(1),
.table thead th:nth-child(1) {
  background-color: #fff !important;
}
.table thead th:nth-child(2) {
  background-color: #f0f2f4 !important;
}

.table tbody tr:hover > td:nth-child(1),
.table tbody tr:hover > td:nth-child(2) {
  background-color: #e2e4e9 !important;
}

.table tbody tr.row-checked td:nth-child(1),
.table tbody tr.row-checked td:nth-child(2) {
  background-color: #fdefe7 !important;
}

.table tbody tr.row-checked:hover td:nth-child(1),
.table tbody tr.row-checked:hover td:nth-child(2) {
  background-color: #fbded0 !important;
}

::-webkit-scrollbar {
  background-color: #f0f2f4;
  margin-top: 40px;
}

/* Track */
::-webkit-scrollbar-track {
  margin-top: 40px;
}

.table tbody tr.row-checked {
  background-color: #fdefe7 !important;
}
.table tbody tr.row-checked:hover {
  background-color: #fbded0 !important;
}

span.bold {
  font-weight: 700;
}
tr:hover .icon-row-edit {
  visibility: unset;
}
.icon-row-edit {
  visibility: hidden;
  text-align: center;
}
.icon-row-edit::before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -128px 0px;
}
.icon-sticky-setting-column {
  position: sticky;
  position: -webkit-sticky;
}
.pagination-icon {
  margin-left: 16px;
  display: flex;
  justify-content: space-around;
  flex: 1;
}
.ic-sort-setting-16:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -272px -176px;
}

.ic-sort-setting-16 {
  height: 24px !important;
  width: 24px !important;
  border-radius: 50%;
  cursor: pointer;
  display: flex;
  align-items: center;
}

.content {
  flex: 1;
  position: relative;
}

.table {
  width: 2600px;
  border-collapse: collapse;
  border-spacing: 0;
}

.table > thead > tr > th:first-child {
  width: 36px;
  padding-left: 5px;
  padding-right: 0;
}
.table thead tr {
  background-color: rgb(240 242 244);
}

.table thead tr th {
  font-weight: 700;
  /* display: fl; */
}

.tbody {
  display: block !important;
}

.table tbody tr td {
  font-weight: 500;
}

.table .text--blue {
  color: rgb(19, 59, 236);
}

.text--blue:hover {
  text-decoration: underline;
}

.text--icon {
  display: flex;
  align-items: center;
  line-height: 40px;
}

.table tr {
  height: 40px;
  border-bottom: 0.5px solid #d3d7de;
  cursor: pointer;
}
.table td {
  white-space: nowrap;
}
.table td,
th {
  padding: 0 12px;
  border: none;
  white-space: nowrap;
}

.table__checkbox {
  padding-left: 16px;
  padding-right: 10px;
}

.table tbody tr:hover {
  background-color: #e2e4e9 !important;
  z-index: 10000;
}

.th__120 {
  width: 160px;
  background-color: red;
  height: 48px;
}

.th__80 {
  width: 80px;
}

.th__60 {
  width: 60px;
}

.text-align-left {
  text-align: left;
}

.inline-flex {
  display: inline-flex;
}
.text-align-center {
  text-align: center;
}
table tr.row--selected {
  background-color: #dedede;
}

.table-wrap {
  /* padding: 0 10px; */
  box-sizing: border-box;
  width: 100%;
  position: absolute;
  top: 0;
  bottom: 56px;
  overflow: auto;
}

.m-table thead {
  position: sticky;
}

.navigate {
  width: 100%;
  background-color: white;
  height: 56px;
  position: absolute;
  top: calc(100% - 56px);
  box-sizing: border-box;
  border: 1px solid #d3d7de;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 16px 12px;
}

.navigate__left {
  font-weight: 500;
  display: flex;
  align-items: center;
}
.navigate__left > span {
  padding: 0 16px;
}

.navigate__right {
  display: flex;
  align-items: center;
  width: 370px;
}

.navigate__right button {
  height: 32px !important;
}

.icon-add_colums_16 {
  display: inline-block;
  cursor: pointer;
  vertical-align: middle;
  width: 16px;
  height: 16px;
  background: url('../../assets/Resource/img/icon_collection.svg') no-repeat 0 0;
}

.btn-settings-column {
  display: flex;
  align-items: center;
  justify-content: center;
  width: 24px;
  height: 24px;
}
.icon-sticky-setting-column {
  z-index: 1;
  top: 9px;
  right: 2px;
  background-color: #fff;
  border-radius: 50%;
  width: 24px;
  height: 24px;
  /* overflow: hidden; */
  box-shadow: 0 2px 6px #00000052;
}
.icon-sticky-setting-column:hover {
  background-color: #d3d7de;
  border-radius: 50%;
}
</style>
