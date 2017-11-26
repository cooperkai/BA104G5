<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>
<%@ page import="com.newstype.model.*"%>

<%-- 採用 EL 的寫法取值 --%>

<%
	NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
	NewsService newsSvc = new NewsService();
	
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
	
	List<NewsVO> listTime = newsSvc.getAllByTime();
	pageContext.setAttribute("listTime", listTime);

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

	<!-- 顯示的畫面================================================================================ -->
	<div class="container" style="margin-top: 12em;">
		<div class="row">
			<div class="col-sm-1"></div>
				<%@include file="page_front_news/pageNewsFront.file"%>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<br>

	<c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<div class="container">
			<div class="row">
				<div class=col-sm-3>
					<div class="panel panel-primary">
						<div class="panel-heading">最新發佈</div>
							<c:forEach var="newsVO2" items="${listTime}" varStatus="s">
							<div class="panel-body">
								<a href="#realtor_jump${s.index}" data-toggle="modal">${newsVO2.news_title} - ${newsVO2.news_date}</a>
							</div>
							<div class="modal fade" id="realtor_jump${s.index}">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-hidden="true">&times;</button>
											<h4 class="modal-title">系統公告</h4>
										</div>
										<div class="form-group">
											<img src="<%=request.getContextPath()%>/tool/showimage.do?action=news_photo&news_no=${newsVO2.news_no}" class="img-thumbnail" style="width: 80%;">
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label for="ann_title">新聞標題</label>
												<h4>${newsVO2.news_title}</h4>
											</div>
											<div class="form-group">
												<label for="ann_content">新聞內容</label>
												<h4>${newsVO2.news_content}</h4>
											</div>
											<div class="form-group panel-footer">
												<label for="post_date">新聞發布時間 - ${newsVO.news_date}</label>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn" value="確認"
													data-dismiss="modal">確認</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="panel panel-default col-sm-8">
					<div class="panel-heading form-group">
						<h4>房市新聞</h4>
					</div>
					<div class="form-group">
						<img src="<%=request.getContextPath()%>/tool/showimage.do?action=news_photo&news_no=${newsVO.news_no}" class="img-thumbnail" style="width: 80%;">
					</div>
					<div class="form-group">
						<label for="rtr_name">新聞標題</label>
						<div>
							<h5>${newsVO.news_title}</h5>
						</div>
					</div>
					<div class="form-group">
						<label for="post_date">新聞內容</label>
						<div>
							<h5 class="">${newsVO.news_content}</h5>
						</div>
					</div>
					<div class="form-group panel-footer">
						<label for="post_date">新聞發布時間 - ${newsVO.news_date}</label>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<div class="nav-links mar-top-md">
	<%@include file="page_front_news/pageNewsFront2.file"%>
	</div>




	<!-- 回到最上面    -->
	<div id="gotop">˄</div>
	<!-- end阿蓋的搜尋房仲 =========================================================================================-->

	<!-- footer======================================================================================= -->
	<footer class="container-fluid">
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

</body>
</html>