<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>For House</title>
<link rel="shortcut icon" href="images/houselogo1.png" />
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
		<img class="row" src="images/fixed_bg.png">
	</div>



	<!-- navnar======================================================================================= -->
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
				<div class="col-xs-12 col-sm-2">
					<ul class="nav navbar-nav logina">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>
								註冊</a></li>
						<li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
								登入</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</div>



	<!-- 阿蓋的搜尋房仲 ============================================================================================-->
	<!-- 麵包屑 -->
	<div class="container container_size">
		<div class="col-12 col-md-9 col-xl-8"></div>
		<ol class="breadcrumb bread_size">
			<li><a href="#">首頁</a></li>
			<li class="active"><a href="#">找房仲</a></li>
		</ol>
		<div class="col-xs-12 col-sm-8"></div>
	</div>
	<!-- 麵包屑結束 -->

	<!--Search Bar-->
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1 search_size">
				<form>
					<div class="input-group">
						<input type="text" class="form-control" placeholder="請輸入關鍵字">
						<span class="input-group-btn"> <a href="#"
							class="btn btn-info">搜尋</a>
						</span>
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>


	<!-- 搜尋按鈕===============================================================================================-->
	<!-- 之後可改成用ul-li沒有點點的方法創造清單鈕 -->
	<div class="container btn-block container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 btn_padding">
				<div class="row">
					<div class="btn-group">
						<button type="button"
							class="bigger btn btn-primary dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">地
							區</button>
						<div class="dropdown-menu">
							<li class="dropdown-header">北部地區</li> <a class="dropdown-item"
								href="#">台北市</a><br> <a class="dropdown-item" href="#">新北市</a><br>
							<a class="dropdown-item" href="#">桃園市</a><br> <a
								class="dropdown-item" href="#">中壢區</a><br>
							<li class="dropdown-header">中部地區</li> <a class="dropdown-item"
								href="#">中一市</a><br> <a class="dropdown-item" href="#">中二市</a><br>
							<a class="dropdown-item" href="#">中三市</a><br> <a
								class="dropdown-item" href="#">中四區</a><br>
						</div>
					</div>
					<div class="btn-group">
						<button type="button"
							class="bigger btn btn-primary dropdown-toggle"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">房仲公司</button>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">AA房仲公司</a><br> <a
								class="dropdown-item" href="#">BB房仲公司</a><br> <a
								class="dropdown-item" href="#">BB房仲公司</a><br>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>



	<!-- 共有幾位房仲 -->
	<div class="container container_size totatl_estate">
		<div class="row">
			<div class="col-xs-12 col-sm-12">
				<div class="vertical-horizontal">
					<a href="#">共有XXXXX位房仲</a>
				</div>
			</div>
		</div>
	</div>



	<!-- 搜尋房仲顯示的畫面================================================================================ -->
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-sm-offset-1 div_sm_12">
				<div class="col-xs-12 col-sm-3">
					<img src="https://api.fnkr.net/testimg/180x200/5555ff">
				</div>

				<div class="col-xs-12 col-sm-3">
					<ul class="list-unstyled info_estate">
						<li>房仲姓名: 很會賣</li>
						<li>房仲公司: 屹立不搖</li>
						<li>服務地區: 紅燈下</li>
					</ul>
				</div>

				<div class="col-xs-12 col-sm-3">
					<h2 class="intro_estate">簡介</h2>
					<p class="intro_content text_overflow">Lorem ipsum dolor sit
						amet, consectetur adipisicing elit. Nulla dolore alias ducimus
						magnam, repellendus nobis! Tempora, magni. Dignissimos, non,
						omnis?lorem40</p>
				</div>

				<div class="col-sm-3">
					<div class="wrapper">
						<div class="container-fluid">
							<div class="row">
								<div class="heart_size">
									<a class="heart_main" href="#"> <i class="fa fa-heart"
										aria-hidden="true">加入最愛</i>
									</a>
								</div>
							</div>
							<div class="row forward_estate">
								<button class="button" style="vertical-align: middle">
									<span class="forward_word">查看詳請</span>
								</button>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<br>

	<!-- 這個預設是放左邊，加了text-center才變中間 -->
	<div class="text-center">
		<ul class="pagination pagination-lg">
			<li><a href="#">&laquo;</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li class="active"><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">6</a></li>
			<li><a href="#">7</a></li>
			<li><a href="#">8</a></li>
			<li><a href="#">9</a></li>
			<li><a href="#">&raquo;</a></li>
		</ul>
	</div>
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