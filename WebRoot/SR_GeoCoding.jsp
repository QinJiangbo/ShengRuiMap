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
		#allmap {
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
	<title>地址解析</title>
</head>
<body>
	<div id="allmap"></div>
	<div id="result">
       <input type="text" id="code_lng" class="code_lng" placeholder="经度"/>
	   <input type="text" id="code_lat" class="code_lat" placeholder="纬度"/>
	   <span class="btn_cloud" id="geo_btn" onclick="locate()">晟睿定位</span>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	var point = new BMap.Point(114.3615, 30.5335);
	map.centerAndZoom(point,12);
	map.enableScrollWheelZoom();

	// 创建地址解析器实例
	//var myGeo = new BMap.Geocoder();
	// 将地址解析结果显示在地图上,并调整地图视野
	/*
	myGeo.getPoint("北京市海淀区上地10街", function(point){
		if (point) {
			map.centerAndZoom(point, 16);
			map.addOverlay(new BMap.Marker(point));
		}
	}, "北京市");
    */
    function locate(){
    	var lng = $("#code_lng").val();
    	var lat = $("#code_lat").val();
    	if(lng==""||lat==""){
    		var geolocation = new BMap.Geolocation();
    		geolocation.getCurrentPosition(function(r){
    			if(this.getStatus() == BMAP_STATUS_SUCCESS){
    				lng = r.point.lng;
    				lat = r.point.lat;
    				alert("您的当前位置是 "+lng+','+rlat);
    			}else{
    				alert('failed'+this.getStatus());
    			}
    		},{enableHighAccuracy:true});
    	}
    	var location = new BMap.Point(lng, lat);
    	/*
    	myGeo.getLocation(location,function(point){
    		if(point){
    			map.centerAndZoom(location, 16);
    			var mark = new BMap.Marker(point);
			    map.addOverlay( mark );
			    mark.setAnimation(BMAP_ANIMATION_BOUNCE);
    		}
    	});
    	*/
    	map.clearOverlays();
    	map.centerAndZoom(location, 8);
    	var marker = new BMap.Marker(location);
    	map.addOverlay(marker);
    	map.panTo(location);
    	marker.setAnimation(BMAP_ANIMATION_BOUNCE);
    }
</script>
