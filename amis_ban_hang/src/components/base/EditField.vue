<template>
  <div class="content__row">
    <div class="fieldName">
      <div class="show-tooltip">
        {{ fieldName }}
        <TooltipComp :contentTooltip="fieldName" />
      </div>
      <div v-if="this.hasToolTipIcon" class="icon-tooltip show-tooltip">
        <TooltipComp :contentTooltip="fullToolTipContent" />
      </div>
    </div>
    <div class="content__input">
      <div class="content__edit" v-if="showEdit">
        <BaseDropDown dropdownContent="-Không chọn-" color="#99a1b2" />
        <div class="row">
          <div class="icon-check"></div>
          <div class="icon-close" @click="toggleShowEdit()"></div>
        </div>
      </div>
      <div class="content__detail" v-else>
        <div class="content__detail-input">
          <span>{{ dataField }}</span>
        </div>
        <div
          class="icon-pencil"
          style="display: none"
          @click="toggleShowEdit()"
        ></div>
      </div>
    </div>
  </div>
</template>

<script>
import BaseDropDown from '@/components/base/DropDownMenu.vue'
import TooltipComp from '@/components/base/TooltipComp.vue'
export default {
  name: 'EditField',
  components: {
    BaseDropDown,
    TooltipComp,
  },
  props: {
    fieldName: {
      type: String,
      require,
    },
    dataField: {
      type: String,
      require,
      default: '',
    },
    leadDetails: {
      type: Object,
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
  },
  data() {
    return {
      active: false,
      showEdit: false,
    }
  },
  methods: {
    /**
     * Bật tắt chức năng sửa
     */
    toggleShowEdit() {
      this.showEdit = !this.showEdit
    },
  },
}
</script>

<style scoped>
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
.content {
  padding: 16px;
}

.sticky {
  position: fixed;
  top: calc(84px + 86px);
  width: 100%;
  z-index: 10;
}

.sticky + .content {
  padding-top: 60px;
}

.main__potential {
  margin-bottom: 20px;
}

.main__title {
  margin: 0 56px 4px;
  font-size: 18px;
}

.main__content {
  display: flex;
  flex-direction: row;
  padding: 8px 56px;
}

.content__col {
  display: flex;
  flex-direction: column;
  flex: 1;
}

.content__row {
  display: flex;
  align-items: center;
  cursor: context-menu;
}

.fieldName {
  min-width: 160px;
  height: 32px;
  line-height: 32px;
  align-items: center;
  display: flex;
}

.content__input {
  width: 100%;
  min-height: 32px;
}

.content__detail {
  display: flex;
  align-items: center;
}

.content__detail-input {
  width: calc(100% - 16px);
  height: 32px;
  border-bottom: 1px solid #ccc;
  min-width: 200px;
  padding-left: 16px;
  color: #1f2229;
  padding-right: 30px;
  box-sizing: border-box;
  display: flex;
  align-items: center;
}

.content__row:hover .icon-pencil {
  display: inline-block !important;
}

.content__edit {
  display: flex;
  align-items: center;
}

.content__edit .row {
  margin-left: 4px;
  width: 56px;
  height: 16px;
  justify-content: flex-end;
  box-sizing: border-box;
}

.content__edit .row div {
  margin-left: 12px;
}

/* end: main */
.icon-back {
  content: '';
  width: 24px;
  height: 24px;
  display: inline-block;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat 0 -362px;
  vertical-align: bottom;
}

.icon-open-popup {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -144px -176px;
}

.icon-info-blue {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -256px -256px;
}

.icon-pencil {
  display: inline-block;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -128px 0;
  cursor: pointer;
  vertical-align: middle;
  width: 16px;
  height: 16px !important;
  display: block;
}

.icon-check {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -128px -16px;
}

.icon-close {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -256px -96px;
}
</style>
