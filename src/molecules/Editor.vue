<template lang="pug">

  div(id="editor" class="editor")
    .title
      a-input(size="large" placeholder="タイトル" v-model="articles[index].title")
    a-textarea(id="textarea" placeholder="本文" v-model="articles[index].body" @keyDown="onBodyChange")

</template>


<script>
export default {
  name: "editor",
  props: {
    articles: {
      type: Array,
      required: true
    },
    onBodyChange: {
      type: Function,
      required: true
    },
    index: {
      type: Number
    }
  }
};
</script>

<style lang="stylus">

.title
  margin-bottom 16px

#textarea
  height 100%

.editor
  display flex
  flex-direction column
  flex 3
  padding 16px


</style>
