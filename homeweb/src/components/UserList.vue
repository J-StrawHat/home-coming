<template>
<div>
  <el-table
      :data="list"
      style="width: 100%">
    <el-table-column
        label="id"
        width="90">
      <template slot-scope="scope" >

        <span style="margin-left: 10px">{{ scope.row.id }}</span>
      </template>
    </el-table-column>
    <el-table-column
        label="姓名"
        width="90">
      <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <p>{{ scope.row.username }}</p>

          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.username }}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>

    <el-table-column
        label="性别"
        width="90">
      <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <p> {{ scope.row.gender }}</p>

          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.gender }}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>


    <el-table-column
        label="出生日期"
        width="120">
      <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <p> {{ scope.row.birthday }}</p>

          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.birthday }}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>

    <el-table-column
        label="电话号码"
        width="120">
      <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <p> {{ scope.row.phone }}</p>

          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.phone }}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>

    <el-table-column
        label="权限"
        width="80">
      <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <p> {{ scope.row.role.roleName }}</p>

          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.role.roleName }}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>

    <el-table-column
        label="创建时间"
        width="120">
      <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <p> {{ scope.row.createTime }}</p>

          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.createTime }}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>

    <el-table-column
        label="地址"
        width="220">
      <template slot-scope="scope">
        <el-popover trigger="hover" placement="top">
          <p> {{ scope.row.province + scope.row.city+scope.row.county+scope.row.town+scope.row.detail}}</p>

          <div slot="reference" class="name-wrapper">
            <el-tag size="medium">{{ scope.row.province + scope.row.city+scope.row.county+scope.row.town+scope.row.detail}}</el-tag>
          </div>
        </el-popover>
      </template>
    </el-table-column>

    <el-table-column label="操作">
      <template slot-scope="scope">
        <el-button
            size="mini"
            @click="handleEdit(scope.$index, scope.row)">编辑</el-button>
        <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  <div class="pagebtn">
    <el-button type="primary" @click="firstbtn()" >首页</el-button>
    <el-button type="primary" @click="prebtn()" >上一页</el-button>
    当前页数:{{currentpg}} - 总页数:{{pageSize}} -总记录数:{{total}}
    <el-button type="primary" @click="nextbtn()" >下一页</el-button>
    <el-button type="primary" @click="lastbtn()" >尾页</el-button>
  </div>

</div>
</template>

<script>
import {deleteRequest, getRequest} from "@/utils/api";

export default {
name: "UserList",
  data(){
  return {

    pageSize:'',
    total:'',
    currentpg:'1',
    hasNextPage:"true",
    hasPrePage:"false",
    list:[
      {
       id:'1',
       username:'guyou',
       gender:'男',
       age:'15',
       birthday:'2007-01-01',
       phone:"13574270388",
        role:{
         id:'1',
          roleName: "add"
        },
        createTime:'2021-03-23',
        province:'湖南省',
        city:"长沙市",
        county:'天心区',
        town:'暮云街道',
        detail:'武胜社区'
      },
      {
        id:'2',
        username:'wyh',
        gender:'男',
        age:'15',
        birthday:'2007-01-01',
        phone:"13574270388",
        role:{
          id:'1',
          roleName:'quan'
        },
        createTime:'2021-03-23',
        province:'湖南省',
        city:"长沙市",
        county:'天心区',
        town:'暮云街道',
        detail:'武胜社区'
      }
    ]
  }
  },
  mounted() {
     this.getdata()
  },
  methods:{
    getdata()
    {
      getRequest("/UserPage/"+this.currentpg).then(
          (result)=>{
            if(result)
            {

              this.pageSize=result.pages;
              this.total=result.total;
              this.hasNextPage=result.hasNextPage;
             this.list=result.list;
            }
          }
      )
    },
    handleEdit(index,row)
    {
       this.$router.push({path:'editor',query:{id:row.id}})
    },
    handleDelete(index,row)
    {

      deleteRequest("/User/?id="+row.id).then((result)=>
      {
       if(result)
       {
          this.getdata();
       }
      })
    },
    prebtn(event){

      if(this.currentpg>1)
      this.currentpg--;
      getRequest("/UserPage/"+this.currentpg).then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum
              this.pageSize=result.pages;
              this.total=result.total;
              this.list=result.list;
            }
          }
      )
    },
    nextbtn(){
      if(this.currentpg<this.pageSize)
      {
        this.currentpg++;
      }
      getRequest("/UserPage/"+this.currentpg).then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum
              this.pageSize=result.pages;
              this.total=result.total;
              this.list=result.list;
            }
          }
      )
    },
    firstbtn(){
      getRequest("/UserPage/1").then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum
             this.pageSize=result.pages;
              this.total=result.total;
              this.list=result.list;
            }
          }
      )
    },
    lastbtn(){
      getRequest("/UserPage/"+this.pageSize).then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum
              this.pageSize=result.pages;
              this.total=result.total;
              this.list=result.list;
            }
          }
      )
    }
  }
}
</script>

<style lang="less" scoped>
.pagebtn {

  display: flex;
  justify-content: center;
  align-items: center;
  .el-button {
    margin-right: 20px;
  }
}

</style>
