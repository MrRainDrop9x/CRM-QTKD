<template>
  <div class="base-check-box">
    <input
      ref="test-input"
      :checked="checked"
      type="checkbox"
      :id="id"
      @click="handleCheckBoxAll"
    />
    <label :for="id"></label>
  </div>
</template>

<script>
import uuidv4 from '@/utils/random-id'

export default {
  name: 'BaseCheckBox',
  props: {
    // id của button
    id: {
      type: String,
      default: uuidv4(),
    },
    // Kiểm tra xem có checked không
    checked: {
      type: Boolean,
      default: false,
    },
    // Đối tượng object có chức năng checkAll hay không ?
    checkboxAll: {
      type: Boolean,
    },
  },
  methods: {
    handleCheckBoxAll() {
      //  Nếu cần checkAll
      if (this.checkboxAll) {
        this.$emit('checkAll')
      } else {
        this.$emit('checkboxItem', this.id)
      }
    },
  },
}
</script>

<style scoped>
.base-check-box {
  display: inline-flex;
  align-items: center;
}
.base-check-box > input {
  display: none;
}

.base-check-box > label {
  background-color: #fff;
  display: block;
  width: 16px;
  height: 16px;
  border: 1px solid #7c869c;
  border-radius: 4px;
  margin-right: 0 !important;
}
.base-check-box > label:hover {
  border-color: #2b4eee;
}
.base-check-box > label::before {
  content: '';

  display: none;
}

input[type='checkbox']:checked + label {
  display: flex;
  justify-content: center;
  color: #fff;
  width: 16px;
  height: 16px;
  cursor: pointer;
  background: transparent url(../../assets/Resource/img/icon_collection.svg)
    no-repeat -176px -16px;
  border: none;
}
</style>
