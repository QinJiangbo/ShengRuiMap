<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!Doctype html>
<html>
<head>
	<title>ShengRui Map Index</title>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="css/ShengRui.css">
	<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
	<script type="text/javascript" src="js/script.js"></script>
	<link rel="shortcut icon" href="favicon.ico">
</head>

<body>
    <div id="topbar">晟睿地图</div>
    <div id="content">
       <div id="sidebar">
          <div class="items" id="mainMap" onclick="mainMap()">
             主地图显示
          </div>
          <div class="items" id="cloud" onclick="cloud()">
             <li>
               <span>云麻点图</span>
               <ul> 
                 <li><a href="SR_StarMap.jsp" target="displayArea">海量数据点图</a></li>
                 <hr class="divider"/>
                 <li><a href="SR_Administration.jsp" target="displayArea">行政区高亮</a></li>
               </ul>
             </li>
          </div>
          <div class="items" id="message" onclick="message()">
             短信发送位置信息
          </div>
          <div class="items" id="streeView" onclick="streeView()">
             全景地图
          </div>
          <div class="items" id="localSearch" onclick="localSearch()">
             本地检索
          </div>
          <div class="items" id="aroundSearch" onclick="aroundSearch()">
             周边检索
          </div>
          <div class="items" id="busSearch" onclick="busSearch()">
             公交检索
          </div>
          <div class="items" id="carSearch" onclick="carSearch()">
             驾车检索
          </div>
          <div class="items" id="covery" onclick="covery()">
             覆盖物
          </div>
          <div class="items" id="revertCoding" onclick="revertCoding()">
             <li>
               <span>逆/地理编码</span>
               <ul> 
                 <li><a href="SR_GeoCoding.jsp" target="displayArea">地理编码(定位)</a></li>
               </ul>
             </li>
          </div>
          <div class="items" id="realTransport" onclick="realTransport()">
             实时交通
          </div>
       </div>
       <div id="mainframe">
           <iframe id="map" name="displayArea" ></iframe>
       </div>
       <div class="clearfix"></div>
    </div>
</body>

</html>