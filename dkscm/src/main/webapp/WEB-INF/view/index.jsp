<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
	 	<link rel="stylesheet" href="static/css/bootstrap.min.css">
  		<link rel="stylesheet" href="static/css/font-awesome.min.css">
  		<link rel="stylesheet" href="static/css/ionicons.min.css">
  		<link rel="stylesheet" href="static/css/AdminLTE.min.css">
  		<link rel="stylesheet" href="static/css/skins/_all-skins.min.css">
  		<script src="static/js/jquery-3.4.1.min.js"></script>
		<script src="static/js/jquery-ui.min.js"></script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/adminlte.min.js"></script>
		<script type="text/javascript">
			function openFrame(url, firstMenuIcon, firstMenuText, secondMenuText) {
				// 设定导航位置
				$("#firstMenuIcon").attr("class", firstMenuIcon);
				$("#firstMenuText").html(firstMenuText);
				$("#secondMenuText").html(secondMenuText);
				
				// 通过父级组件获得其高度
				var height = $("#content").parent().innerHeight() - 80;
				
				// 将iframe增加到相应位置
				var iframe = "<iframe src='" + url + "' style='border: 0px; width: 100%; height: " + height + "px;' onscroll='true'></iframe>";
				$("#content").html(iframe);
			}
		</script>
	</head>
	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
  			<header class="main-header">
    			<a href="#" class="logo">
      				<span class="logo-mini"><b>Angel</b></span>
      				<span class="logo-lg"><b>Angel</b>SCM</span>
    			</a>
    			<nav class="navbar navbar-static-top">
      				<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        				<span class="sr-only">Toggle navigation</span>
      				</a>
      				<div class="navbar-custom-menu">
        				<ul class="nav navbar-nav">
          					<li class="dropdown messages-menu">
            					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
              						<i class="fa fa-envelope-o"></i>
            					</a>
          					</li>
          					<li>
            					<a href="#" data-toggle="control-sidebar">
            						<i class="fa fa-gears"></i>
           						</a>
          					</li>
        				</ul>
      				</div>
    			</nav>
  			</header>
  			<aside class="main-sidebar">
    			<section class="sidebar">
      				<div class="user-panel">
        				<div class="pull-left image"></div>
        				<div class="pull-left info"></div>
      				</div>
      				<ul class="sidebar-menu" data-widget="tree">
        				<li class="header">MAIN NAVIGATION</li>
        				<c:forEach var="first" items="${menuList }">
        					<li class="treeview">
        						<a href="${first.menuUrl }">
        							<i class="${first.menuIcon }"></i>
        							<span>${first.menuText }</span>
        							<span class="pull-right-container">
	              						<i class="fa fa-angle-left pull-right"></i>
	            					</span>
        						</a>
        						<ul class="treeview-menu">
        							<c:forEach var="second" items="${first.childList }">
        								<li>
        									<a href="javascript:openFrame('${second.menuUrl }', '${first.menuIcon }', '${first.menuText }', '${second.menuText }');">
	        									<i class="${second.menuIcon }"></i>
	        									<span>${second.menuText }</span>
	        								</a>
        					 			</li>
        							</c:forEach>
        						</ul>
        					</li>
        				</c:forEach>
      				</ul>
    			</section>
	  		</aside>
  			<div class="content-wrapper">
	    		<section class="content-header">
	      			<h1>Angel物资采购供应链系统</h1>
	      			<ol class="breadcrumb">
	      				<li>
	      					<a href="#">
	      						<i id="firstMenuIcon"></i> 
	      						<span id="firstMenuText"></span>
     						</a>
    					</li>
				        <li class="active">
				        	<span id="secondMenuText"></span>
				        </li>
				      </ol>
	    		</section>
    			<section id="content" class="content"></section>
  			</div>
  			<footer class="main-footer">
    			<div class="pull-right hidden-xs">
      				<b>Version</b> 1.0.0
    			</div>
    			<strong>
    				Copyright &copy; 2019-2024&nbsp;
    				<a href="http://localhost:8080/dkscm/">
    					Angel
   					</a>.
   				</strong> 
   				All rights reserved.
  			</footer>
  			<div class="control-sidebar-bg"></div>
		</div>
	</body>
</html>