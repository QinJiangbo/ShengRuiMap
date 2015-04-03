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
		body, html{width: 100%;height: 100%;margin:0;font-family:"微软雅黑";font-size:14px;}
		#allmap {width:100%;height:508px;}
		#result{
			width: 100%;
			height: 30px;
			padding-top: 5px;
		}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
	<script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
	<title>逆地址解析</title>
</head>
<body>
	<div id="allmap"></div>
	<div id="result">
       <input type="text" id="province" class="geo_coder" placeholder="省" />
	   <input type="text" id="city" class="geo_coder" placeholder="市" />
	   <input type="text" id="district" class="geo_coder" placeholder="区" />
	   <input type="text" id="street" class="geo_coder" placeholder="街道" />
	   <input type="text" id="streetNumber" class="geo_coder" placeholder="街号"/>
	   <input type="text" id="lng" class="geo_lng" placeholder="经度"/>
	   <input type="text" id="lat" class="geo_lat" placeholder="纬度"/>
	</div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");
	map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 12);
    map.enableScrollWheelZoom();
	var geoc = new BMap.Geocoder();    

	map.addEventListener("click", function(e){        
		var pt = e.point;
		geoc.getLocation(pt, function(rs){
			var addComp = rs.addressComponents;
			$("#province").val( addComp.province) ;
			$("#city").val( addComp.city) ;
			$("#district").val( addComp.district ) ;
			$("#street").val( addComp.street );
			$("#streetNumber").val( addComp.streetNumber );
			$("#lng").val( pt.lng );
			$("#lat").val( pt.lat );
		});        
	});
</script>