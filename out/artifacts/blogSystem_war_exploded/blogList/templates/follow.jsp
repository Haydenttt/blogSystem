
<%@page contentType="text/html;charset=UTF-8" language="java"%>

<html>
<head>
    <title>我的关注</title>
    <link rel="stylesheet" href="https://cdn.bootcss.com/weui/1.1.3/style/weui.min.css">
    <link rel="stylesheet" href="https://cdn.bootcss.com/jquery-weui/1.2.1/css/jquery-weui.min.css">
<style>
.pClass{
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;

}
</style>
</head>
<body>
<center><h1>我的关注</h1></center>
        <div class="weui-cells">
            <div class="weui-form-preview" id="Tolist"></div>
        </div>
        <div id="demo2-1"></div>
        <script src="https://cdn.bootcss.com/jquery/1.11.0/jquery.min.js"></script>
        <script src="https://cdn.bootcss.com/jquery-weui/1.2.1/js/jquery-weui.min.js"></script>
        <script src="../js/folow.js"></script>
        <script>
            $(document).ready(function(){
                loadList();
                
                $.ajax({	    	
                    url: "<%=request.getContextPath()%>/qryFollow",        //后台url
                    type: "post",                   //类型，POST或者GET
                    dataType: 'json',              //数据返回类型，可以是xml、json等
                    success: function (data) {      //成功，回调函数 	 
                    	 var jsp = "";
                        for (var i = 0; i < data.length; i++) {
                            jsp += '<a class="weui-cell weui-cell_access" href="javascript:;">';
                            jsp += '<div class="layui-col-md2">';
                            jsp += '<div class="layui-row grid-demo">';
                            jsp += '<div class="layui-col-md12 layui-col-md-offset2">';
                            jsp += '<img src='+data[i].coverImageUrl+' alt="" style="width:150px;margin-right:5px;display:block">';
                            jsp += '</div>';
                            jsp += '</div>';
                            jsp += '</div>';
                            jsp += '<div class="layui-col-md9">';
                            jsp += '<div class="layui-row grid-demo grid-demo-bg1">';
                            jsp += '<div class="layui-col-md12">';
                            jsp += '<p style="font-size:30px;color: #444444">'+data[i].title+'</p>';
                            jsp += '</div>';
                            jsp += '<div class="layui-col-md12">';
                            jsp += '<p style="font-size:20px;color: #999999;" class="pClass">'+data[i].content+'</p>';
                            jsp += '</div>';
                            jsp += '</div>';
                            jsp += '</div>';
                            jsp += '</a>';
                        }
                        $("#Tolist").append(jsp);
                    },
                    error: function (er) {          //失败，回调函数
                    
                    }
                }); 
            });
       
        </script>
    </body>
</html>
