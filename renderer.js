var app = new Vue({
  el: "#app",
  data: {
    keywords: [
      {
        value: "キーワード"
      }
    ],
    body: "ここに本文を入力"
  },
  methods: {
    addKeyword: function() {
      this.keywords.push({
        value: ""
      });
    },
    removeKeyword: function(i) {
      this.keywords.splice(i, 1);
    }
  }
});
