<template>
  <div>
    <el-table
        :data="oldlist"
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
            <p>{{ scope.row.elderName }}</p>

            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.elderName}}</el-tag>
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
          label="民族"
          width="120">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p> {{ scope.row.nation }}</p>

            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.nation }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column
          label="年龄"
          width="80">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p> {{ scope.row.age }}</p>

            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.age }}</el-tag>
            </div>
          </el-popover>
        </template>
      </el-table-column>

      <el-table-column
          label="籍贯"
          width="80">
        <template slot-scope="scope">
          <el-popover trigger="hover" placement="top">
            <p> {{ scope.row.eldernative }}</p>

            <div slot="reference" class="name-wrapper">
              <el-tag size="medium">{{ scope.row.eldernative }}</el-tag>
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
name: "OldList",
  data(){
  return {
    oldlist:[
      {
        id:'1',
        elderName:'张三',
        age:'56',
        gender:'男',
        nation:'汉族',
        eldernative:'湖南',
        birthday:'1978-08-02',

      }
    ],
    currentpg:'1',
    pageSize:'',
    total:'',
  }
  },
  methods:{
   updateData()
   {
     getRequest("/ElderPage/"+this.currentpg).then(

         (result)=>{
           if (result)
           {
             this.oldlist=result.list;
           }
         }
     )
   },
    prebtn(){
      if(this.currentpg>1)
        this.currentpg--;
      getRequest("/ElderPage/"+this.currentpg).then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum;
              this.pageSize=result.pages;
              this.total=result.total;
              this.oldlist=result.list;
            }
          }
      )
    },
    nextbtn(){
      if(this.currentpg<this.pageSize)
      {
        this.currentpg++;
      }
      getRequest("/ElderPage/"+this.currentpg).then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum
              this.pageSize=result.pages;
              this.total=result.total;
              this.oldlist=result.list;
            }
          }
      )
    },
    firstbtn(){
      getRequest("/ElderPage/1").then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum
              this.pageSize=result.pages;
              this.total=result.total;
              this.oldlist=result.list;
            }
          }
      )
    },
    lastbtn(){
      getRequest("/ElderPage/"+this.pageSize).then(
          (result)=>{
            if(result)
            {
              this.currentpg=result.pageNum
              this.pageSize=result.pages;
              this.total=result.total;
              this.oldlist=result.list;
            }
          }
      )
    },
    handleEdit(index,row)
    {
      this.$router.push({path:'editorold',query:{id:row.id}})
    },
    handleDelete(index,row)
    {
      console.log(row.id)
     deleteRequest("/Elder/"+row.id).then((result)=>
     {
       this.updateData();

     })
    }
  },
  mounted() {
    getRequest("/ElderPage/"+this.currentpg).then(
        (result)=>{
          if(result)
          {
            this.currentpg=result.pageNum;
            this.pageSize=result.pages;
            this.total=result.total;
            this.oldlist=result.list;
          }
        }
    )
    this.updateData();
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
