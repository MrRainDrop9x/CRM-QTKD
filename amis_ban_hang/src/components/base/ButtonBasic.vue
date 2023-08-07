<template>
  <div class="button-basic--wrap">
    <div class="button-basic">
      <div v-if="iconLeft" :class="iconLeft"></div>
      <div class="button-basic__content">{{ content }}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'ButtonBasic',
  props: {
    // Nội dung của button
    content: {
      type: String,
      required: true,
    },
    // Đang hỗ trợ các giá trị
    // ['ic-choose-to-routing','ic-send-email','ic-chat-gray','ic-export','ic-share-right',icon-delete-look-red]
    iconLeft: {
      type: String,
    },
  },
}
</script>

<style scoped>
.button-basic--wrap:hover {
}
.ic-choose-to-routing:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -63px -272px;
}

.ic-send-email:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -384px -457px;
}

.icon-chat-gray:before,
.ic-history-send-sms:before {
  content: '';
  width: 16px;
  height: 16px;
  display: inline-block;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -352px -192px;
  cursor: pointer;
}

.ic-export:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -304px -224px;
}

.ic-share-right:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -352px -240px;
}

.icon-delete-look-red:before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -192px -129px;
}

.button-basic {
  align-items: center;
  display: flex;
  border: none !important;
  padding-left: 16px !important;
  font-weight: 400 !important;
  width: 100%;
  height: 32px;
  line-height: 20px !important;
  padding: 5px 16px;
  border-radius: 4px;
  background-clip: padding-box;
  background-color: #fff;
  color: #1f2229;
  font-size: 13px;
  cursor: pointer;
  text-align: center;
  white-space: nowrap;
  overflow: hidden;
  transition: all 0.3s ease-in-out;
  position: relative;
  user-select: none;
}

.button-basic:hover {
  background-color: #f0f2f4;
  border-color: #d3d7de;
  border-radius: 4px;
}

.button-basic__iconLeft {
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -63px -272px;
}

.button-basic__content {
  margin-left: 8px;
}
</style>
