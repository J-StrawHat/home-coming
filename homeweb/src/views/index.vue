<template>
 <div>
   <div id="header">
     <nav class="navbar navbar-default navbar-fixed-top">
       <div class="container-fluid">
         <!-- Brand and toggle get grouped for better mobile display -->
         <div class="navbar-header">
           <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
             <span class="sr-only">Toggle navigation</span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
             <span class="icon-bar"></span>
           </button>
           <a class="navbar-brand" href="#">归家行动</a>
         </div>

         <!-- Collect the nav links, forms, and other content for toggling -->
         <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
           <ul class="nav navbar-nav">
             <li><a href="#">我要寻人 <span class="sr-only">(current)</span></a></li>
             <li><a href="#">提供线索</a></li>
             <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
               <ul class="dropdown-menu">
                 <li><a href="#">Action</a></li>
                 <li><a href="#">Another action</a></li>
                 <li><a href="#">Something else here</a></li>
                 <li role="separator" class="divider"></li>
                 <li><a href="#">Separated link</a></li>
                 <li role="separator" class="divider"></li>
                 <li><a href="#">One more separated link</a></li>
               </ul>
             </li>
           </ul>
           <form class="navbar-form navbar-left">
             <div class="form-group">
               <input type="text" class="form-control" placeholder="Search">
             </div>
             <button type="submit" class="btn btn-default">搜索</button>
           </form>
           <ul class="nav navbar-nav navbar-right">
             <li><a href="#">加入我们</a></li>
             <li class="dropdown">
               <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                  aria-haspopup="true" aria-expanded="false">关于我们 </a>
             </li>
             <li><a href="#"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
             <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
           </ul>
         </div><!-- /.navbar-collapse -->
       </div><!-- /.container-fluid -->
     </nav>
   </div>
   <div id="main">
     <div id="containeiOne">
       <div class="container" id="mycarousal">
         <div id="myCarousel" class="carousel slide" data-ride="carousel" data-internal="">
           <!-- 轮播（Carousel）指标 -->
           <ol class="carousel-indicators">
             <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
             <li data-target="#myCarousel" data-slide-to="1"></li>
             <li data-target="#myCarousel" data-slide-to="2"></li>
           </ol>
           <!-- 轮播（Carousel）项目 -->
           <div class="carousel-inner">
             <div class="item active">
               <img src="../assets/phtots/arriv4.jpg" alt="First slide">
               <div class="carousel-caption">标题 1</div>
             </div>
             <div class="item">
               <img src="../assets/phtots/arriv5.jpg" alt="Second slide">
               <div class="carousel-caption">标题 2</div>
             </div>
             <div class="item">
               <img src="../assets/phtots/arriv2.jpg" alt="Third slide">
               <div class="carousel-caption">标题 3</div>
             </div>
           </div>
           <!-- 轮播（Carousel）导航 -->
           <a class="left carousel-control" href="#" role="button" data-slide="prev">
             <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
             <span class="sr-only">Previous</span>
           </a>
           <a class="right carousel-control" href="#" role="button" data-slide="next">
             <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
             <span class="sr-only">Next</span>
           </a>
         </div>
       </div>
     </div>
     <div id="containerTwo">
       <div id="mycollapse">
         <div class="panel-group" id="accordion">
           <div class="panel panel-default">
             <div class="panel-heading">
               <h4 class="panel-title">
                 <a data-toggle="collapse" data-parent="#accordion"
                    href="#collapseOne">
                   3月份走失老人名单
                 </a>
                 <a href=""><span class="orange floatr" >更多>>></span></a>
               </h4>

             </div>
             <div id="collapseOne" class="panel-collapse collapse in">
               <div class="panel-body">
                 <a href="#">邓鹏程</a>
                 <a href="#">aaaa</a>
                 <a href="#">bbbb</a>
                 <a href="#">邓鹏程</a>
                 <a href="#">aaaa</a>
                 <a href="#">bbbb</a>
                 <a href="#">邓鹏程</a>
                 <a href="#">aaaa</a>
                 <a href="#">bbbb</a>  <a href="#">邓鹏程</a>
                 <a href="#">aaaa</a>
                 <a href="#">bbbb</a>
                 <a href="#">邓鹏程</a>
                 <a href="#">aaaa</a>
                 <a href="#">bbbb</a>
               </div>
             </div>
           </div>
           <div class="panel panel-success">
             <div class="panel-heading">
               <h4 class="panel-title">
                 <a data-toggle="collapse" data-parent="#accordion"
                    href="#collapseTwo">
                   2月份走失老人名单
                 </a>
                 <a href=""><span class="orange floatr" >更多>>></span></a>
               </h4>
             </div>
             <div id="collapseTwo" class="panel-collapse collapse">
               <div class="panel-body">
                 Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred
                 nesciunt sapiente ea proident. Ad vegan excepteur butcher vice
                 lomo.
               </div>
             </div>
           </div>
           <div class="panel panel-info">
             <div class="panel-heading">
               <h4 class="panel-title">
                 <a data-toggle="collapse" data-parent="#accordion"
                    href="#collapseThree">
                   1月份走失老人名单
                 </a>
                 <a href="#"><span class="orange floatr" >更多>>></span></a>
               </h4>
             </div>
             <div id="collapseThree" class="panel-collapse collapse">
               <div class="panel-body">
                 Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred
                 nesciunt sapiente ea proident. Ad vegan excepteur butcher vice
                 lomo.
               </div>
             </div>
           </div>
           <div class="panel panel-warning">
             <div class="panel-heading">
               <h4 class="panel-title">
                 <a data-toggle="collapse" data-parent="#accordion"
                    href="#collapseFour">
                   往年老人走失名单
                 </a>
                 <a href=""><span class="orange floatr" >更多>>></span></a>
               </h4>

             </div>
             <div id="collapseFour" class="panel-collapse collapse">
               <div class="panel-body">
                 Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred
                 nesciunt sapiente ea proident. Ad vegan excepteur butcher vice
                 lomo.
               </div>
             </div>
           </div>
         </div>
       </div>
       <div id="mymovie">
         <video width="400" height="240" controls>
           <source src="../assets/phtots/movie - 副本.mp4" type="video/mp4">
           <source src="" type="video/ogg">
           您的浏览器不支持 HTML5 video 标签。
         </video>
       </div>
       <ul class="list-group">
         <li class="list-group-item"><a href="#">免费 Window 空间托管</a></li>
         <li class="list-group-item"><a href="#">免费 Window 空间托管</a></li>
         <li class="list-group-item"><a href="#">免费 Window 空间托管</a></li>
         <li class="list-group-item"><a href="#">免费 Window 空间托管</a></li>
         <li class="list-group-item"><a href="#">免费 Window 空间托管</a></li>
         <li class="list-group-item"><a href="#">免费 Window 空间托管</a></li>
       </ul>

     </div>
   </div>

   <div id="footer">
     <div id="midfooter">
       <h3>救援电话:0731xxxxxxx</h3>
       <p><a href="">常见问题</a></p>
       <p><a href="">意见发聩</a></p>
       <p><a href="">法律条款</a></p>
       <p>关注我们</p>


     </div>
   </div>
 </div>



</template>

<script>

//

import  'jquery/dist/jquery.min'


export default {

name: "index",
methods:{
  tologin()
  {
    this.$router.push("/login")
  },
  toregister()
  {
    this.$router.push("/register")
  }

},



}
</script>

<style scoped>
@import '~bootstrap/dist/css/bootstrap.css';
@import '../assets/css/mainpage.css';
</style>
