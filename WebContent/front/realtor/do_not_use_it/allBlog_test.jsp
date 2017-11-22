<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>
<%@ page import="com.article.model.*"%>

<jsp:useBean id="articleSvc" scope="page"
	class="com.article.model.ArticleService" />
<jsp:useBean id="realtorSvc" scope="page"
	class="com.realtor.model.RealtorService" />

<%
	List<ArticleVO> artTime = articleSvc.getAllByTime();
	pageContext.setAttribute("artTime", artTime);

	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>For House</title>
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/houselogo1.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">

<!-- 阿蓋的css -->
<!-- 多加的 -->
<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css'>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front/realtor/css/realtor_cooper.css">
<!-- end阿蓋的css -->

<script src="https://code.jquery.com/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>


<!-- realtor_cooperkai.js -->
<script
	src="<%=request.getContextPath()%>/front/realtor/js/realtor_cooper.js"></script>
<script src="https://use.fontawesome.com/add3377d0a.js"></script>
<!-- realtor_cooperkai.js -->


</head>
<body>



	<!-- 背景圖================================================================================= -->
	<div class="container-fluid backgroundpng">
		<img class="row"
			src="<%=request.getContextPath()%>/images/fixed_bg.png">
	</div>

	<nav class="navbar navbar-fixed-top">
		<jsp:include page="/front/frontPage/navbar.jsp" />
	</nav>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<div class="container">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<%@ include file="pageart.file"%>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-sm-3">
				<div class="list-group">
					<p class="list-group-item active">
						<span class="badge"></span>文章管理
					</p>
					<a href="#" class="list-group-item"><span class="badge">10</span>最新文章瀏覽</a>
					<a href="#" class="list-group-item"><span class="badge">10</span>我的文章</a>
					<a href="#" class="list-group-item"><span class="badge">10</span>先留著</a>
				</div>
			</div>
			<div class="panel panel-default col-sm-8">
				<c:forEach var="articleVO" items="${artTime}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">

					<div class="panel panel-default col-sm-6 col-sm-offset-3">
						<div class="panel-heading form-group">
							<h4>文章</h4>
							<h4 style="float: right;">
								<a
									href="<%=request.getContextPath()%>/front/realtor/do_not_use_it/listAllBlog.jsp">回房仲文章列表</a>
							</h4>
						</div>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front/article/article.do"
							name="form1">
							<div class="form-group">
								<label for="rtr_name">房仲名稱</label>
								<div>
									<h5>${realtorSvc.getOne(articleVO.rtr_no).getRtr_name()}</h5>
									<img
										src="<%=request.getContextPath()%>/tool/showimage.do?action=rtr_photo&rtr_no=${realtorSvc.getOne(articleVO.rtr_no).getRtr_no()}"
										style="width: 80px; height: 80px;">
								</div>
							</div>
							<div class="form-group">
								<label for="article_body">文章內容</label>
								<textarea class="form-control" readonly
									style="cursor: no-drop; background-color: white;"
									name="article_body">${articleVO.article_body}</textarea>
							</div>
							<div class="form-group">
								<label for="post_date">發佈日期</label>
								<div>
									<h5 class="">${articleVO.post_date}</h5>
								</div>
							</div>

							<div class="input-group">
								<textarea class="form-control" name=""></textarea>
								<span class="input-group-btn">
									<button class="btn btn-primary" type="submit"
										style="padding: 16px;">留言</button> <input type="hidden"
									name="action" value="insert"> <input type="hidden"
									name="post_date" value="">
								</span>
							</div>
						</FORM>
					</div>

				</c:forEach>
			</div>
			<div class="container">
				<div class="row">
					<div class="col-sm-6 col-sm-offset-2">
						<%@ include file="pageart2.file"%>
					</div>
				</div>
			</div>

			<!-- 右邊房仲文章資料結束 =====================================-->
		</div>
	</div>

	<!-- footer -->
	<footer class="container-fluid" id="cooper_footer">
		<div class="container text-center">
			<div class="col-xs-12 col-sm-2">
				<a href="#">HOME</a>
			</div>
			<div class="col-xs-12 col-sm-2">
				<a href="#">OUR TEAM</a>
			</div>
			<div class="col-xs-12 col-sm-2">
				<a href="#">COMMUNITIES</a>
			</div>
			<div class="col-xs-12 col-sm-2">
				<a href="#">COMMUNITIES</a>
			</div>
			<div class="col-xs-12 col-sm-2">
				<a href="#">COMMUNITIES</a>
			</div>
			<div class="col-xs-12 col-sm-2">
				<a href="#">CONTACT US</a>
			</div>
		</div>
		<div class="copyri text-center">
			<p>
				<small>Copyright © 2017 For House</small>
			</p>
		</div>
	</footer>
	<!-- footer -->
</body>
</html>