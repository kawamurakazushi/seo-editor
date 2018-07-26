<template>
  <div id="app" class="app">
    <Sidebar
      :articles="articles" 
      :selectNote="selectNote"
    />
    <Editor 
      v-if="articles.length > 0"
      :index="index"
      :articles="articles" 
      :onBodyChange="change"
    />
    <div v-if="articles.length > 0" class="analytics ">
      <div class="card ">
        <h2>タイトル</h2>
        <p class="wordCount ">{{ articles[index].title.length }}
          <span>文字</span>
        </p>
        <h2>本文</h2>
        <p class="wordCount ">{{ articles[index].body.length }}
          <span>文字</span>
        </p>
      </div>
      <div class="card ">
        <h2>キーワード数</h2>
        <div class="keywordWrapper ">
          <div v-for="(keyword, i) in articles[index].keywords " class="keywordRow ">
            <span @click="removeKeyword(i)" class="closeButton ">×</span>
            <input v-model="keyword.value" @change="applyHighlight" />
            <p>{{ keyword.value.length === 0 ? 0 : body.split(keyword.value).length - 1 }} 個</p>
          </div>
        </div>
        <button @click="addKeyword ">キーワードを追加する</button>
      </div>
      <button @click="save">保存する</button>
      <button @click="clear">クリア</button>
      <button @click="add">追加する</button>
    </div>
  </div>
</template>

<script>
import Sidebar from "../molecules/Sidebar.vue";
import Editor from "../molecules/Editor.vue";

export default {
  name: "app",
  components: {
    Sidebar,
    Editor
  },
  data() {
    return {
      index: 0,
      articles: [
        {
          title: "a",
          body: "body",
          keywords: []
        }
      ],
      // keywords: [
      //   {
      //     value: "キーワード"
      //   }
      // ],
      // body: "ここに本文を入力",
      highlight: "ここに本文を入力"
      // title: "タイトル",
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
    addKeyword: function() {
      this.keywords.push({
        value: ""
      });
    },
    removeKeyword: function(i) {
      this.keywords.splice(i, 1);
      this.applyHighlight();
    },
    scroll: function(e) {
      var top = this.$el.querySelector(".editable").scrollTop;
      this.$el.querySelector(".backdrop").scrollTo(0, top);
    },
    change: function() {
      this.applyHighlight();
    },
    applyHighlight: function() {
      var re = new RegExp(
        this.keywords.map(keyword => keyword.value).join("|"),
        "g"
      );
      this.highlight =
        this.body.replace(re, "<span class='mark'>$&</span>") +
        "<p style='color: transparent'>-----</p>";
    },
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

#app
  color #56b983

</style>
