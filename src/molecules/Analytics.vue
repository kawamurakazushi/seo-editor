<template lang="pug">

    div(class="analytics")
      a-card(title="詳細") 
        h2 タイトル:
        span {{ articles[index].title.length }}
        span 文字

        h2 本文:
        span {{ articles[index].body.length }}
        span 文字


      a-card(title="キーワード") 
        div(class="keywordWrapper")
          div(v-for="(keyword, i) in articles[index].keywords " class="keywordRow")
            a-icon(type="delete" @click="removeKeyword(i)" class="closeButton")
            a-input(v-model="keyword.value")
            p {{ keyword.value.length === 0 ? 0 : body.split(keyword.value).length - 1 }} 個
        a-button(@click="addKeyword(index)") キーワードを追加する
      a-button(@click="save") 保存する
      a-button(@click="clear") クリア
      a-button(@click="add") 追加する

</template>

<script>
export default {
  name: "analytics",
  props: {
    articles: {
      type: Array,
      required: true
    },
    index: {
      type: Number,
      required: true
    },
    save: {
      type: Function
    },
    clear: {
      type: Function
    },
    add: {
      type: Function
    },
    removeKeyword: {
      type: Function
    },
    addKeyword: {
      type: Function
    }
  }
};
</script>

<style lang="stylus">

.analytics
  flex 1
  padding 16px 16px 16px 0

</style>
