<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!Doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<link href="http://api.map.baidu.com/library/TrafficControl/1.4/src/TrafficControl_min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.4"></script>
<script type="text/javascript" src="http://api.map.baidu.com/library/TrafficControl/1.4/src/TrafficControl_min.js"></script>
 </head>

 <body>
   
    <div style="width:100%;height:538px" id="container">
    </div>
    <script type="text/javascript">
       var map = new BMap.Map("container");
      
       map.centerAndZoom(new BMap.Point(114.3615, 30.5335), 12);
       map.enableScrollWheelZoom();
       var ctrl = new BMapLib.TrafficControl({
           showPanel: false //是否显示路况提示面板
       });      
       map.addControl(ctrl);
       ctrl.setAnchor(BMAP_ANCHOR_BOTTOM_RIGHT); 
    </script>
 </body>
</html>