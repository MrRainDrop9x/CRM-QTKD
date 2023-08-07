<template>
  <div :id="id" class="dropdown">
    <button
      type="button"
      @click="isOpen = !isOpen"
      :class="{ isActive: isOpen }"
    >
      <div class="test">{{ refContent || dropdownContent }}</div>
      <div class="icon-down icon"></div>
    </button>
    <div class="dropdown-list" v-if="isOpen">
      <div v-show="hasInputSearch" class="select-search-dropdown">
        <input
          placeholder="Tìm kiếm"
          type="search"
          class="select-search__field"
        />
      </div>
      <DropDownItem
        :class="{ activeItem: this.refContent === item.text }"
        @changeContent="changeContent"
        v-for="(item, index) in arrays"
        :key="index"
        :item="item"
        :closeDropdown="callToClose"
      >
        {{ item.text }}
      </DropDownItem>
    </div>
  </div>
</template>

<script>
import DropDownItem from './DropDownItem.vue'
import uuid from '@/utils/random-id'
export default {
  components: {
    DropDownItem,
  },
  setup() {
    return {
      id: uuid(),
    }
  },
  data() {
    return {
      isOpen: false,
      refContent: '10 Bản ghi trên Trang',
    }
  },

  props: {
    arrays: {
      type: Array,
      default: () => [],
    },
    dropdownContent: {
      type: String,
      required: true,
    },
    inputSearch: {
      type: Boolean,
      default: false,
    },
  },
  methods: {
    // Hàm thực hiện việc đóng DropDown
    callToClose() {
      this.isOpen = false
    },
    // Nếu click ra ngoài, drop down menu tắt
    onClick(event) {
      if (!document.getElementById(this.id).contains(event.target)) {
        this.isOpen = false
      }
    },
    // Thay đổi content của dropmenu
    changeContent(content) {
      this.refContent = content
    },
    // Kiểm tra props được truyền vào có input search không ?
  },
  computed: {
    hasInputSearch() {
      return this.inputSearch
    },
  },
  created() {
    window.addEventListener('click', this.onClick)
  },
  beforeUnmount() {
    window.removeEventListener('click', this.onClick)
  },
}
</script>

<style scoped>
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

button {
  position: relative;
  padding: 0 8px 0 16px;
  background-color: white;
  border: 1px solid black;
  cursor: pointer;
  transition: 0.3s;
  height: 32px;
  width: 100%;
  border: 1px solid #d3d7de;
  padding-left: 16px;
  padding-right: 8px;
  border-radius: 4px;
  -moz-background-clip: padding;
  -webkit-background-clip: padding-box;
  background-clip: padding-box;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
button:focus {
  outline: 0px;
}

.dropdown {
  position: relative;
  width: fit-content;
  cursor: pointer;
  background: #ffffff;
  min-width: 182px;
  position: relative;
}
.dropdown-list {
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
}
</style>
