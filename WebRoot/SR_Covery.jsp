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
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{height:508px;width:100%;}
		#r-result{width:100%;height: 30px;padding-top: 5px;}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
	<title>添加/删除覆盖物</title>
</head>
<body>
	<div id="allmap"></div>
	<div id="r-result">
		<div class="btn_cloud" onclick="add_overlay();">添加覆盖物</div>
		<div class="btn_cloud" onclick="remove_overlay();">删除覆盖物</div>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 15);
    map.enableScrollWheelZoom();
	
	var point = new BMap.Point(114.3615, 30.5335);
	var marker = new BMap.Marker(point); // 创建点
	map.addOverlay(marker);//添加到地图上去
	marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
	
	var circle = new BMap.Circle(point,3000,{strokeColor:"white", strokeWeight:1, strokeOpacity:0.5,fillColor:"#009966",fillOpacity:0.5}); //创建圆
	
	//添加覆盖物
	function add_overlay(){
		map.addOverlay(marker);
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		map.addOverlay(circle);            //增加圆
	}
	//清除覆盖物
	function remove_overlay(){
		map.clearOverlays();        
	}
</script>