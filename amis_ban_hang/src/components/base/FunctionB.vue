<template>
  <div class="baseButton" :class="{ disabled: isDisabled }">
    <button
      class="button"
      :class="[
        { button__icon: hasIconFunc },
        { 'btn--left': hasBorderRightFunc },
        { 'btn--right': hasBorderLeftFunc },
        { 'button__primary--blue': hasHoverAndActivePrimaryBlue },
        { 'button__secondary--outlineblue': hasSecondaryOutLineFunc },
        { button__tertiary: hasTertiaryFunc },
        { 'button__primary--red': hasPrimaryRedFunc },
      ]"
    >
      <div class="buttonContent">{{ buttonText }}</div>
    </button>
  </div>
</template>
<script>
export default {
  props: {
    //Nội dung của button
    buttonText: {
      type: String,
      default: '',
    },
    //Màu nền của nút
    backgroundColor: {
      type: String,
      default: '#4262F0',
    },
    // button có icon không?
    hasIcon: {
      type: Boolean,
      default: false,
    },
    // button có thuộc tính disabled không
    disabled: {
      type: Boolean,
      default: false,
    },
    // button có border right không?
    hasBorderRight: {
      type: Boolean,
      default: false,
    },
    // button có border left không?
    hasBorderLeft: {
      type: Boolean,
      default: false,
    },
    // button có outline không?
    hasSecondaryOutLine: {
      type: Boolean,
      default: false,
    },
    // button kiểu terirary?
    hasTertiary: {
      type: Boolean,
      default: false,
    },
    hasPrimaryRed: {
      type: Boolean,
      default: false,
    },

    // button có hover active
    hasHoverAndActivePrimaryBlue: {
      type: Boolean,
      default: false,
    },
  },

  computed: {
    // Button có icon không?
    hasIconFunc() {
      return this.hasIcon
    },
    // Button là disable hay không?
    isDisabled() {
      return this.disabled
    },
    // Button có borderleft không?
    hasBorderLeftFunc() {
      return this.hasBorderLeft
    },
    // Button có border right không?
    hasBorderRightFunc() {
      return this.hasBorderRight
    },
    // Button có outline không?
    hasSecondaryOutLineFunc() {
      return this.hasSecondaryOutLine
    },
    // Button có phải tertirary không?
    hasTertiaryFunc() {
      return this.hasTertiary
    },
    // Button có hover và active không?
    hasHoverAndActivePrimaryBlueFunc() {
      return this.hasHoverAndActivePrimaryBlue
    },
    hasPrimaryRedFunc() {
      return this.hasPrimaryRed
    },
  },
}
</script>
<style>
.button {
  transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  -webkit-transition: all 0.3s;
}
.buttonContent {
  font-family: Bold;
}
.baseButton .disable {
  background-color: #4262f0;
}
.baseButton.disabled {
  background-color: rgba(66, 98, 240, 0.6);
  pointer-events: none;
}
.button {
  height: 32px;
  padding: 0 16px;
  border-radius: 4px;
  color: #fff;
  cursor: pointer;
  border: none;
  background-color: v-bind(backgroundColor);
}
.button__tertiary {
  color: #1f2229 !important;
  border: 1px solid #d3d7de !important;
  font-weight: 550 !important;
}
.button__tertiary:hover {
  border: 1px solid #d3d7de;
  background-color: #f0f2f4;
}
.button__tertiary:active {
  border: 1px solid #d3d7de;
  background-color: #d3d7de;
}
.button__primary--blue {
  background-color: #4262f0;
}

.button__primary--green {
  background-color: #31b491;
}

.button__primary--red {
  background-color: #ec4141;
}

.button__primary--blue:hover {
  background-color: #2b4eee;
}

.button__primary--green:hover {
  background-color: #2ea888;
}

.button__primary--red:hover {
  background-color: #ea2e2e;
}

.button__primary--blue:active {
  background-color: #133bec;
}

.button__primary--green:active {
  background-color: #268c71;
}

.button__primary--red:active {
  background-color: #e81717;
}

.button__secondary--blue {
  background-color: #e7ebfd;
  color: #4262f0;
}

.button__secondary--green {
  background-color: #d7f4ec;
  color: #31b491;
}

.button__secondary--red {
  background-color: #fad1d1;
  color: #ec4141;
}

.button__secondary--blue:hover {
  background-color: #d0d8fb;
}

.button__secondary--green:hover {
  background-color: #c3efe3;
}

.button__secondary--red:hover {
  background-color: #fad1d1;
}

.button__secondary--blue:active {
  background-color: #b8c4f9;
}

.button__secondary--green:active {
  background-color: #afe9da;
}

.button__secondary--red:active {
  background-color: #f8b9b9;
}

.button__icon {
  padding-left: 32px;
}

.button__secondary--outlinered {
  background-color: #ffffff;
  border: 1px solid #ec4141;
  color: #ec4141;
}

.button__secondary--outlinegreen {
  background-color: #ffffff;
  border: 1px solid #31b491;
  color: #31b491;
}

.button__secondary--outlineblue {
  background-color: #ffffff;
  border: 1px solid #4262f0;
  color: #4262f0;
}

.button__secondary--outlinered:hover {
  background-color: #fde8e8;
}

.button__secondary--outlinegreen:hover {
  background-color: #d7f4ec;
}

.button__secondary--outlineblue:hover {
  background-color: #e7ebfd;
}

.button__secondary--outlinered:active {
  background-color: #fad1d1;
}

.button__secondary--outlinegreen:active {
  background-color: #c3efe3;
}

.button__secondary--outlineblue:active {
  background-color: #d0d8fb;
}

.btn__combo {
  display: flex;
  width: 118px;
  border: 1px solid #4262f0;
  /* background-color: #FFFFFF; */
  border-radius: 4px;
}

.button__select {
  width: 32px;
  height: 32px;
  border-radius: 0 4px 4px 0;
  border: none;
  border-left: 1px solid #4262f0;
}

.edit_16::before {
  content: '';
  display: inline-block;
  width: 16px;
  height: 16px;
  background: transparent
    url(https://crmplatform.misacdn.net/app/assets/Images/icon/icon_collection.svg)
    no-repeat -128px 0;
}
.misa-button {
  text-transform: none !important;
  font-weight: 500 !important;
  border: 1px solid #d3d7de !important;
  min-width: 64px;
  height: 32px;
  line-height: 20px !important;
  padding: 5px 8px;
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
</style>
