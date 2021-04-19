<template>
<div>
  <el-breadcrumb separator-class="el-icon-arrow-right" >
    <el-breadcrumb-item v-for="it of $store.state.current" >{{it}}</el-breadcrumb-item>

  </el-breadcrumb>
</div>
</template>

<script>
export default {
name: "Breadcrumb",
  data(){
    return {

    }
  }
}
</script>

<style scoped>

</style>
