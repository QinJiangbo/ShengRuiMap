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
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:100%;height:508px;}
		#result{width: 100%;height: 30px;padding-top: 5px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
	<title>根据关键字本地搜索</title>
</head>
<body>
	<div id="allmap"></div>
	<div id="result">
       <input type="text" id="spots" class="spots" placeholder="请输入搜索的关键字"/><span class="btn_cloud" onclick="searchSpots()">晟睿搜索</span>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");          
	map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 12);
    map.enableScrollWheelZoom();
	var local = new BMap.LocalSearch(map, {
		renderOptions:{map: map}
	});

	function searchSpots(){
		local.search(document.getElementById("spots").value);
	}
</script>