var app = new Vue({
  el: "#app",
  data: {
    keywords: [
      {
        value: "キーワード"
      }
    ],
    body: "ここに本文を入力",
    highlight: "ここに本文を入力"
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
      console.log(top);
      console.log("scrolll", this.$el);
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
    }
  }
});
