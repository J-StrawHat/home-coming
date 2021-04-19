<template>
  <el-container class="home-container">
    <el-header>
      <div class="div1">
        <img src="../assets/logo.png" width="60px" height="60px" alt="">
        <span>归家行动后台管理系统</span>
      </div>
      <div class="div2">
        <span>{{zname}}</span>
        <el-avatar icon="el-icon-user-solid"></el-avatar>
        <el-button type="info" @click="logout">登出</el-button>
      </div>
    </el-header>
    <el-container>
      <el-aside width="200px">
        <el-menu
            background-color="#333744"
            text-color="#fff"
            active-text-color="#ffd04b">


          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-s-flag"></i>
              <span>救援任务</span>
            </template>
            <!--二级菜单-->
            <el-menu-item index="1-1" >
              <template slot="title">
                <i class="el-icon-user"></i>
                <span>任务列表</span>
              </template>
            </el-menu-item>

            <el-menu-item index="1-2" >
              <template slot="title">
                <i class="el-icon-user"></i>
                <span>我的任务</span>
              </template>
            </el-menu-item>

          </el-submenu>



        </el-menu>
      </el-aside>
      <el-main>
        <Breadcrumb></Breadcrumb>
        <br>
        <router-view></router-view>
      </el-main>
    </el-container>
  </el-container>

</template>

<script>
export default {
  name: "Home2",
  data(){
    return {
      zname:''
    }
  },
  mounted() {
    this.zname=sessionStorage.getItem('name');
  },
  methods :{
    logout()
    {
      sessionStorage.clear()
      this.$router.push('/login')
    }
    ,

  },
  components:{
    UserList:()=>import('../components/UserList'),
    AddUser:()=>import('../components/AddUser'),
    Breadcrumb:()=>import('../components/Breadcrumb')
  }
}
</script>

<style lang="less" scoped>

.home-container {
  height: 100%;
}

.el-header {
  padding-left: 0;
  background-color: #373D41;
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #fff;
  > .div1 {
    display: flex;
    align-items: center;
    > span {
      margin-left: 15px;
      margin-right: 10px;
    }
  }
  >.div2 {
    display: flex;
    align-items: center;
    >.el-avatar {
      margin-right: 10px;
      margin-left: 10px;
    }
  }
}
.el-menu {
  width: 200px;
}
.el-submenu {
  width: 200px;
}
.el-aside {

  background-color: #333744;
}
.el-main {
  background-color: #EAEDF1;
}
</style>
