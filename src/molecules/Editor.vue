<template lang="pug">
  div(id="editor" class="editor")
   a-input(size="large" placeholder="タイトル" v-model="articles[index].title")
   a-textarea(class="textarea" placeholder="本文" v-model="articles[index].body" @keyDown="onBodyChange")

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

div 
  color red

.textarea
  height 100%

</style>
