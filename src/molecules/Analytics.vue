<template lang="pug">

    div(class="analytics")
      .card
        a-card(title="詳細") 
          h2 タイトル:
          span {{ articles[index].title.length }}
          span 文字

          h2 本文:
          span {{ articles[index].body.length }}
          span 文字
      .card
        a-card(class="card" title="キーワード") 
          a-button(class="addButton" @click="addKeyword(index)" )
            a-icon(type="plus-circle-o") 
            | 追加
          .keywordWrapper
            .keywordRow(v-for="(keyword, i) in articles[index].keywords")
              a-icon(type="delete" @click="removeKeyword(index, i)" class="closeButton")
              a-input(class="input" v-model="keyword.value" size="small")
              span {{ keyword.value.length === 0 ? 0 : articles[index].body.split(keyword.value).length - 1 }} 個
            
      a-tooltip(placement="topLeft")
        template(slot="title")
          span hi
        a-button(icon="save" @click="save")

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
.card {
  margin-bottom: 16px;

  .addButton {
    margin-bottom: 8px;

    i {
      margin-right: 8px;
    }
  }
}

.analytics {
  flex: 1;

  .keywordRow {
    display: flex;
    align-items: center;
    margin-bottom: 8px;

    .closeButton {
      color: #f50057;
      margin-right: 8px;
      cursor: pointer;

      &:hover {
        opacity: 0.7;
      }
    }

    .input {
      flex: 1;
      margin-right: 8px;
    }
  }
}
</style>
