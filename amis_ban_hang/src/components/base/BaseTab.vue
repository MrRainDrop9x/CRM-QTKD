<template>
  <li class="m-tab" :class="{ checked: isChecked }">
    <router-link :to="tabContent === 'Tiềm năng' ? '/crm/lead/list' : '/'">
      <div class="item-menu">
        <slot></slot>
        <div class="tab-content">{{ tabContent }}</div>
        <span></span>
      </div>
    </router-link>
  </li>
</template>

<script>
export default {
  props: {
    // chỉ định nội dung cho tab
    tabContent: {
      type: String,
      required: true,
    },

    // tab có đang được chọn không ?
    checked: {
      type: Boolean,
      default: false,
    },
  },

  computed: {
    // hàm kiểm tra: slider tab có được chọn không ?
    isChecked() {
      return this.checked
    },
  },
}
</script>

<style>
.m-tab__icon {
  margin-top: 2px;
}
.m-tab {
  cursor: pointer;
  display: inline-block;
  height: 4rem;
  outline: none;
}
.m-tab > a {
  border-radius: 4px;
  padding: 0 16px;
  height: 36px;
  text-decoration: none;
  font-size: 13px;
  color: #586074;
  display: flex;
  align-items: center;
  opacity: 1;
  outline: none;
}

.m-tab:not(.checked) > a:hover {
  opacity: 1;
  background-color: #f0f2f4;
  transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -webkit-transition: all 0.3s ease-in-out;
}

.item-menu {
  width: 100%;
  height: 37px;
  color: #1f2229;
  display: flex;
  align-items: center;
  position: relative;
}
.tab-content {
  margin-left: 8px;
  margin-top: 4px;
  font-family: Roboto, Arial, Helvetica, sans-serif;
}

.m-tab.checked span {
  position: absolute;
  background-color: #4262f0;
  height: 2px;
  width: 100%;
  top: calc(100% + 1px);
}

.m-tab.checked .tab-content {
  color: #4262f0;
  font-weight: 500;
  font-size: 13px;
  font-family: Bold;
}
</style>
