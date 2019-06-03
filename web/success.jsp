<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="com.unicom.entity.User,com.unicom.register.dao.ViewImpl" %>
<%
    String basePath = request.getScheme() + "://" + request.getServerName()
            + ":" + request.getServerPort() + request.getContextPath();
%>
<%
    User user = new User();

    String username = request.getParameter("username");
    //username="liwanru";
    ViewImpl view = new ViewImpl();
    // List<Blog> list=view.query(username);
    //Iterator<Blog> it=list.iterator();
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>博客统计</title>
    <link rel="icon" href="<%=basePath %>/img/favicon.png" type="image/png">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Easy Admin Panel Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css'/>
    <!-- Custom CSS -->
    <link href="css/style1.css" rel='stylesheet' type='text/css'/>

    <!-- jQuery -->

    <link rel="stylesheet" href="css/_header.scss" type='text/css'/>
    <!-- //lined-icons -->
    <!-- chart -->
    <script src="js/echarts.min.js"></script>
    <!-- //chart -->
    <!--animate-->


    <!--//end-animate-->
    <!----webfonts--->
    <link href='http://fonts.useso.com/css?family=Cabin:400,400italic,500,500italic,600,600italic,700,700italic'
          rel='stylesheet' type='text/css'>
    <!---//webfonts--->
    <!-- Meters graphs -->
    <script src="js/jquery-1.10.2.min.js"></script>
    <!-- Placed js at the end of the document so the pages load faster -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="<%=basePath %>/css/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/linericon/style.css">
    <link rel="stylesheet" href="<%=basePath %>/css/font-awesome.min.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/owl-carousel/owl.carousel.min.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/lightbox/simpleLightbox.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/nice-select/css/nice-select.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/animate-css/animate.css">
    <link rel="stylesheet" href="<%=basePath %>/vendors/jquery-ui/jquery-ui.css">
    <!-- main css -->
    <link rel="stylesheet" href="<%=basePath %>/css/style.css">
    <link rel="stylesheet" href="<%=basePath %>/css/responsive.css">
    <!-- 自定义css -->
    <link rel="stylesheet" href="<%=basePath %>/css/pagination.css">
    <link rel="stylesheet" href="<%=basePath %>/css/homepage.css">
</head>

<body class="sticky-header left-side-collapsed" onload="initMap()">
<!--================Header Menu Area =================-->
<header class="header_area">
    <div class="main_menu">
        <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container box_1620">
                <!-- Brand and toggle get grouped for better mobile display -->
                <!-- <a class="navbar-brand logo_h" href="index.html"><img src="img/logo.png" alt=""></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button> -->
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav">
                        <li class="nav-item active"><a class="nav-link" href="<%=basePath %>/homepage.jsp" style="font-family: 微软雅黑;">首页</a></li>
                        <li class="nav-item submenu dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button"
                               aria-haspopup="true" aria-expanded="false" style="font-family: 微软雅黑;">分类</a>
                            <ul class="dropdown-menu">
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=政治经济" style="font-family: 微软雅黑;">政治经济</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=科技" style="font-family: 微软雅黑;">科技</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=体育" style="font-family: 微软雅黑;">体育</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=健康" style="font-family: 微软雅黑;">健康</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="<%=basePath %>/classification.jsp?category=旅游" style="font-family: 微软雅黑;">旅游</a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/success.jsp" style="font-family: 微软雅黑;">统计</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/MineServlet?username=<%=request.getSession().getAttribute("username") %>&category=all" style="font-family: 微软雅黑;">
                            我的博客</a></li>
                        <li class="nav-item"><a class="nav-link" href="<%=basePath %>/follow.jsp" style="font-family: 微软雅黑;">博客收藏</a></li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right header_social ml-auto">
                        <li class="nav-item"><a href="<%=basePath %>/login.jsp"></i>退出</a></li>

                    </ul>
                </div>
            </div>
        </nav>
    </div>
</header>
<!--================Header Menu Area =================-->

<div style="margin-top: 80px;margin-left: 80px;">
    <div style="height: 260px;  ">
        <div
                style="float: left; margin-right: 10px; width: 23%; height: 260px; background: #fff">

            <div id="a1" style="height: 130px;background:#f9f9f9;border: 1px solid #dae0e5"><div style="height:30px;"><p align="center" style="line-height: 30px;color:#fff;float: left; width:100px;margin-left:35%;margin-top: 50px;background: #8BC34A">阅读量</p></div></div>
            <div style="height: 130px; ">
                <h1 align="center" style="line-height: 150px"><%=view.query(username)%></h1>
            </div>
        </div>
        <div
                style="float: left; margin-right: 10px; width: 23%; height: 260px; background: #fff">

            <div id="a2" style="height: 130px;background:#f9f9f9;border: 1px solid #dae0e5"><div style="height:30px;"><p align="center" style="line-height: 30px;color:#fff;float: left; width:100px;margin-left:35%;margin-top: 50px;background: #00BCD4">点赞量</p></div></div>
            <div style="height: 130px; ">
                <h1 align="center" style="line-height: 150px"><%=view.query2(true,username)%></h1>
            </div>
        </div>
        <div
                style="float: left; margin-right: 10px; width: 23%; height: 260px; background: #fff">

            <div id="a3" style="height: 130px;background:#f9f9f9;border: 1px solid #dae0e5"><div align="center" style="height:30px;"><p align="center" style="line-height: 30px;color:#fff;float: left; width:100px;margin-left:35%;margin-top: 50px;background: red">收藏量</p></div></div>
            <div style="height: 130px; ">
                <h1 align="center" style="line-height: 150px"><%=view.query1(false)%></h1>
            </div>
        </div>
        <div
                style="float: left; margin-right: 10px; width: 23%; height: 260px; background: #fff">

            <div id="a4" style="height: 130px;background:#f9f9f9;border: 1px solid #dae0e5"><div style="height:30px;"><p align="center" style="line-height: 30px;color:#fff;float: left; width:100px;margin-left:35%;margin-top: 50px;background: #FFCA28">文章数</p></div></div>
            <div style="height: 130px; ">
                <h1 align="center" style="line-height: 150px"><%=view.query4(username)%></h1>
            </div>
        </div>

    </div>



            <div style="height: 300px; margin-top: 30px">
                <div
                        style="float: left; margin-right: 30px; width: 30%; height: 300px; background: #fff">
                    <div style="height: 50px; background: red">
                        <p align="center" style="line-height: 50px">点赞量前6</p>
                    </div>
                    <div id="dd" style="height: 200px;"></div>
                </div>
                <div
                        style="float: left; margin-right: 30px; width: 30%; height: 300px; background: #fff">
                    <div style="height: 50px; background: #FFCA28">
                        <p align="center" style="line-height: 50px">阅读量排名前6的文章</p>
                    </div>
                    <div id="cc" style="height: 200px;"></div>
                </div>
                <div
                        style="float: left; margin-right: 30px; width: 30%; height: 300px; background: #fff">
                    <div style="height: 50px; background: #00BCD4">
                        <p align="center" style="line-height: 50px;">文章分类</p>
                    </div>
                    <div id="ee" style="height: 200px;"></div>
                </div>
            </div>

</div>
            <!--footer section end-->

            <!-- main content end-->
            </div>

</body>
</html>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    // 基于准备好的dom，初始化echarts实例
    // alert(111);
    var myChart = echarts.init(document.getElementById('ee'));
    option = {
        tooltip: {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient: 'vertical',
            x: 'left',
            data: ['政治经济', '科技', '体育', '健康', '旅游']
        },
        toolbox: {
            show : true,
            feature : {

                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'center',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'访问来源',
                type:'pie',
                radius : ['50%', '70%'],
                itemStyle : {
                    normal : {
                        label : {
                            show : false
                        },
                        labelLine : {
                            show : false
                        }
                    },
                    emphasis : {
                        label : {
                            show : true,
                            position : 'center',
                            textStyle : {
                                fontSize : '30',
                                fontWeight : 'bold'
                            }
                        }
                    }
                },
                data:[
                    {value:200, name:'政治经济'},
                    {value:80, name:'科技'},
                    {value:300, name:'体育'},
                    {value:100, name:'健康'},
                    {value:150, name:'旅游'}
                ]
            }
        ]
    };
    myChart.setOption(option);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    // 基于准备好的dom，初始化echarts实例
    // alert(111);
    var myChart8 = echarts.init(document.getElementById('cc'));
    //alert(121);
    option8 = {
        tooltip : {
            trigger: 'axis',
            formatter:
                function(params)
                { return params[0].name+"<br>"+params[1].seriesName+":"+params[1].data+"<br>" +params[0].seriesName+":"+params[0].data+"次" }
        },
        toolbox: {
            show : true,

        },
        calculable : true,
        legend: {
            x: 'center' ,

            y:  'bottom' ,
            data:[],

        },
        xAxis : [
            {
                type : 'category',
                axisLine:{
                    lineStyle:{
                        color:'#4ad2ff',
                        width:1,//这里是为了突出显示加上的
                    }
                } ,
                data :  ['博客1','博客2','博客3','博客4','博客5','博客6'],
                axisLabel:{
                    interval: 0,
                    rotate:40
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '次',
                min: 0,
                max: 150,
                splitNumber: 7,
                splitLine:{
                    show:false
                },
                axisLine:{
                    lineStyle:{
                        color:'#4ad2ff',
                        width:1,//这里是为了突出显示加上的
                    }
                } ,
                axisLabel : {
                    formatter: '{value} '
                }
            },
            {
                type : 'value',
                name : '',
                min: 0,
                max: 0,
                splitNumber: 0,
                splitLine:{
                    show:false
                },
                axisLine:{
                    lineStyle:{
                        color:'#B74AE5',
                        width:0,//这里是为了突出显示加上的
                    }
                } ,
                axisLabel : {
                    formatter: '{value} '
                }
            }
        ],
        series : [

            {
                name:'关注次数',
                type:'bar',
                barWidth : 15,
                itemStyle : {
                    normal : {
                        color:'#6959CD',
                        lineStyle:{
                            color:'#6959CD'
                        }
                    }
                },

                data:[23,52,14,71, 27,20]
            },

            {
                name:'博客标题',
                type:'line',


                itemStyle : {
                    normal : {
                        color:'#0AAF9F',
                        lineStyle:{
                            color:'#0AAF9F'
                        }
                    }
                },
                data:[0,0,0,0,0,0]
            },

        ]
    };

    myChart8.setOption(option8);


    // 指定图表的配置项和数据

    setTimeout(function(){//把option.series[0].data[0].value的值使用random()方法获取一个随机数
        /* 	$.ajax({
                        type : "post",
                        async : false, //同步执行
                        url : "cpu",
                        data : {},
                        dataType : "json", //返回数据形式为json
                        success : function(data1) {  */
        //alert(111);
        $.ajax({
            type : "post",
            async : false, //同步执行
            url : "ViewServlet",
            data : {},
            dataType : "json", //返回数据形式为json
            success : function(data1) {
                //alert(11);
                var cc=[]
                var dd=[1,2,3,4,5,6]
                $.each(data1, function(index,obj) {

                    if(index<7)	{
                        cc[index]=data1[index].views
                        dd[index]=data1[index].title

                        // alert( dd[index]);
                    }
                });

                /* $.post("/ViewServlet",{},function(data3){  */

                var data2=[{
                    "car":(Math.random() * 100).toFixed(2) - 0 ,
                    "cc":(Math.random() * 100).toFixed(2) - 0
                }]


                /* 		 var myChart = echarts.init(document.getElementById('main1'));
                    var neicui=10*((data3.totalMem)/(data3.usedMem)).toFixed(2)  */

                option8.series[0].data =cc;
                option8.series[1].data =dd;
                // alert(134)
                myChart8.setOption(option8, true);
            }})  }, 1000);
</script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    // 基于准备好的dom，初始化echarts实例
    // alert(111);
    var myChart9 = echarts.init(document.getElementById('dd'));
    //alert(121);
    option9 = {
        tooltip : {
            trigger: 'axis',
            formatter:function(params){
                return params[0].name+params[0].seriesName+":"+params[0].data+"次" }
        },
        toolbox: {
            show : true,

        },
        calculable : true,
        legend: {
            x: 'center' ,

            y:  'top' ,
            data:[{name:'点赞次数',
                textStyle:{color:"#4ad2ff"}
            }

                ],



        },
        xAxis : [
            {
                type : 'category',
                axisLine:{
                    lineStyle:{
                        color:'#4ad2ff',
                        width:1,//这里是为了突出显示加上的
                    }
                } ,
                data : ['博客1','博客2','博客3','博客4','博客5','博客6'],
                axisLabel:{
                    interval: 0,
                    rotate:40
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                name : '次',
                min: 0,
                max:100,
                splitNumber: 5,
                splitLine:{
                    show:false
                },
                axisLine:{
                    lineStyle:{
                        color:'#4ad2ff',
                        width:1,//这里是为了突出显示加上的
                    }
                } ,
                axisLabel : {
                    formatter: '{value} '
                }
            },

        ],
        series : [

            {
                name:'',
                type:'bar',
                barWidth : 15,
                itemStyle : {

                    normal : {
                        color:'#4ad2ff',
                        lineStyle:{
                            color:'#4ad2ff'
                        }
                    }
                },

                data:[101, 90, 36,40,95,59,]
            }
        ]
    };

    myChart9.setOption(option9);


    // 指定图表的配置项和数据

    setTimeout(function(){//把option.series[0].data[0].value的值使用random()方法获取一个随机数
        $.ajax({
            type : "post",
            async : false, //同步执行
            url : "FollowServlet",
            data : {},
            dataType : "json", //返回数据形式为json
            success : function(data1) {
                //alert(111);
                var cc=[101 -Math.floor(Math.random()*1),
                    90-Math.floor(Math.random()*1),
                    62-Math.floor(Math.random()*1),
                    40 -Math.floor(Math.random()*1),
                    95-Math.floor(Math.random()*1),

                    59-Math.floor(Math.random()*1),
                    /* 69-Math.floor(Math.random()*1),

                    46-Math.floor(Math.random()*1), */];
                $.each(data1, function(index,obj) {

                    if(index<7)	{
                        cc[index]=data1[index].id
                        // alert( cc[index]);
                    }
                });


                <!-- $.post("../getserverinfo",{},function(data3){ -->

                var data2=[{
                    "car":(Math.random() * 100).toFixed(2) - 0 ,
                    "cc":(Math.random() * 100).toFixed(2) - 0
                }]


                /* 		 var myChart = echarts.init(document.getElementById('main1'));
                    var neicui=10*((data3.totalMem)/(data3.usedMem)).toFixed(2)  */

                option9.series[0].data =cc;

                // alert(134)
                myChart9.setOption(option9, true);
                /*  }})  */}})},1000);
</script>