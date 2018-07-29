<template lang="pug">

  div(id="sidebar" class="sidebar")
    .input-wrapper
      a-input-search(placeholder="検索" style="width: 100%")
    a-menu(:defaultSelectedKeys="[0]" :mode="mode" :theme="theme")
      a-menu-item(v-for="(data, i) in articles" key="i" @click="selectNote(i)")
        a-icon(type="file-text")
        span {{ data.title }}
</template>

<script>
export default {
  name: "sidebar",
  data() {
    return {
      mode: "inline",
      theme: "light"
    };
  },
  props: {
    articles: {
      type: Array,
      required: true
    },
    selectNote: {
      type: Function,
      required: true
    }
  }
};
</script>

<style lang="stylus">

.input-wrapper 
  padding 16px
  border-right 1px solid #e8e8e8

.sidebar
  flex 1
  background-color white
  overflow-y auto
  ul 
    height 100%
</style>
