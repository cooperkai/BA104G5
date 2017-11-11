<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.realtor.model.*"%>


<%
	RealtorVO realtorVO = (RealtorVO) session.getAttribute("realtorVO");
	if (realtorVO == null) { // 如為 null, 代表此user未登入過 , 才做以下工作
		session.setAttribute("location", request.getRequestURI()); //*工作1 : 同時記下目前位置 , 以便於login.jsp登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java)
		response.sendRedirect("realtor_login.jsp"); //*工作2 : 請該user去登入網頁(login.jsp) , 進行登入
		return;
	}
	if (request.getAttribute("dataErrors") != null) {
		String phoneErrShow = (String) request.getAttribute("phoneErr");
	}
%>


<!-- A Design by W3layouts Author: W3layout Author URL: http://w3layouts.com License: Creative Commons Attribution 3.0 Unported License URL: http://creativecommons.org/licenses/by/3.0/ -->
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />

<!-- bootstrap-CSS -->
<link rel="stylesheet" href="css/bootstrap-select.css">
<!-- bootstrap-select-CSS -->

<!-- Fontawesome-CSS -->
<link href="css/font-awesome.css" rel="stylesheet" type="text/css"
	media="all" />
<!--theme-style-->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<!--//theme-style-->

<!-- 基本css -->
<link rel="stylesheet" type="text/css"
	href="css/easy-responsive-tabs.css " />

<!-- 基本css -->
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript" src="js/main.js"></script>

<!-- cooperkai.css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front/realtor/css/realtor_cooper.css">
<!-- cooperkai.css -->

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script type='text/javascript' src='js/jquery-2.2.3.min.js'></script>
<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
<script src="js/easyResponsiveTabs.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/front/realtor/js/realtor_cooper.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/front/realtor/js/main.js"></script>

<title>房仲會員中心</title>
</head>

<body>
	<div class="container-fluid backgroundpng">
		<img class="row" src="images/fixed_bg.png">
	</div>
	<!-- navbar -->
	<div class="main">
		<nav class="navbar navbar-fixed-top">
			<div class="container">
				<div class="navbar-header col-xs-12 col-sm-2">
					<a class="navbar-brand " href="#"><img class="navshadow"
						src="images/For House logo.png" width="120px"></a>
				</div>
				<div class="col-xs-12 col-sm-8 ">
					<ul class="nav navbar-nav activebar">
						<li><a href="#" data-toggle="tooltipNews"
							data-placement="bottom">最新消息</a></li>
						<li><a href="#">常見問題</a></li>
						<li><a href="#">看房去</a></li>
						<li><a href="#">找房仲</a></li>
						<li><a href="#">安家商城</a></li>
						<li><a href="#">加入我們</a></li>
					</ul>
				</div>
				<div class="col-sm-12 col-sm-2" id="cooper_log_right_top">
					<ul class="nav navbar-nav navbar-right">
						<li><a
							href="<%=request.getContextPath()%>/front/realtor/realtor_center.jsp"><span
								class="glyphicon glyphicon-user"></span> <c:if
									test="${realtorVO != null}">
									<%=realtorVO.getRtr_name()%>
								</c:if> <c:if test="${realtorVO == null}">
									註冊
								</c:if> </a></li>
						<li><a
							href="<%=request.getContextPath()%>/front/realtor/realtor_login.jsp"><span
								class="glyphicon glyphicon-log-in"></span> <c:if
									test="${realtorVO != null}">
									登出
								</c:if> <c:if test="${realtorVO == null}">
									登入
								</c:if> </a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<!-- endnavbar -->
	<!--左邊功能列表-->
	<div class="categories-section main-grid-border" id="mobilew3layouts">
		<div class="col-sm-12">
			<h2 class="text-center member_center">房仲中心</h2>
		</div>
		<div class="container"
			style="border: 1px solid green; background-color: grey;"
			id="cooper_realtor_style">
			<div class="category-list">
				<div id="parentVerticalTab">
					<div class="agileits-tab_nav"
						style="margin-bottom: 20px; width: 20%; background-color: #f26649;">
						<ul class="resp-tabs-list hor_1">
							<div class="panel-group" id="accordion2" role="tablist"
								aria-multiselectable="true">

								<!-- 區塊1 -->
								<div class="panel panel-default cooper_panel"
									style="margin-top: 20px;">
									<li><a href="#hhh" data-parent="#accordion2"
										data-toggle="collapse" role="button" class="collapsed"
										aria-expanded="false" aria-controls="ccc"><i
											class="icon fa fa-pencil-square-o" aria-hidden="true"></i>個人資料管理</a></li>
									<div id="hhh" class="panel-collapse collapse" role="tabpanel"
										aria-labelledby="panel3">
										<div class="list-group tabs-menu">
											<a href="#realtor_info" class="list-group-item text-center"
												data-toggle="tab">
												<div id="basedata">基本資料</div>
											</a> <a href="#realtor_info2" class="list-group-item text-center"
												data-toggle="tab">
												<div id="changepsw">修改密碼</div>
											</a>
										</div>
									</div>
								</div>

								<!-- 區塊2 -->
								<div class="panel panel-default cooper_panel">
									<li><a href="#ggg" data-parent="#accordion2"
										data-toggle="collapse" role="button" class="collapsed"
										aria-expanded="false" aria-controls="ccc"><i
											class="icon fa fa-clipboard" aria-hidden="true"></i>瀏覽預約紀錄</a></li>
									<div id="ggg" class="panel-collapse collapse" role="tabpanel"
										aria-labelledby="panel3">
										<div class="list-group">
											<a href="#tab10" class="list-group-item text-center"
												data-toggle="tab">
												<div id="collect">追蹤清單</div>
											</a> <a href="#tab11" class="list-group-item text-center"
												data-toggle="tab">房仲xx</a>
										</div>
									</div>
								</div>

								<!-- 區塊3 -->
								<div class="panel panel-default cooper_panel">
									<li><a href="#fff" data-parent="#accordion2"
										data-toggle="collapse" role="button" class="collapsed"
										aria-expanded="false" aria-controls="ccc"><i
											class="icon fa fa-home" aria-hidden="true"></i>誰正在找房</a></li>
									<div id="fff" class="panel-collapse collapse" role="tabpanel"
										aria-labelledby="panel3">
										<div class="list-group">
											<a href="#tabxxx" class="list-group-item text-center"
												data-toggle="tab">最新預約</a> <a href="#tabxxx"
												class="list-group-item text-center" data-toggle="tab">歷史預約</a>
										</div>
									</div>
								</div>

								<!-- 區塊4 -->
								<div class="panel panel-default cooper_panel">
									<li><a href="#aaa" data-parent="#accordion2"
										data-toggle="collapse" role="button" class="collapsed"
										aria-expanded="false" aria-controls="ccc"><i
											class="icon fa fa-calendar" aria-hidden="true"></i>管理行事曆</a></li>
									<div id="aaa" class="panel-collapse collapse" role="tabpanel"
										aria-labelledby="panel3">
										<div class="list-group">
											<a href="#rtr_cal" class="list-group-item text-center"
												data-toggle="tab">ssssssssssssssssss</a>
										</div>
									</div>
								</div>

								<!-- 區塊5 -->
								<div class="panel panel-default cooper_panel">
									<li><a href="#bbb" data-parent="#accordion2"
										data-toggle="collapse" role="button" class="collapsed"
										aria-expanded="false" aria-controls="ccc"><i
											class="icon fa  fa-group (alias)" aria-hidden="true"></i>管理粉絲頁</a></li>
									<div id="bbb" class="panel-collapse collapse" role="tabpanel"
										aria-labelledby="panel3">
										<div class="list-group">
											<a href="#tabxxx" class="list-group-item text-center"
												data-toggle="tab">??????</a>
										</div>
									</div>
								</div>

								<!-- 區塊6 -->
								<div class="panel panel-default cooper_panel">
									<li><a href="#ccc" data-parent="#accordion2"
										data-toggle="collapse" role="button" class="collapsed"
										aria-expanded="false" aria-controls="ccc"><i
											class="icon fa" aria-hidden="true"><img
												src="images/realtor_qr.PNG"
												style="width: 22px; height: 20px;"></i>瀏覽QR Code</a></li>
									<div id="ccc" class="panel-collapse collapse" role="tabpanel"
										aria-labelledby="panel3">
										<div class="list-group">
											<a href="#tabxxx" class="list-group-item text-center"
												data-toggle="tab">最新QR Code</a> <a href="#tabxxx"
												class="list-group-item text-center" data-toggle="tab">歷史QR
												Code</a>
										</div>
									</div>
								</div>
							</div>
						</ul>
					</div>


					<!-- 房仲個人資訊 -->
					<div class="resp-tabs-container hor_1" id="right_realtor">
						<div class="tabs-box">
							<div class="tab-grids">
								<div id="realtor_info" class="tab-grid">
									<div class="login-form">
										<div class="container-fluid">
											<div class="row">
												<form class="form-horizontal" role="form">
													<div class="form-group">
														<div class="col-sm-3 col-sm-push-9">
															<img src="images/realtor_pencil.png" class="w3ls-mobile"
																alt="基本資料修改" data-pin-nopin="true"
																style="width: 128px; height: 128px;">
														</div>
														<div class="col-sm-9 col-sm-pull-3">
															<img
																src="<%=request.getContextPath()%>/tool/showimage.do?action=rtr_photo&rtr_no=${realtorVO.rtr_no}"
																class="w3ls-mobile" alt="基本資料修改" data-pin-nopin="true"
																style="width: 100%; height: 291.2px;">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="rtr_name">姓名</label>
														<div class="col-sm-10">
															<p class="form-control-static"><%=realtorVO.getRtr_name()%></p>
														</div>
													</div>
													<div class="form-group">
														<label for="inputPassword3" class="col-sm-2 control-label">e-mail帳號</label>
														<div class="col-sm-9">
															<p class="form-control-static"><%=realtorVO.getRtr_id()%></p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="rtr_idno">身分證</label>
														<div class="col-sm-10">
															<p class="form-control-static"><%=realtorVO.getRtr_idno()%></p>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="rtr_area">服務地區</label>
														<div class="col-sm-10">
															<select class="selectpicker show-tick" name="rtr_area"
																style="width: 100%;">
																<option name="default_item" value="">服務地區</option>
																<option value="${realtorVO.rtr_area}"
																	${(realtorVo.rtr_area == null)? 'selected' : ''}>${realtorVO.rtr_area}</option>
															</select>
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="rtr_intro">簡介</label>
														<div class="col-sm-10">
															<%=realtorVO.getRtr_intro()%>
															<%-- 															<textarea class="form-control" row="10"><%=realtorVO.getRtr_intro()%></textarea> --%>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-offset-2 col-sm-10">
															<a href='#realtor_jump' data-toggle="modal" class="btn">
																修改資料 </a>
															<!-- 															<button type="submit" class="btn btn-info">確認修改</button> -->
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div id="realtor_info2" class="tab-grid">
									<div class="login-form">
										<div class="container-fluid">
											<div class="row">
												<form class="form-horizontal" role="form">
													<div class="form-group">
														<label class="control-label col-sm-2" for="email">請輸入舊帳號</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" name="rtr_id"
																placeholder="Enter email">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="email">請輸入新帳號</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" name="rtr_id"
																placeholder="Enter email">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="email">確認新帳號</label>
														<div class="col-sm-10">
															<input type="email" class="form-control" name="rtr_id"
																placeholder="Enter email">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="pwd">請輸入舊密碼</label>
														<div class="col-sm-10">
															<input type="password" class="form-control"
																name="rtr_psw" placeholder="Enter password">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="pwd">請輸入新密碼</label>
														<div class="col-sm-10">
															<input type="password" class="form-control"
																name="rtr_psw" placeholder="Enter password">
														</div>
													</div>
													<div class="form-group">
														<label class="control-label col-sm-2" for="pwd">確認新密碼</label>
														<div class="col-sm-10">
															<input type="password" class="form-control"
																name="rtr_psw" placeholder="Enter password">
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-offset-2 col-sm-10">
															<div class="checkbox">
																<label> <input type="checkbox"> Remember
																	me
																</label>
															</div>
														</div>
													</div>
													<div class="form-group">
														<div class="col-sm-offset-2 col-sm-10">
															<button type="submit" class="btn btn-default">Submit</button>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<div class="clearfix"></div>
							</div>

						</div>
						<!-- /tab1 -->
					</div>
					<!-- 右邊欄結束 -->


					<!-- rtr_cal -->


<!-- 					<div class="col-xs-12 col-sm-8 areaInner"> -->
<!-- 						<div class="container"> -->
<!-- 							<div class="col-xs-5 col-sm-8"> -->
<!-- 								標籤面板：內容區 -->
<!-- 								<div class="tab-content"> -->
<%-- 									 <jsp:include page="/resrec/calendar.jsp" /> --%>

<!-- 									<div class="tab-pane" id="rtr_cal"></div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->





				</div>
			</div>
		</div>
	</div>
	<!--end左邊功能列表-->

	<!--footer-->
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
	<!--//footer-->



	<div class="modal fade" id="realtor_jump">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">修改個人資料</h4>
	                </div>
	                <div class="modal-body">
	                    <form role="form" METHOD="post" ACTION="/front/realtor.do" enctype="multipart/form-data" name="house">
	                        呼叫News_Type table
	                        <div class="form-group">
	                            <label for="rtr_id">帳號</label>
	                            <h4><%=realtorVO.getRtr_id()%></h4>
	                        </div>
	                        <div class="form-group">
	                            <label for="rtr_idno">身分證</label>
	                            <h4><%=realtorVO.getRtr_idno()%></h4>
	                        </div>
	                        <div class="form-group">
	                            <label for="news_name">姓名</label>
	                            <input type="text" class="form-control" name="realtor_name" value="<%=(realtorVO == null) ? " 修改姓名 " : realtorVO.getRtr_name()%>" />
	                        </div>
	                        <div class="form-group dropdown">
	                            <label for="news_content">修改新聞狀態</label>
	                            <select name="news_state" class="form-control btn_cooper" id="sel1">
	                                <option name="default_item2" value="">請選擇</option>
<%-- 	                                <option class="onitem" value="公告中" ${(realtorVO.news_state=='公告中' )? 'selected': ''}>公告中</option> --%>
<%-- 	                                <option class="offitem" value="已撤銷" ${(newsVO.news_state=='已撤銷' )? 'selected': ''}>已撤銷</option> --%>
	                            </select>
	                        </div>
	                        <div class="form-group">
	                            <label for="rtr_intro">簡介</label>
	                            <textarea rows="10" class="form-control" name="rtr_intro" value="<%=(realtorVO == null) ? " 修改簡介 " : realtorVO.getRtr_intro()%>"></textarea>
	                        </div>
	                        <div class="form-group container div0">
	                            <div class="col-sm-3" >
	                                <label for="rtr_photo">修改個人照片</label>
	                                <input type="file" name="rtr_photo" onchange="readURL(this);">
	                            </div>
	                            <div class="col-sm-9">
	                                <img id="imgpreview" alt="preview image" />
	                            </div>
	                        </div>
	                        <div class="modal-footer">
	                            <input type="hidden" name="action" value="insert">
	                            <button type="submit" class="btn" value="送出修改">送出修改</button>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	    </div>





</body>

</html>