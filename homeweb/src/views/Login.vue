<template>
  <div class="login_container">
    <div class="login_text">归家行动登录界面</div>
    <div class="login_box">
      <div class="avatar">
        <img src='https://tva1.sinaimg.cn/large/008eGmZEgy1gpp1cpmvr4j30p00go3z3.jpg' alt="">
      </div>

      <el-form ref="Form"  :model="loginForm" :rules="loginFormRules" label-width="0px" class="login_form">

<!--        <el-form-item  style="display: flex;justify-content: center;">-->
<!--          <el-row style="margin-top: 50px">归家行动登录界面</el-row>-->
<!--        </el-form-item>-->
        <el-form-item prop="username">
          <el-input v-model='loginForm.username' prefix-icon="el-icon-user"></el-input>
        </el-form-item>
        <el-form-item prop="password" >
          <el-input v-model='loginForm.password' type="password" prefix-icon="el-icon-key"></el-input>
        </el-form-item>
        <el-form-item  prop="code">
          <el-input  v-model="loginForm.code" size="normal" auto-complete="false"  type="text" placeholder="点击图片更换验证码" style="width:250px;margin-right: 5px" ></el-input>
          <img :src="captchaURL" class="codes" @click="updatecapt" style="height: 37px; margin: -12px 8px;width: 100px"/>
        </el-form-item>
        <el-form-item class="btns">
          <el-button  type="primary" @click="loginbtn" >登录</el-button>
          <el-button  type="primary" @click="loginReset">重置</el-button>
          <a @click="toregister">没有账号？点击注册</a>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
import {getRequest, postRequest} from "@/utils/api";

export default {
  name: "Login",
  data() {
    return {
      loginForm: {
        username:'',
        password:'',
        code:''
      },
      loginFormRules:{
        username: [
          { required: true, message: '请输入用户名', trigger: 'blur'},
          { min:5, max:11, message: "长度在5-11个字符之间",trigger:'blur'}
        ],
        password: [
          { required: true,message: '请输入密码',trigger: 'blur' }
        ]
      },
      captchaURL:"captcha?time="+new Date()
    }
  },
  methods: {
    loginReset()
    {
      this.$refs.Form.resetFields();
    },
    loginbtn()
    {
      this.$refs.Form.validate((valid)=>{
        if(valid)
        {
          postRequest("/login",this.loginForm).then(
              (result)=>{
                if(result)
                {

                  sessionStorage.setItem("usertoken",result.obj.tokenHead+result.obj.token)
                  getRequest("/user/info").then(
                      (r)=>{
                        if(r)
                        {
                          sessionStorage.setItem("zname",r.username);
                          sessionStorage.setItem("role",r.role.roleName)
                        }
                      }
                  )

                    this.$router.push("/home/userlist")

                }
                else{
                  this.updatecapt();
                }
              }
          )
        }
      })

      // this.$message.success("登录成功");
      // this.$router.push('/home');
    },
    updatecapt()
    {
      this.captchaURL="captcha?time="+new Date();
    },
    toregister()
    {
      this.$router.push("/register");
    }

  },

}
</script>

<style  scoped lang="less">
.login_container {
  //background: -webkit-linear-gradient(left, #FF506C, #FF6BC6);
  background: url("https://tva1.sinaimg.cn/large/008eGmZEgy1gpp1o5cv97j30dw08pjs0.jpg") no-repeat ;
  background-size: 100%;
  height: 100%;
  .login_box {
    width: 450px;
    height: 300px;
    background-color: #fff;
    border-radius: 30px;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
  }
}


.avatar {
  height: 90px;
  width: 90px;
  border-radius: 50%;
  border: 1px solid #fff;
  background-color: #fff;
  padding:10px;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  position: absolute;
  left: 50%;
  transform: translate(-50%,-60%);
  img {
    width: 100%;
    height: 100%;
    border-radius: 50%;
    background-color: gainsboro;
  }
}


.login_form {
  position: absolute;
  bottom: 0;
  width: 100%;
  padding: 0 20px;
  box-sizing: border-box;
}
.btns {
  display: flex;
  justify-content: flex-end;
}
.tt {
  box-sizing:border-box;
  display: flex;
  align-items: center;
  margin-bottom: 0;
}
.login_text {
  text-align: center;
  padding-top: 50px;
  font-size: 50px;
  color: white;
}
a {
  text-decoration: none;
  color: red;
  margin-left: 20px;
}


</style>
