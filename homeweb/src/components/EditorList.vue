<template>
  <div>

    <el-form :model="addList" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
      <el-form-item label="用户名" prop="username">
        <el-input v-model="addList.username"></el-input>
      </el-form-item>
      <el-form-item label="密码" prop="password">
        <el-input v-model="addList.password" type="password"></el-input>
      </el-form-item>

      <el-form-item label="年龄" prop="age">
        <el-input v-model="addList.age"></el-input>
      </el-form-item>
      <el-form-item label="性别">
        <el-select v-model="addList.gender" placeholder="请选择活动区域">
          <el-option label="女" value="女"></el-option>
          <el-option label="男" value="男"></el-option>

        </el-select>
      </el-form-item>

      <el-form-item label="出生日期" required>
        <el-col :span="11">
          <el-form-item prop="date1">
            <el-date-picker type="date" placeholder="选择日期" v-model="addList.birthday" style="width: 100%;" :value="addList.birthday"></el-date-picker>
          </el-form-item>
        </el-col>
      </el-form-item>
      <el-form-item label="电话号码" prop="phone">
        <el-input v-model="addList.phone"></el-input>
      </el-form-item>

      <el-form-item label="权限">
        <el-select v-model="addList.role" placeholder="请选择活动区域" :value="addList.role.roleName">
          <el-option label="管理员" value="1"></el-option>
          <el-option label="救援队员" value="2"></el-option>
          <el-option label="家属" value="3"></el-option>
        </el-select>
      </el-form-item>


      <el-form :inline="true" :model="addList" class="demo-form-inline address" >
        <el-form-item label="省份">
          <el-select v-model="addList.province" placeholder="省" @change="changeProvince(addList.province)" >
            <el-option  v-for="it in lprovince" :label=it :value="it" ></el-option>

          </el-select>
        </el-form-item>
        <el-form-item label="市" >
          <el-select v-model="addList.city" placeholder="市" @change="changeCity(addList.province,addList.city)">
            <el-option :label="it" :value="it" v-for="it in lcity"></el-option>

          </el-select>
        </el-form-item>
        <el-form-item label="区">
          <el-select v-model="addList.county" placeholder="区" @change="changeCounty(addList.province,addList.city,addList.county)">
            <el-option :label="it" :value="it" v-for="it in lcounty"></el-option>

          </el-select>
        </el-form-item>
        <el-form-item label="街道" >
          <el-select v-model="addList.town" placeholder="街道">
            <el-option :label="it" :value="it" v-for="it in ltown"></el-option>

          </el-select>
        </el-form-item>
        <el-form-item label="详细地址" >
          <el-input v-model="addList.detail" value="123"></el-input>
        </el-form-item>

      </el-form>
      <el-form-item>
        <el-button @click="update">更新</el-button>
      </el-form-item>

    </el-form>
  </div>
</template>

<script>
import {getRequest, postRequest, putRequest} from "@/utils/api";
import {d} from "@/utils/data";

export default {
name: "EditorList",

  data() {
    return {
      addList:
          {
            username:'',
            password:'',
            gender:'',
            age:'',
            birthday:'',
            phone:'',
            userRole:'',
            province:'',
            city:'',
            county:'',
            town:'',
            detail:'',
          },
      list:[],
      lprovince:[],
      lcity:[],
      lcounty:[],
      ltown:[],
      rules: {
        username: [
          {required: true, message: "用户名不能为空", trigger: 'blur'},
          {min: 6, max: 11, message: '用户名长度在 6 到 11 个字符之间', trigger: 'blur'}
        ],
        password: [
          {required: true, message: '密码不能为空', trigger: 'blur'},
          {min: 6, max: 11, message: '密码长度在 6 到 11 个字符之间', trigger: 'blur'}
        ],
        phone:[
          {required: true, message: '电话号码不能为空', trigger: 'blur'},
        ],
        age:[
          {required: true, message: '年龄不能为空', trigger: 'blur'},
          {min: 1, max: 2, message: '年龄必须在18-70岁之间', trigger: 'blur'}
        ]
      }
    }
  },
  methods :{
    update()
    {
      putRequest("/User",this.addList).then((result)=>
      {
        if(result)
        {
          this.$router.push("/home/userlist")
        }

      })
    },
    changeProvince(province)
    {

      this.lcity=[];
      console.log(province)
      for (let i in d[province]) {
        this.lcity.push(i)
      }
    },
    changeCity(province,city)
    {
      this.lcounty=[];
      for (let i in d[province][city]) {
        this.lcounty.push(i)
      }
    },
    changeCounty(province,city,county)
    {
      console.log(d[province][city][county])
      this.ltown=[];


      this.ltown=d[province][city][county];
    }

  },

  mounted() {

    getRequest("/getUserById?id="+this.$route.query.id).then((result)=>{
      this.addList=result
      this.changeProvince(this.addList.province)
      this.changeCity(this.addList.province,this.addList.city)
      this.changeCounty(this.addList.province,this.addList.city,this.addList.county)
    })
    this.list=d;
    for (let i in d) {
      this.lprovince.push(i);

    }




  }
}
</script>

<style scoped>

</style>
