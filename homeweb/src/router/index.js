import Vue from 'vue'
import VueRouter from 'vue-router'


Vue.use(VueRouter)

const routes = [

  {
    path:'/',
    redirect:'/index'
  } ,
  {
    path: '/index',
    name:'Index',

    component:()=>import('../views/index')
  },

  {
    path: '/login',
    name: 'Login',
    component: ()=>import("../views/Login")
  },
  {
   path: '/register',
    name:'register',
    component:()=>import("../views/Register")
  },
  {
    path:'/home',
    name:'home',
    component:()=>import('../views/Home'),
    children:[{
      path:'userlist',
      name:'UserList',
      meta:{
        name:["用户管理","查看用户"],
        p:['/home','/home/userlist']
      },
      component:()=>import('../components/UserList')
    },
      {
        path:'adduser',
        name:'AddUser',
        meta:{
          name:["用户管理","添加用户"],
          p:['/home','/home/adduser']
        },

        component:()=>import('../components/AddUser')
      },
      {
        path:'editor',
        name:'editor',
        component:()=>import('../components/EditorList'),
        meta:{
          name:["用户管理","编辑用户"],
          p:['/home','/home/adduser']
        },
      },
      {
        path: 'oldlist',
        name:'OldList',
        component:()=>import('../components/OldList'),
        meta:{
          name:["老人信息管理","老人列表"],
          p:['/home','/home/adduser']
        },
      },
      {
        path:'addold',
        name:'Addold',
        component:()=>import('../components/AddOld'),
        meta:{
          name:["老人信息管理","添加信息"],
          p:['/home','/home/adduser']
        },
      },
      {
        path:'editorold',
        name:'Editorold',
        component:()=>import('../components/EditorOld'),
        meta:{
          name:["老人信息管理","修改信息信息"],
          p:['/home','/home/adduser']
        },
      }
    ]
  },
  {
    path: '/home2',
    name:'Home2',
    component:()=>import('../views/home2'),

  }

]

const router = new VueRouter({
  routes
})

export default router
