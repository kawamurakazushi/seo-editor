<template lang="pug">
  div(id="sidebar" class="sidebar")
    ul
      li(v-for="(data, i) in articles" @click="selectnote(i)") {{ data.title }}
</template>

<script>
export default {
  name: "sidebar",
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
.sidebar
  flex 1
  background-color white
  overflow-y auto
  ul
    display flex
    flex-direction column
    li
      cursor pointer
      padding 16px 8px
      border-bottom 1px solid #ccc
    li:hover 
      opacity 0.7
</style>
