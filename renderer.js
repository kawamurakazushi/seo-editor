const storage = require('electron-json-storage');

var app = new Vue({
  el: "#app",
	id: 1,
  data: {
    index: 0,
    articles: [ ],
    // keywords: [
    //   {
    //     value: "キーワード"
    //   }
    // ],
    // body: "ここに本文を入力",
    highlight: "ここに本文を入力",
    // title: "タイトル",
  },
	created: function() {
    // storage.clear()
		console.log("article", this.articles)
		const $this = this
		storage.get('data.json', function(error, data) {

			if(error) {
				alert('error')
			}

      if(data.length > 0) { // データがある場合
        console.log('aa')
        console.log(data)
        $this.articles = data
      } else { // データがない場合
        $this.articles = [
          {
            title: "タイトル",
            body: "おでぃ",
            keywords: [],
          }
        ]
			}
		})
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
      storage.set('data.json', this.articles, function(error) {
        if(error) {
          alert('error')
        }
        alert('hozonshita')
      })
    },
		clear: function() {
      storage.clear();
		},
    add: function() {
      this.articles.push({
        title: "新しいノート",
        body: "本文",
        keywords: [],
      })
      this.index = this.articles.length - 1
      console.log("HI")
      console.log("new artciles", this.articles)
    },
    selectNote(i) {
      console.log(i);
      this.index = i
    }
  }
});
