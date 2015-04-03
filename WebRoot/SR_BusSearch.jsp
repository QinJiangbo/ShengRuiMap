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
		#result_panel{height: 508px;width: 25%;float: left;overflow-y: scroll;background-color: rgb(0,153,102);}
		#l-map{height:508px;width:75%;float: left;}
		#driving_way{
			width: 100%;height: 30px;padding-top: 5px;
		}
		#driving_way select{
			width: 200px;
			height: 30px;
			line-height: 30px;
			border-color: #009966;
			text-align: center;
			font-size: 18px;
			padding: 0 0 0 55px;
			margin-left: 30px;
		}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<title>根据起终点名称查询公交换乘</title>
</head>
<body>
	<div id="mainPanel">
		<div id="l-map"></div>
		<div id="result_panel"></div>
	</div>
	<div id="driving_way">
		<input type="text" id="start" class="spots" placeholder="起点" />
		<input type="text" id="end" class="spots" placeholder="终点" />
		<select>
			<option value="0">最少时间</option>
			<option value="1">最少换乘</option>
			<option value="2">最少步行</option>
			<option value="3">不乘地铁</option>
		</select>
		<span class="btn_cloud" id="result">晟睿搜索</span>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("l-map");         
	map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 12);
    map.enableScrollWheelZoom();

	var routePolicy = [BMAP_TRANSIT_POLICY_LEAST_TIME,BMAP_TRANSIT_POLICY_LEAST_TRANSFER,BMAP_TRANSIT_POLICY_LEAST_WALKING,BMAP_TRANSIT_POLICY_AVOID_SUBWAYS];
	$("#result").click(function(){
		/* 注意！！！这个地方会有JS里面常见的变量作用域问题，常量不会影响，所以必须得放在这个函数体里，否则not defined！*/
		var start = $("#start").val(); //JQuery取值
	    var end = $("#end").val();

		map.clearOverlays();
		var i=$("#driving_way select").val();
		search(start,end,routePolicy[i]);
		function search(start,end,route){ 
			var transit = new BMap.TransitRoute(map, {
				renderOptions: {map: map,panel:"result_panel"},
				policy: route
			});
			transit.search(start,end);
		}
	});
</script>