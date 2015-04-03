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
		body, html {width: 100%;height: 100%; margin:0;font-family:"微软雅黑";}
		#mainPanel{height: 508px;width: 1050px;}
		#allmap{height:508px;width:75%;float: left;}
		#result_panel{height: 508px;width: 25%;float: left;overflow-y: scroll;background-color: rgb(0,153,102);}
		#driving_way{width:100%;height: 30px;padding-top:5px; }
		#driving_way select{
			width: 200px;
			height: 30px;
			line-height: 30px;
			border-color: #009966;
			text-align: center;
			font-size: 18px;
			padding: 0 0 0 55px;
			margin-left: 35px;
		}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<title>根据起终点名称驾车导航</title>
</head>
<body>
	<div id="mainPanel">
		<div id="allmap"></div>
		<div id="result_panel"></div>
	</div>
	
	<div id="driving_way">
		<input type="text" id="start" class="spots" placeholder="起点" />
		<input type="text" id="end" class="spots" placeholder="终点" />
		<select>
			<option value="0">最少时间</option>
			<option value="1">最短距离</option>
			<option value="2">避开高速</option>
		</select>
		<span class="btn_cloud" id="result">晟睿搜索</span>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");

	map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 11);
	map.enableScrollWheelZoom();
	//三种驾车策略：最少时间，最短距离，避开高速
	var routePolicy = [BMAP_DRIVING_POLICY_LEAST_TIME,BMAP_DRIVING_POLICY_LEAST_DISTANCE,BMAP_DRIVING_POLICY_AVOID_HIGHWAYS];
	$("#result").click(function(){
		var start = $("#start").val();
	    var end = $("#end").val();
		map.clearOverlays(); 
		var i=$("#driving_way select").val();
		search(start,end,routePolicy[i]); 
		function search(start,end,route){ 
			var driving = new BMap.DrivingRoute(map, {renderOptions:{map: map, autoViewport: true,panel:"result_panel"},policy: route});
			driving.search(start,end);
		}
	});
</script>