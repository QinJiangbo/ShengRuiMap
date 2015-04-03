<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="css/ShengRui.css">
    <style type="text/css">
        body, html{width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
        #allmap{
            width: 100%;
            height: 508px;
        } 
        #result{
            width: 100%;
            height: 30px;
            padding-top: 5px;
        }
    </style>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
    <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <title>添加行政区划</title>
</head>
<body>
    <div id="allmap"></div>
    <div id="result">
        <input type="text" id="admin_name" class="spots" placeholder="输入行政区名"/><span class="btn_cloud" onclick="getBoundary()">高亮行政区</span>
    </div>
</body>
</html>
<script type="text/javascript">
    // 百度地图API功能
    var map = new BMap.Map("allmap");
    map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 5);
    map.enableScrollWheelZoom();

    function getBoundary(){       
        var bdary = new BMap.Boundary();
        var ad_name = $("#admin_name").val();
        if(ad_name == ""){
            ad_name = "湖北";
        }
        bdary.get(ad_name, function(rs){       //获取行政区域
            map.clearOverlays();        //清除地图覆盖物       
            var count = rs.boundaries.length; //行政区域的点有多少个
            for(var i = 0; i < count; i++){
                var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#009966"}); //建立多边形覆盖物
                map.addOverlay(ply);  //添加覆盖物
                map.setViewport(ply.getPath());    //调整视野         
            }                
        });   
    }

    setTimeout(function(){
        getBoundary();
    }, 1000);
</script>