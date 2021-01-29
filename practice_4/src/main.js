import Vue from 'vue'
import App from './App.vue'
import { BootstrapVue } from 'bootstrap-vue'
import 'bootstrap/dist/css/bootstrap.css';
import 'bootstrap-vue/dist/bootstrap-vue.css';
import VueLodash from 'vue-lodash'
import lodash from 'lodash'
import axios from 'axios';
import VueAxios from 'vue-axios';
Vue.config.productionTip = false
// Подключение bootstrap-vue
Vue.use(BootstrapVue)
Vue.use(VueLodash, { name: 'custom' , lodash: lodash })
Vue.use(VueAxios, axios);
new Vue({
  render: h => h(App),
}).$mount('#app')
