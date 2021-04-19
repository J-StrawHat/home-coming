<template>
  <div>

    <el-form :model="addList" :rules="rules" ref="Form" label-width="100px" class="demo-ruleForm" >
      <el-row >
        <el-col :span="6">
          <el-form-item label="老人姓名" >
            <el-input v-model="addList.elderName"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="年龄" >
            <el-input v-model="addList.age"></el-input>
          </el-form-item>
        </el-col>

        <el-col :span="4">
          <el-form-item label="照片URL" >
            <el-input v-model="addList.phone"></el-input>
          </el-form-item>
        </el-col>

        <el-col :span="4" style="margin-left: 20px" >
          <el-upload style="border: 1px dashed white;width: 120px"
              class="avatar-uploader"
              action="https://jsonplaceholder.typicode.com/posts/"
              :show-file-list="false"
              :on-success="handleAvatarSuccess"
              :before-upload="beforeAvatarUpload">
            <img v-if="addList.photo" :src="addList.phone" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-col>

      </el-row>

      <el-row>
        <el-col :span="8">
          <el-form-item label="性别">
            <el-select v-model="addList.gender" >
              <el-option label="女" value="女"></el-option>
              <el-option label="男" value="男"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="出生日期" required>
            <el-col :span="11">
              <el-form-item prop="birthday">
                <el-date-picker type="date" placeholder="选择日期" v-model="addList.birthday" style="width: 100%;" :value="addList.birthday"></el-date-picker>
              </el-form-item>
            </el-col>
          </el-form-item>
        </el-col>
      </el-row>


      <el-row>
        <el-col :span="8">
          <el-form-item label="籍贯" >
            <el-input v-model="addList.eldernative"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="民族" >
            <el-input v-model="addList.nation"></el-input>
          </el-form-item>
        </el-col>
      </el-row>



      <el-row>
        <el-col :span="8">
          <el-form-item label="联系人" >
            <el-input v-model="addList.contactor"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="联系电话" >
            <el-input v-model="addList.contactTel"></el-input>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="8">
          <el-form-item label="失踪身高">
            <el-input v-model="addList.missHeight"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="失踪体重" >
            <el-input v-model="addList.missWeight"></el-input>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="8">
          <el-form-item label="省份">
            <el-select v-model="addList.missProvince" placeholder="省份" @change="changeProvince(addList.missProvince)">
              <el-option  v-for="it in lprovince" :label=it :value="it" ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="市">
            <el-select v-model="addList.missCity" placeholder="市" @change="changeCity(addList.missProvince,addList.missCity)">
              <el-option :label="it" :value="it" v-for="it in lcity"></el-option>

            </el-select>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="8">
          <el-form-item label="区">
            <el-select v-model="addList.missCounty" placeholder="区" @change="changeCounty(addList.missProvince,addList.missCity,addList.missCounty)">
              <el-option :label="it" :value="it" v-for="it in lcounty"></el-option>

            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-select v-model="addList.missTown" placeholder="街道">
            <el-option :label="it" :value="it" v-for="it in ltown"></el-option>
          </el-select>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="8">
            <el-form-item label="详细地址" >
              <el-input v-model="addList.missDesc" value="123"></el-input>
            </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="失踪时间" required>
            <el-col :span="11">
              <el-form-item >
                <el-date-picker type="date" placeholder="选择日期" v-model="addList.missTime" style="width: 100%;" :value="addList.missTime"></el-date-picker>
              </el-form-item>
            </el-col>
          </el-form-item>
        </el-col>
      </el-row>

      <el-row>
        <el-col :span="8">
          <el-form-item label="特征" >
            <el-input v-model="addList.feature" ></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="10">
          <el-form-item label="失踪类型">
            <el-select v-model="addList.missTypeId" placeholder="活动区域">
              <el-option label="离家出走" value="1"></el-option>
              <el-option label="被拐骗" value="2"></el-option>
              <el-option label="迷路走失" value="3"></el-option>
              <el-option label="失去亲友" value="4"></el-option>
              <el-option label="不明原因" value="5"></el-option>
            </el-select>
          </el-form-item>

        </el-col>
      </el-row>

      <el-row>
        <el-col :span="8">
          <el-form-item label="身份证" >
            <el-input v-model="addList.IDnum"></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="心理状况">
            <el-input v-model="addList.psycCondition" ></el-input>
          </el-form-item>
        </el-col>
          <el-col :span="8">
            <el-form-item label="身体状况">
              <el-input v-model="addList.physicalCondition" ></el-input>
            </el-form-item>

        </el-col>
      </el-row>

      <el-form-item>
        <el-button type="primary" @click="add">添加</el-button>
      </el-form-item>

    </el-form>
  </div>
</template>

<script>
import {postRequest} from "@/utils/api";
import {d} from "@/utils/data";

export default {
name: "AddOld",
  mounted() {
    this.list=d;

    for (let i in d) {

      this.lprovince.push(i);
    }
  },
  data(){
  return {
    imageUrl:'https://tva1.sinaimg.cn/large/008eGmZEgy1gph2ryrcbsj30zv0u0jwc.jpg',
    addList:
      {
        id:'',
        elderName:'',
        age:'',
        gender:'',
        nation:'',
        eldernative:'',
        birthday:'',
        feature:'',
        missHeight:'',
        missWeight:'',
        missProvince:'',
        missCity:'',
        missCounty:'',
        missTown:'',
        missDesc:'',
        missTime:'',
        missTypeId:'',
        contactor:'',
        contactTel:'',
        physicalCondition:'',
        psycCondition:'',
        photo:'',
        IDnum:''
      },
    list:[],
    lprovince:[],
    lcity:[],
    lcounty:[],
    ltown:[]

  }

  },
  methods: {
    handleAvatarSuccess(res, file) {
      this.imageUrl = URL.createObjectURL(file.raw);
      console.log(this.imageUrl)
    },
    beforeAvatarUpload(file) {
      const isJPG = file.type === 'image/jpeg';
      const isLt2M = file.size / 1024 / 1024 < 2;

      if (!isJPG) {
        this.$message.error('上传头像图片只能是 JPG 格式!');
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!');
      }
      return isJPG && isLt2M;
    },
    add()
    {
      postRequest("/Elder",this.addList).then(
          (result)=>
          {
            this.$router.push("/oldlist")
          }
      )
    },
    changeProvince(province)
    { this.lcity=[];
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
  }
}
</script>

<style lang="less" scoped>
.avatar-uploader .el-upload {
  border: 1px dashed red;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}
.avatar-uploader .el-upload:hover {
  border-color: #409EFF;
}
.avatar-uploader-icon {
  font-size: 28px;
  color: #fff;
  width: 120px;
  height: 120px;
  line-height: 120px;
  text-align: center;
}
.avatar {
  width: 120px;
  height: 120px;
  display: block;
}
</style>
