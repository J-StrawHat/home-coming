import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    current:['首页',"登录","辣鸡"]
  },
  mutations: {
    updateCurrent(state,c)
    {
      this.state.current=c;
    }
  },
  actions: {
  },
  modules: {
  }
})
