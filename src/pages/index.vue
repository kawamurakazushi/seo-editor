<template>
  <div id="app" class="app">
    <Sidebar
      :articles="articles" 
      :selectNote="selectNote"
      :add="add"
    />
    <Editor 
      v-if="articles.length > 0"
      :index="index"
      :articles="articles" 
      :onBodyChange="change"
    />
    <Analytics 
      v-if="articles.length > 0"
      :index="index"
      :articles="articles" 
      :save="save"
      :clear="clear"
      :removeKeyword="removeKeyword"
      :addKeyword="addKeyword"
    />
  </div>
</template>

<script>
import Sidebar from "../molecules/Sidebar.vue";
import Editor from "../molecules/Editor.vue";
import Analytics from "../molecules/Analytics.vue";

export default {
  name: "app",
  components: {
    Sidebar,
    Editor,
    Analytics
  },
  data() {
    return {
      index: 0,
      articles: [
        {
          title: "新しいノート",
          body: "本文",
          keywords: [
            {
              value: "キーワード"
            }
          ]
        }
      ]
    };
  },
  created: function() {
    // storage.clear()
    console.log("article", this.articles);
    // const $this = this;
    //    storage.get("data.json", function(error, data) {
    //      if (error) {
    //        alert("error");
    //      }
    //
    //      if (data.length > 0) {
    //        // データがある場合
    //        console.log("aa");
    //        console.log(data);
    //        $this.articles = data;
    //      } else {
    //        // データがない場合
    //        $this.articles = [
    //          {
    //            title: "タイトル",
    //            body: "おでぃ",
    //            keywords: []
    //          }
    //        ];
    //      }
    //  });
  },
  methods: {
    addKeyword: function(index) {
      this.articles[index].keywords.push({
        value: ""
      });
    },
    removeKeyword: function(articleIndex, keywordIndex) {
      console.log(this.articles);
      this.articles[articleIndex].keywords.splice(keywordIndex, 1);
    },
    scroll: function(e) {
      var top = this.$el.querySelector(".editable").scrollTop;
      this.$el.querySelector(".backdrop").scrollTo(0, top);
    },
    change: function() {},
    save: function() {
      // storage.set("data.json", this.articles, function(error) {
      //   if (error) {
      //     alert("error");
      //   }
      //   alert("hozonshita");
      // });
    },
    clear: function() {
      // storage.clear();
    },
    add: function() {
      this.articles.push({
        title: "新しいノート",
        body: "本文",
        keywords: []
      });
      this.index = this.articles.length - 1;
      console.log("new artciles", this.articles);
    },
    selectNote(i) {
      console.log(i);
      this.index = i;
    }
  }
};
</script>

<style lang="stylus">
.app {
  padding: 24px 16px;
  display: flex;
  background-color: #f7f7f7;
  height: 100%;
}
</style>
