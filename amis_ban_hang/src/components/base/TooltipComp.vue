<template>
  <div class="tooltip">
    <p class="subtitle-two content">{{ contentTooltip }}</p>
  </div>
</template>

<script>
export default {
  name: 'TooltipComp',
  props: {
    // Chỉ định nội dung của tooltip
    contentTooltip: {
      type: String,
      default: 'Test Tooltip',
    },
    // Chỉ định left của tooltip
    left: {
      type: String,
      default: '50%',
    },
  },
}
</script>

<style>
.show-tooltip {
  position: relative;
}

.tooltip {
  position: absolute;
  top: calc(100% + 10px);
  left: v-bind(left);
  transform: translateX(-50%) scale(0.95);
  transform-origin: center;
  border-radius: 4px;
  background: #424857;
  box-shadow: 0 0 10px #d5d5d5;
  z-index: 9999;
  width: max-content;
  padding: 12px;
  min-height: 32px;
  max-width: 250px;
  opacity: 0;
  transition: all 0.1s ease;
  visibility: hidden;
}
.tooltip:hover {
  display: none;
}

.tooltip > .content {
  color: #fff;
  text-align: left;
  margin: 0;
  line-height: 18px;
}

.show-tooltip:hover .tooltip {
  opacity: 1;
  visibility: initial;
  transform: translateX(-50%) scale(1);
}
</style>
