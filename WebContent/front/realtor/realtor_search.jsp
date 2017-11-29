<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>
<%@ page import="com.realestate.model.*"%>
<%@ page import="com.resrec.model.*"%>

<jsp:useBean id="realestateSvc" scope="page" class="com.realestate.model.RealEstateService" />
<jsp:useBean id="resrecSvc" scope="page" class="com.resrec.model.ResRecService" />
<jsp:useBean id="list" scope="request" type="java.util.List<RealtorVO>" />

<%
	List<RealEstateVO> estatelist = (List<RealEstateVO>) request.getAttribute("estatelist");
	pageContext.setAttribute("estatelist", estatelist);
	List<RealtorVO> list2 = (List<RealtorVO>) request.getAttribute("list2");
	pageContext.setAttribute("list2", list2);

	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	
%>

<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>For House</title>
<link rel="shortcut icon" href="<%=request.getContextPath()%>/images/houselogo1.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">

<!-- 必備Latest compiled and minified CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/front/realtor/css/bootstrap-select.min.css">
<!-- Latest compiled and minified CSS -->
<!-- 阿蓋的css -->
<!-- 多加的 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/front/realtor/css/realtor_cooper.css">
<!-- end阿蓋的css -->

<script src="https://code.jquery.com/jquery.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="js/main.js"></script>


<!-- realtor_cooperkai.js -->
<script src="https://use.fontawesome.com/add3377d0a.js"></script>
<script	src="<%=request.getContextPath()%>/front/realtor/js/realtor_cooper.js"></script>
<!-- realtor_cooperkai.js -->

<!-- 必備Latest compiled and minified JavaScript -->
<script	src="<%=request.getContextPath()%>/front/realtor/js/bootstrap-select.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<!-- 星星 -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/tools/ratestar/jquery.rateyo.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/tools/ratestar/jquery.rateyo.js"></script>

<style type="text/css">

/*專門給房仲簡介按鈕用*/
#btn {
	outline: none;
	display: block;
	width: 130px;
	height: 120px;
	background: url("<%=request.getContextPath()%>/images/realtorNO.png")
		no-repeat 0 0;
}

#btn:active {
	transform: translate(0px, 5px);
	webkit-transform: translate(0px, 5px);
	box-shadow: 0px 1px 0px 0px;
}

#btnMsg{
	outline: none;
	display: block;
	width: 30px;
	height: 30px;
	background: url("<%=request.getContextPath()%>/images/rtrMsg.png")
		no-repeat 0 0;
}

#btnMsg:active {
	transform: translate(0px, 5px);
	webkit-transform: translate(0px, 5px);
	box-shadow: 0px 1px 0px 0px;
}

.btnMsg{
	margin-top:5px;
}

.font_style{
	text-align:center;
}

#rtr_search{
	cursor: no-drop; 
	background-color:#F7F7EE;
}

.chatMsg,argue{
	cursor:pointer; 
}
</style>

<script type="text/javascript">
	//評分星星
	$(document).ready(function(){
		<c:forEach var="realtorVO" items="${list}" varStatus="s">		
	    $(".starDiv>div>.h${s.index}").rateYo({
	    	rating: ${resrecSvc.findStar(realtorVO.rtr_no)}, 
			numStars: 5,
			precision: 2,
			readOnly: true,
			starWidth: "30px",
			spacing: "3px",
			multiColor: {
				startColor: '#ffbf00',
				endColor: "#ffff00"
			}
		});
	    </c:forEach>
	});
</script>

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
	<!-- 阿蓋的搜尋房仲 ============================================================================================-->

	<!--Search Bar-->
	<div class="container" style="margin-top: 12em;">
		<div class="row">
			<div class="col-sm-1"></div>
			<form method="post"
				action="<%=request.getContextPath()%>/front/realtor/realtor.do">
				<div class="col-xs-6 form-group" style="padding: 0;">
					<input type="text" name="keyword" value="" class="form-control"
						placeholder="請輸入關鍵字">
				</div>
				<input type="submit" title="搜尋房仲" value="搜尋"
					style="height: 38.4px; width: 50px;"> <input type="hidden"
					name="action" value="findBykeyword">
			</form>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<br>


	<!-- 搜尋按鈕===============================================================================================-->
	<!-- 之後可改成用ul-li沒有點點的方法創造清單鈕 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/front/realtor/realtor.do"
				id="form1">
				<div class="form-group" style="margin: 0;">
					<label for="rtr_area" class="col-sm-2 control-label"
						style="padding: 0; width: 100px;">選擇地區:</label>
					<div class="col-sm-2">
						<select class="selectpicker show-tick form-control" size="1"
							name="RTR_AREA" id="rtr_area" style="padding-left: 0;">
							<option value="">搜尋服務地區</option>
							<c:forEach var="realtorVO" items="${list2}">
								<option value="${realtorVO.rtr_area }">${realtorVO.rtr_area}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group" style="margin: 0;">
					<label for="re_no" class="col-sm-2 control-label"
						style="padding: 0; width: 100px;">選擇服務公司:</label>
					<div class="col-sm-2">
						<select class="selectpicker show-tick form-control" name="RE_NO"
							id="re_no" style="padding-left: 0;">
							<option value="">搜尋服務公司</option>
							<c:forEach var="realestateVO" items="${estatelist}">
								<option value="${realestateVO.re_no}">${realestateVO.re_name}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<input type="hidden" name="action" value="listQueryB"> <input
					type="submit" value="送出" style="height: 34px;">
			</form>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<br>


	<!-- 搜尋房仲顯示的畫面================================================================================ -->
	<%@ include file="page_front_realtor/pagesearch.file"%>
	<!-- 共有幾位房仲 -->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="vertical-horizontal">
				<p>
					共有<font color=red><%=rowNumber%></font>位房仲
				</p>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<!-- 前往全房仲文章-->
	<div class="container">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="row forward_estate">
				<a href="<%=request.getContextPath()%>/front/realtor/allBlog.jsp">
					<button class="button"
						style="vertical-align: middle; margin-left: 0;" title="前往房仲文章分享">
						<span class="forward_word">房仲文章賞析</span>
					</button>
				</a>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	<c:forEach var="realtorVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" varStatus="s">
		<!-- 房仲簡介本體 -->
		<div class="container">
			<div class="row">
				<div class="col-sm-1"></div>
				<div class="panel panel-default col-sm-12  col-sm-8 starDiv">
					<div class="panel-heading form-group">
						<div class="col-sm-4">
							<h4>房仲簡介</h4>
						</div>
						<div class="col-sm-4">	
							<div class="form-group forward_estate">
								<button type="button" class="btn btnMsg" id="btnMsg">
									<label class="chatMsg" for="">
									<font size="3" color="green">&nbsp;&nbsp;&nbsp;&nbsp;與我聊天</font>
									</label>
								</button>
							</div>
						</div>
						
						<div class="col-sm-4">	
							<div class="form-group">
								<div class="heart_size">
									<a class="heart_main" href="#">
									<i class="glyphicon glyphicon-heart" aria-hidden="true">追蹤房仲</i>
									</a>
								</div>
							</div>
						</div>
						<div>
							<img
								src="<%=request.getContextPath()%>/tool/showimage.do?action=rtr_photo&rtr_no=${realtorVO.rtr_no}"
								alt="${realtorVO.rtr_name}個人照片" class="img-thumbnail"
								style="width: 100%;">
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-group">
							<label for="rtr_name"><font size="5" color="#4F4F4F">房仲名稱</font></label>
								<h5>
									<font class="font_style" size="5" color="#1874CD">${realtorVO.rtr_name}</font>
								</h5>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-group">
							<label for="post_date"><font size="5" color="#4F4F4F">房仲公司</font></label>
								<h5 class="">
									<font class="font_style" size="5" color="#1874CD">${realestateSvc.getOne(realtorVO.re_no).getRe_name()}</font>
								</h5>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="form-group">
							<label for="post_date"><font size="5" color="#4F4F4F">服務地區</font></label>
								<h5 class="">
									<font class="font_style" size="5" color="#1874CD">${realtorVO.rtr_area}</font>
								</h5>
						</div>
					</div>
					<c:if test="${memVO != null}">
						<div class="col-sm-3">
							<div class="form-group">
								<label class="argue" for=""><font size="5" color="#FF3030">檢舉</font></label>
								<button class="submit btn modal_jump" id="btn"></button>
							</div>
						</div>
					</c:if>
					<div class="col-sm-12 starDiv">
						<div class="form-group">
							<label for="post_date"><font size="5" color="#4F4F4F">綜合評分</font></label>
								<h5 class="h${s.index}"></h5>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label for="rtr_intro"><font size="5" color="#4F4F4F">簡介</font></label>
							<textarea class="form-control" id="rtr_search" rows="9" readonly name="rtr_intro">${realtorVO.getRtr_intro()}</textarea>
						</div>
						<div class="input-group" style="margin-bottom: 10px;">
							<span class="input-group-btn"> </span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-1"></div>
		<!-- 房仲簡介本體 -->

		<!-- <div class="container container_size">
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
					<div class="col-xs-12 col-sm-3">
						<img src="<%=request.getContextPath()%>/tool/showimage.do?action=rtr_photo&rtr_no=${realtorVO.rtr_no}"
							alt="${realtorVO.rtr_name}個人照片" style="width: 180px; height: 200px;">
					</div>

					<div class="col-xs-12 col-sm-3">
						<ul class="list-unstyled info_estate">
							<li>房仲姓名 ${realtorVO.rtr_name}</li>
							<li>房仲公司	${realestateSvc.getOne(realtorVO.re_no).getRe_name()}</li>
							<li>服務地區 ${realtorVO.rtr_area}</li>
						</ul>
					</div>

					<div class="col-xs-12 col-sm-3">
						<h2 class="intro_estate">簡介</h2>
						<p class="intro_content text_overflow">${realtorVO.rtr_intro}</p>
					</div>

					<div class="col-sm-3">
						<div class="wrapper">
							<div class="container-fluid">
								<div class="row">
									<div class="heart_size">
										<a class="heart_main" href="#"> 
											<i class="glyphicon glyphicon-heart" aria-hidden="true">加入最愛</i>
										</a>
									</div>
								</div>
								<div class="row forward_estate">
								<%-- <form method="post" action="<%=request.getContextPath()%>/front/article/article.do"> --%>
								<!-- <button class="button" style="vertical-align: middle"> -->
		<!-- <input type="hidden" name="action" value="getOne_For_Display"> -->
		<%-- <input type="hidden" name="rtr_no" value="${realtorVO.rtr_no}"> --%>
		<!-- <span class="forward_word">查看詳請</span> -->
		<!-- </button> -->
		<!-- </form>
								<a href="<%=request.getContextPath()%>/front/realtor/allBlog.jsp">
									<button class="button" style="vertical-align: middle">
										<span class="forward_word">查看詳請</span>
									</button>
								</a>
								</div>
								<div class="row forward_estate">
									<button class="button" title="聊天"
										style="vertical-align: middle; background-color: red;">
										<span class="forward_word">聊天or伴遊</span>
									</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br> -->
	</c:forEach>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<%@include file="page_front_realtor/pageByCompositeQuery2.file"%>
			</div>
		</div>
	</div>

	<!-- 回到最上面    -->
	<div id="gotop"><img alt="回到最上面" src="<%=request.getContextPath()%>/images/top.png"></div>
	<!-- end阿蓋的搜尋房仲 =========================================================================================-->

	<script>
		//房仲文章回到上面用
		$(window).scroll(function() {
			if ($(this).scrollTop() > 300) {
				$('#gotop').fadeIn("fast");
			} else {
				$('#gotop').stop().fadeOut("fast");
			}
		});
		$("#gotop").click(function() {
			jQuery("html,body").animate({
				scrollTop : 0
			}, 1000);
		});
	</script>


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