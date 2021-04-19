import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './plugins/element.js'
import './utils/api'

Vue.config.productionTip = false

router.beforeEach(((to, from, next) => {
  if (to.path == '/login'||to.path=='/index'||to.path=='/register') {
    next();
  } else {
    let usertoken = sessionStorage.getItem("usertoken");
    if (usertoken) {

      if(to.path.startsWith("/home"))
      {
        console.log(to)
        store.commit("updateCurrent",to.meta.name)
      }
      next();
    } else {
        next('/login');
    }
  }
}))

 var v=new Vue({

  router,
  store,
  render: h => h(App)
}).$mount('#app')
