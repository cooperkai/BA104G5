<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="com.mem.model.*"%>
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="shortcut icon" href="images/houselogo1.png" />
<title>For House</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
body {
	font-family: Arial, Verdana, Helvetica, "LiHei Pro Medium", 微軟正黑體,
		sans-serif;
}

/* 會員中心  開始  */
.memtitle {
	margin-top: 70px;
}

.member_center {
	color: #00ADEE;
}

.areaOutter {
	margin-top: 40px;
}

.areaInner {
	margin-top: 20px;
}
/* 會員中心  結束  */

/* 更改密碼的form */
.psw_form {
	margin: 20px;
}

h3.panel-title {
	font-size: 24px;
}

.savebutton {
	width: 630px;
	margin-left: 15px;
	font-size: 18px;
}

/* d */
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>
<body>

	<!-- 背景圖 -->
	<div class="container-fluid backgroundpng">
		<img class="row" src="images/fixed_bg.png">
	</div>

	<!-- 上方的 header (navbar) -->
	<nav class="navbar navbar-fixed-top">
		<jsp:include page="/front/frontPage/navbar.jsp" />
	</nav>


	<div class="col-xs-12 memtitle">
		<h2 class="text-center member_center">會員中心</h2>
	</div>

	<!-- 下方大區塊 start -->
	<div class="container areaOutter">
		<div class="row areaOutter">

			<!-- include 左側選單區塊  開始-->
			<jsp:include page="leftpanel.jsp" />
			<!-- include 左側選單區塊  結束-->

			<!-- 右側頁面區塊  開始 -->
			<div class="col-xs-12 col-sm-8 areaInner">
				<div class="container">
					<div class="col-xs-5 col-sm-8">
						<div class="tab-content">



							<!-- 更換的程式碼放下面 -->
							<c:if test="${not empty pswErrors}">
								<font style="color: red">請修正以下錯誤:</font>
								<ul>
									<c:forEach var="message" items="${pswErrors}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>
							<div class="panel panel-primary">
								<div class="panel-heading">
									<h3 class="panel-title text-center">更改密碼</h3>
								</div>
								<form class="form-horizontal" action="memMgmt.do" method="post">
									<input type="hidden" name="action" value="change_psw">
									<div class="form-group psw_form">
										<label for="psw_ori" class="col-sm-2 control-label">現在的密碼</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="psw_ori"
												name="psw_ori" placeholder="現在的密碼">
										</div>
									</div>
									<div class="form-group psw_form">
										<label for="psw_new1" class="col-sm-2 control-label">新的密碼</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="psw_new1"
												name="psw_new1" placeholder="新的密碼">
										</div>
									</div>
									<div class="form-group psw_form">
										<label for="psw_new2" class="col-sm-2 control-label">確認密碼</label>
										<div class="col-sm-9">
											<input type="password" class="form-control" id="psw_new2"
												name="psw_new2" placeholder="確認密碼">
										</div>
									</div>
									<div class="checkbox psw_form">
										<button type="submit" class="btn btn-warning savebutton">確認</button>
									</div>
									<div class="checkbox psw_form"></div>
								</form>
							</div>
							<!-- 更換的程式碼放上面 -->

							<table>
								<tr>
									<th>優惠卷編號</th>
									<th>優惠期限</th>
									<th>優惠內容</th>
									<th>優惠折扣</th>
									<th>使用狀態</th>
								</tr>
	<jsp:useBean id="memSvc" scope="page"
	class="com.mem.model.MemService" />
								<c:forEach var="couponVO" items="${memSvc.CPByMemno}">
									<tr align='center' valign='middle'>
										<td>${couponVO.cp_no}</td>
										<td><fmt:formatDate value="${couponVO.cp_from}" pattern="MM-dd" />~ <br>
											<fmt:formatDate value="${couponVO.cp_to}" pattern="MM-dd" /></td>
										<td>${couponVO.content}</td>
										<td>${couponVO.discount}</td>
										<td>${couponVO.state}</td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/emp/emp.do"
												style="margin-bottom: 0px;">
												<input type="submit" value="修改"> <input
													type="hidden" name="empno" value="${empVO.empno}">
												<input type="hidden" name="requestURL"
													value="<%=request.getServletPath()%>">
												<!--送出本網頁的路徑給Controller-->
												<!-- 目前尚未用到  -->
												<input type="hidden" name="action" value="getOne_For_Update">
											</FORM>
										</td>
										<td>
											<FORM METHOD="post"
												ACTION="<%=request.getContextPath()%>/emp/emp.do"
												style="margin-bottom: 0px;">
												<input type="submit" value="刪除"> <input
													type="hidden" name="empno" value="${empVO.empno}">
												<input type="hidden" name="requestURL"
													value="<%=request.getServletPath()%>">
												<!--送出本網頁的路徑給Controller-->
												<input type="hidden" name="action" value="delete">
											</FORM>
										</td>
									</tr>
								</c:forEach>
							</table>


						</div>
					</div>
				</div>
			</div>
			<!-- 右側頁面區塊結束 -->


		</div>
	</div>
	<!-- 下方大區塊 end -->

</body>

</html>