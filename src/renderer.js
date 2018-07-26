import Vue from "vue/dist/vue.esm.js";
import App from "./pages/index.vue";

import Antd from "vue-antd-ui";
import "vue-antd-ui/dist/antd.css";
Vue.config.productionTip = false;
Vue.use(Antd);

new Vue({
  el: "#app",
  render: h => h(App)
});
