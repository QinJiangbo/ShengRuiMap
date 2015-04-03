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
	<style type="text/css">
	body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
	</style>
	<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=91c6751db5dedb78061cdd1364f1d6c2"></script>
	<title>Map Display</title>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	// 百度地图API功能
	var map = new BMap.Map("allmap");    // 创建Map实例
	map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 11);  // 初始化地图,设置中心点坐标和地图级别
	map.addControl(new BMap.MapTypeControl());   //添加地图类型控件
	map.setCurrentCity("武汉");          // 设置地图显示的城市 此项是必须设置的
	map.enableScrollWheelZoom();
	var top_left_control= new BMap.ScaleControl({anchor:BMAP_ANCHOR_BOTTOM_LEFT});//左上角，添加比例尺
	var top_left_navigation= new BMap.NavigationControl({
	// 靠左上角位置
    anchor: BMAP_ANCHOR_TOP_LEFT,
    // LARGE类型
    type: BMAP_NAVIGATION_CONTROL_LARGE,
    // 启用显示定位
    enableGeolocation: false});
    //左上角，添加默认缩放平移控件
	//var top_right_navigation= new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_RIGHT,type:BMAP_NAVIGATION_CONTROL_ZOOM});//右上角，仅包含平移和缩放按钮 
	/*缩放控件type有三种类型:
	BMAP_NAVIGATION_CONTROL_SMALL：仅包含平移和缩放按钮；
	BMAP_NAVIGATION_CONTROL_PAN:仅包含平移按钮；
	BMAP_NAVIGATION_CONTROL_ZOOM：仅包含缩放按钮*/

	//下面是添加这些控件的代码
	map.addControl(top_left_control);
	map.addControl(top_left_navigation);
	map.addControl(top_right_navigation);

    // 覆盖区域图层测试
	map.addTileLayer(new BMap.PanoramaCoverageLayer());
	
	var stCtrl = new BMap.PanoramaControl(); //构造全景控件
	stCtrl.setOffset(new BMap.Size(20, 20));
	map.addControl(stCtrl);//添加全景控件
</script>