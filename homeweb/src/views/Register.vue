<template>

  <div class="register_container">
    <div class="register_box">

      <div class="register_header">归家行动注册界面</div>
      <el-form ref="Form"  :model="RegisterForm" :rules="RegisterFormRules" label-width="80px" class="login_form">

        <el-form-item label="用户名" prop="username">
          <el-input v-model='RegisterForm.username' prefix-icon="el-icon-user" style="width: 80%"></el-input>
        </el-form-item>
        <el-form-item label="密码" prop="password" >
          <el-input v-model='RegisterForm.password' type="password" prefix-icon="el-icon-key" style="width: 80%"></el-input>
        </el-form-item>
        <el-form-item label="手机号" prop="phone" >
          <el-input v-model='RegisterForm.phone'  prefix-icon="el-icon-key" style="width: 60%"></el-input>
        </el-form-item>

        <el-form-item label="年龄" prop="age" >
          <el-input v-model='RegisterForm.age'  prefix-icon="el-icon-key" style="width: 20%"></el-input>
        </el-form-item>

        <el-form-item label="性别"  >
          <el-radio-group v-model="RegisterForm.gender">
            <el-radio label="男"></el-radio>
            <el-radio label="女"></el-radio>
          </el-radio-group>
        </el-form-item>

        <el-form-item label="出生日期">
          <el-col :span="12">
            <el-date-picker type="date" placeholder="选择日期" v-model="RegisterForm.birthday" style="width: 100%;"></el-date-picker>
          </el-col>

        </el-form-item>

        <el-form-item class="btns">
          <el-button  type="primary" @click="registerbtn" >注册</el-button>
          <el-button  type="primary" @click="registerReset">重置</el-button>
        <a href="javasricpt:;" @click="tologin" style="margin-left: 30px">已有账号？点击登录</a>
        </el-form-item>

      </el-form>
    </div>
  </div>
</template>

<script>
import {postRequest} from "@/utils/api";

export default {
name: "Register",
  data(){
  return {
    RegisterForm:{
      username:'',
      password:'',
      phone:'',
      gender:'',
      birthday:'',
      userRole:'3',
      age:''
    },
    RegisterFormRules:{
      username: [
        { required: true, message: '请输入用户名', trigger: 'blur'},
        { min:5, max:11, message: "长度在5-11个字符之间",trigger:'blur'}
      ],
      password: [
        { required: true,message: '请输入密码',trigger: 'blur' },
        { min:5, max:11, message: "长度在5-11个字符之间",trigger:'blur'}
      ],
      phone: [
        { required: true,message: '请输入11位手机号',trigger: 'blur' },
        { min:11, max:11, message: "不符合规范",trigger:'blur'}

      ],
      age: [
        { required: true,message: '请输入年龄号',trigger: 'blur' },
        { min:1, max:2, message: "不符合规范",trigger:'blur'}

      ]

    }
  }
  },
  methods:{
    registerReset()
    {
      this.$refs.Form.resetFields();
    },
    tologin()
    {
      this.$router.push("/login")
    },
    registerbtn()
    {
      this.$refs.Form.validate((valid)=>
      {
        if(valid)
        {
          postRequest("/register", this.RegisterForm).then(
              (result) => {
                if (result) {
                  this.$router.push("/login")
                }
              }
          )
        }
      })
  },
}
}
</script>

<style lang="less" scoped>
//@import "../assets/css/register.css";
.register_container {
  background: url("https://tva1.sinaimg.cn/large/008eGmZEgy1gpp3zx2zkrj30ms0e6751.jpg") no-repeat ;
  background-size: 100%;
  height: 100%;
  .register_box {
    padding-left: 30px;
    width: 700px;
    height: 600px;
    background-color: #fff;

    border-radius: 30px;
    position: absolute;
    left: 50%;
    top: 50%;
    color: red;
    transform: translate(-50%,-50%);
  }
}
.register_header {
  text-align: center;
  font-size: 32px;
  margin: 30px 0;
}
a {
color: red;
  text-decoration: none;
}
</style>
