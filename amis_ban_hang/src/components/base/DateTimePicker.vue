<template>
  <div class="date-time-picker-custom">
    <date-picker
      v-model:value="time0"
      placeholder="DD/MM/YYYY"
      format="DD/MM/YYYY"
      lang="vi"
      :clearable="false"
    >
      <template v-slot:icon-calendar>
        <div class="icon-calendar icon-calendar-gray"></div>
      </template>
    </date-picker>
  </div>
</template>

<script>
import DatePicker from 'vue-datepicker-next'
import 'vue-datepicker-next/index.css'
import 'vue-datepicker-next/locale/vi'
export default {
  name: 'DateTimePicker',
  props: {},
  components: { DatePicker },
  data() {
    return {
      time0: null,
    }
  },
}
</script>

<style>
.date-time-picker-custom {
  outline: none;
}
.date-time-picker-custom:focus .mx-input {
  border: 1px solid #4262f0;
  border-radius: 4px;
}
.mx-input {
  box-shadow: none !important;
}
.date-time-picker-custom {
  width: 100%;
}
.mx-datepicker {
  width: 100% !important;
}
.mx-calendar-content .cell:hover {
  color: #73879c;
  background-color: #f3f9fe;
}
.mx-input:hover {
  border-color: #d3d7de;
}
/* :focus {
  border-color: #4262f0;
} */
.icon-calendar-gray:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/appnew/assets/Images/icon/icon_collection.svg)
    no-repeat -96px -64px !important;
}
.icon-calendar {
  padding: 7px !important;
  /* border: 1px solid #d3d7de; */
  border-left-color: transparent;
}

.icon-calendar:hover {
  background-color: #e2e4e9;
}

.mx-icon-calendar:hover {
  /* background-color: red; */
}
.mx-icon-calendar,
.mx-icon-clear {
  cursor: pointer;
  justify-content: center;
  position: absolute;
  display: flex;
  top: 50%;
  right: 0;
  width: 30px;
  transform: translateY(-50%);
  align-items: center;
  color: rgba(0, 0, 0, 0.5);
  vertical-align: middle;
  height: 100%;
}
/* .mx-btn-current-year {
  display: none !important;
} */
.mx-icon-double-right {
  display: none;
}
.mx-icon-double-left {
  display: none;
}
</style>
