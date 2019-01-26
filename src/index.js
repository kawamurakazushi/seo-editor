import { Elm } from "./Main";

const KEY = "SEO_EDITOR_STATE";

const app = Elm.Main.init({
  node: document.querySelector("main"),
  flags: JSON.parse(localStorage.getItem(KEY))
});

app.ports.cache.subscribe(function(data) {
  localStorage.setItem(KEY, JSON.stringify(data));
});
