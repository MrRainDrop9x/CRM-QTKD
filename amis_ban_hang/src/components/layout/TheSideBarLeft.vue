<template>
  <div class="position-relative">
    <div class="side-bar-left" :class="{ toggle: isOpen }">
      <div class="saved_filter">
        <p>Bộ lọc đã lưu</p>
        <div><div class="icon-down"></div></div>
      </div>
      <div class="lead-filter">
        <p>LỌC TIỀM NĂNG THEO</p>
        <div><div class="icon-search"></div></div>
      </div>
      <div class="fillters">
        <div
          v-for="filter in LEAD_FILTERS"
          :key="filter.id"
          class="filter-item"
        >
          <BaseCheckbox :id="filter.id" />
          <label
            :for="`checkbox--${filter.id}`"
            class="filter-content show-tooltip"
            >{{ filter.filter }} <TooltipComp :contentTooltip="filter.filter"
          /></label>
        </div>
      </div>
    </div>
    <div
      class="collapse-left-sidebar"
      :class="{ changeIcon: isOpen === true }"
      @click="toggleCollapse"
    ></div>
  </div>
</template>

<script>
import BaseCheckbox from '../base/BaseCheckbox.vue'
import LEAD_FILTERS from '../../constants/lead-filters'
import TooltipComp from '../base/TooltipComp.vue'
export default {
  name: 'TheSideBarLeft',
  components: {
    BaseCheckbox,
    TooltipComp,
  },
  data() {
    return {
      LEAD_FILTERS,
      isOpen: false,
    }
  },
  methods: {
    toggleCollapse() {
      this.isOpen = !this.isOpen
    },
  },
}
</script>

<style scoped>
.fillters {
  /* overflow-y: scroll; */
  height: 100%;
  margin-right: -16px;
}

.fillters::-webkit-scrollbar {
  display: none;
}

.fillters:hover::-webkit-scrollbar {
  display: block;
}

.fillters::-webkit-scrollbar-thumb {
  opacity: 0;
  transition: all 1s ease;
}

.fillters:hover::-webkit-scrollbar-thumb {
  opacity: 1;
}

.position-relative {
  position: relative;
}
.toggle {
  display: none;
}
.icon-down {
  cursor: pointer;
}

.collapse-left-sidebar {
  cursor: pointer;
  box-shadow: 1px 0 4px #00000029;
  border-radius: 0 6px 6px 0;
  background-color: #fff;
  z-index: 20;
  position: absolute;
  right: -13px;
  top: calc(50% - 20px);
  width: 12px !important;
  height: 40px !important;
  padding: 12px 0 !important;
  display: inline-block;
}

.collapse-left-sidebar:hover {
  width: 20px !important;
  right: -20px;
}

.collapse-left-sidebar::before {
  margin-left: -2px;
  content: '';
  width: 16px;
  height: 16px;
  display: inline-block;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -16px -32px;
}

.collapse-left-sidebar:hover.collapse-left-sidebar::before {
  margin-left: 0px;
}

.changeIcon::before {
  content: '';
  width: 16px;
  height: 16px;
  display: inline-block;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat 0px -32px;
}
.side-bar-left {
  width: 249px;
  height: 100%;
  border-right: 1px solid rgb(222, 225, 230);
  padding: 0 16px;
  padding-top: 20px;
  position: relative;
}

.saved_filter {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 32px;
}
.saved_filter > p {
  text-transform: uppercase;
  color: #586074;
}
.saved_filter > div {
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 4px;
  border-radius: 50%;
  cursor: pointer;
}
.saved_filter > div:hover {
  background-color: #e2e4e9;
}
.lead-filter {
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 20px;
}
.lead-filter > p {
  text-transform: uppercase;
  color: #586074;
}
.filter-item {
  display: flex;
  margin-bottom: 16px;
  cursor: default;
}

.filter-content {
  margin-left: 8px;
}
</style>
