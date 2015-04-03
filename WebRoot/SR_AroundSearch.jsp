<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!Doctype html>
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
	overflow: hidden;margin:0;font-family:"微软雅黑";
} 
#result{
	width: 100%;
	height: 30px;
	padding-top: 5px;
}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
<title>根据中心点关键字周边搜索</title>
</head>
<body>
<div id="allmap"></div>
<div id="result">
   <input type="text" id="spot" class="spots" placeholder="请输入搜索的地点"/>
   <input type="text" id="key" class="spots" placeholder="周边的特色内容"/>
   <span class="btn_cloud" onclick="searchAround()">晟睿搜索</span>
</div>
</body>
</html>
<script type="text/javascript">

// 百度地图API功能
var map = new BMap.Map("allmap");            // 创建Map实例
map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 11);
var local = new BMap.LocalSearch(map, {
  renderOptions:{map: map, autoViewport:true}
});
map.enableScrollWheelZoom();
function searchAround(){
	local.searchNearby(document.getElementById("key").value,document.getElementById("spot").value);
}
</script>