<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.realtor.model.*"%>
<%@ page import="com.realestate.model.*"%>

<jsp:useBean id="realestateSvc" scope="page"
	class="com.realestate.model.RealEstateService" />

<%
	RealtorVO realtorVO = (RealtorVO) session.getAttribute("realtorVO");
	RealtorVO realtorVO2 = (RealtorVO) request.getAttribute("realtorVO");
	if (realtorVO == null) { // 如為 null, 代表此user未登入過 , 才做以下工作
		session.setAttribute("location", request.getRequestURI()); //*工作1 : 同時記下目前位置 , 以便於login.jsp登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java)
		response.sendRedirect("realtor_login.jsp"); //*工作2 : 請該user去登入網頁(login.jsp) , 進行登入
		return;
	}
%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<link rel="shortcut icon" href="images/houselogo1.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/front/realtor/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<!-- Custom Theme files -->

<!-- navbar.css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/front/realtor/css/main.css">
<!-- navbar.css -->

<!-- cooperkai.css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front/realtor/css/realtor_cooper.css">
<!-- cooperkai.css -->

<!-- 必備Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">
<!-- Latest compiled and minified CSS -->


<script src="https://code.jquery.com/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 必備Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<!-- Latest compiled and minified JavaScript -->

<!-- 阿逵的 -->
<script src="<%=request.getContextPath()%>/front/realtor/js/main.js"></script>
<!-- 阿逵的 -->

<!-- realtor_cooperkai.js -->
<script
	src="<%=request.getContextPath()%>/front/realtor/js/realtor_cooper.js"></script>
<!-- realtor_cooperkai.js -->

<title>For House</title>
</head>

<body>
	<div class="container-fluid backgroundpng">
		<img class="row"
			src="<%=request.getContextPath()%>/images/fixed_bg.png">
	</div>
	<!-- navbar開始 -->
	<div class="main">
		<nav class="navbar navbar-fixed-top">
		<div class="container">
			<div class="navbar-header col-xs-12 col-sm-2">
				<a class="navbar-brand "
					href="<%=request.getContextPath()%>/front/frontPage/index.jsp"
					title="回ForHouse首頁"><img class="navshadow"
					src="<%=request.getContextPath()%>/images/For House logo.png"
					width="120px"></a>
			</div>
			<div class="col-xs-12 col-sm-8 ">
				<ul class="nav navbar-nav activebar">
					<li><a href="#" data-toggle="tooltipNews"
						data-placement="bottom">最新消息</a></li>
					<li><a href="#">常見問題</a></li>
					<li><a href="#">看房去</a></li>
					<!-- 判斷房仲VO，有的話就不顯示找房仲 -->
					<c:if test="${realtorVO == null}">
						<li><a
							href="<%=request.getContextPath()%>/front/realtor/realtor.do?action=listQueryB">
								找房仲 </a></li>
					</c:if>
					<!-- 判斷房仲VO，有的話就不顯示找房仲結束 -->
					<li><a href="#">安家商城</a></li>
					<li><a href="#">加入我們</a></li>
				</ul>
			</div>
			<div class="col-sm-12 col-sm-2" id="cooper_log_right_top">
				<ul class="nav navbar-nav navbar-right">
					<li><a
						href="<%=request.getContextPath()%>/front/realtor/realtor_center.jsp">
							<span class="glyphicon glyphicon-user"></span> <c:if
								test="${realtorVO != null}">
								<%=realtorVO.getRtr_name()%>
							</c:if> <c:if test="${realtorVO == null}">
								註冊
							</c:if>
					</a></li>
					<li><a
						href="<%=request.getContextPath()%>/front/realtor/realtor_login.jsp">
							<span class="glyphicon glyphicon-log-in"></span> <c:if
								test="${realtorVO != null}">
								登出
							</c:if> <c:if test="${realtorVO == null}">
								登入
							</c:if>
					</a></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	<!-- navbar結束 -->

	<!-- 房仲左邊功能列 =====================================================================================-->
	<div class="container">
		<div class="row">
			<!-- 充版面用 -->
			<div class="col-sm-1"></div>
			<!-- 充版面用 -->

			<!-- 左邊bar =================================================================================-->
			<div class="col-sm-12 col-sm-2 side-bar cooper_side_bar">
				<div class="logo text-center">
					<a href="#"><img
						src="<%=request.getContextPath()%>/tool/showimage.do?action=rtr_photo&rtr_no=${realtorVO.rtr_no}"
						class="w3ls-mobile rtr_photo" alt="<%=realtorVO.getRtr_name()%>個人照片" data-pin-nopin="true"
						style="width: 50%; height: 40%;" title="房仲中心"> </a>
				</div>
				<div class="navigation">
					<h3>個人資料管理</h3>
					<ul>
						<li><a
							href="<%=request.getContextPath()%>/front/realtor/realtor_center.jsp"><i
								class="glyphicon glyphicon-user">&nbsp;基本資料</i></a></li>
					</ul>
					<ul>
						<li><a
							href="<%=request.getContextPath()%>/front/realtor/realtor_psw.jsp"><i
								class="glyphicon glyphicon-pencil">&nbsp;修改密碼</i></a></li>
					</ul>
				</div>
				<div class="navigation">
					<h3>瀏覽預約紀錄</h3>
					<ul>
						<li><a href="#"><i class="glyphicon glyphicon-list-alt">&nbsp;追蹤清單</i></a></li>
					</ul>
					<ul>
						<li><a href="#"><i
								class="glyphicon glyphicon-folder-open">&nbsp;歷史紀錄</i></a></li>
					</ul>
				</div>
				<div class="navigation">
					<h3>誰正在找房</h3>
					<ul>
						<li><a href="#"><i
								class="glyphicon glyphicon-question-sign">&nbsp;XXX</i></a></li>
					</ul>
					<ul>
						<li><a href="#"><i
								class="glyphicon glyphicon-question-sign">&nbsp;XXX</i></a></li>
					</ul>
				</div>
				<div class="navigation">
					<h3>管理行事曆</h3>
					<ul>
						<li><a href="#"><i class="glyphicon glyphicon-calendar">&nbsp;行事曆</i></a></li>
					</ul>
				</div>
			</div>
			<!-- 左邊bar結束 ========================================================-->

	<!-- 房仲左邊功能列結束 ================================================================-->



</body>
</html>