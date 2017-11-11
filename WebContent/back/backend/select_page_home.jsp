<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

<!-- ��CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" />
<!-- ��CDN -->

<!-- ��ݭ����D�n_css&photo -->
<link rel="shortcut icon"
	href="<%=request.getContextPath()%>/images/houselogo1.png" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/back/css/main.css">
<!-- ��ݭ����D�n_css&photo -->

<!-- cooperkai_css -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/css/backend_cooperkai.css" />
<!-- cooperkai_css -->

<title>��ݭ���</title>
</head>
<body>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>


	<!-- <div class=""> -->
	<nav class="navbar navbar-fixed-top main">
	<div class="container-fluid">
		<div class="navbar-header col-xs-12 col-sm-3">
			<a class="navbar-brand " href="#"><img class="navshadow"
				src="<%=request.getContextPath()%>/images/For House logo.png"
				width="120px"></a>
		</div>
		<div class="col-xs-12 col-sm-8 navbrand">
			<h1>
				<i>I don't know how , but I know HOUSE.</i>
			</h1>
		</div>
		<div class="col-xs-12 col-sm-1">
			<ul class="nav navbar-nav logina">
				<li><a href="#"><span class="">Yen Kuei �A�n</span> </a></li>
			</ul>
		</div>
	</div>
	</nav>
	<!-- </div> -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-sm-2 sidebar">
				<div class="col-xs-12 col-sm-4">
					<div class="headpic row">
						<img src="<%=request.getContextPath()%>/images/Home-Sofa-2.jpg">
					</div>
				</div>
				<div class="col-xs-12 col-sm-8 text-center headbrand">
					<h4>Welcome.</h4>
					<h4>
						<b>Yen Kuei</b>
					</h4>
				</div>
				<div class="panel-group" id="accordion2" role="tablist"
					aria-multiselectable="true">
					<!-- �϶�2 -->
					<div class="panel panel-primary siderbarbox">
						<div class="panel-heading paneltitle row" role="tab" id="panel2">
							<h4 class="panel-title">
								<span class="titletext"> <b>�޲z���u</b>
								</span> <a class="titlebrand collapsed linka" href="#aaa"
									data-parent="#accordion2" data-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="aaa"> <i
									class="box-left glyphicon glyphicon-chevron-down"></i>
								</a>
							</h4>
						</div>
						<div id="aaa" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body panelbody">�޲z�b��</div>
							<div class="panel-body panelbody">�޲z�v��</div>
						</div>
						<!--  <div class="panel panel-primary"> -->
						<div class="panel-heading paneltitle row" role="tab" id="panel2">
							<h4 class="panel-title">
								<span class="titletext"><b>�f���v��</b></span> <a
									class="titlebrand collapsed linka" href="#bbb"
									data-parent="#accordion2" data-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="bbb"> <span
									class="box-left glyphicon glyphicon-chevron-down"></span></a>
							</h4>
						</div>
						<div id="bbb" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body panelbody">�f�֩Х���U</div>
							<div class="panel-body panelbody">�f�ּt�ӵ��U</div>
						</div>
						<!-- </div> -->
						<!-- �϶�3 -->
						<!-- <div class="panel panel-primary"> -->
						<div class="panel-heading paneltitle row" role="tab" id="panel2">
							<h4 class="panel-title">
								<span class="titletext"><b>���@�Ыθ��</b></span> <a
									class="titlebrand collapsed linka" href="#ccc"
									data-parent="#accordion2" data-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="ccc"> <span
									class="box-left glyphicon glyphicon-chevron-down"></span></a>
							</h4>
						</div>
						<div id="ccc" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body panelbody">�˵��Ыθ��</div>
						</div>
						<!-- </div> -->
						<!-- <div class="panel panel-primary"> -->
						<div class="panel-heading paneltitle row" role="tab" id="panel2">
							<h4 class="panel-title">
								<span class="titletext"><b>�޲z���|</b></span> <a
									class="titlebrand collapsed linka" href="#ddd"
									data-parent="#accordion2" data-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="ddd"> <span
									class="box-left glyphicon glyphicon-chevron-down"></span></a>
							</h4>
						</div>
						<div id="ddd" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body panelbody">�f�����|�Х�</div>
							<div class="panel-body panelbody">�f�����|�t��</div>
						</div>
						<!-- </div> -->
						<!-- <div class="panel panel-primary"> -->
						<div class="panel-heading paneltitle row" role="tab" id="panel2">
							<h4 class="panel-title">
								<span class="titletext"><b>�޲z�s�D</b></span> <a
									class="titlebrand collapsed linka" href="#eee"
									data-parent="#accordion2" data-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="eee"> <span
									class="box-left glyphicon glyphicon-chevron-down"></span></a>
							</h4>
						</div>
						<div id="eee" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body panelbody house_table">
								<a href='<%=request.getContextPath()%>/back/news/listAllNews.jsp'
									class='cooper_ann_href'>�޲z�Х��̷s����</a>
							</div>
							<div class="panel-body panelbody ann_table">
								<a href='<%=request.getContextPath()%>/back/ann/listAllAnn.jsp' class='cooper_ann_href'>�޲z�t�Τ��i</a>
							</div>
							<div class="panel-body panelbody promo_table">�޲z�P�P��T</div>
						</div>
						<!-- </div> -->
						<!-- <div class="panel panel-primary"> -->
						<div class="panel-heading paneltitle row" role="tab" id="panel2">
							<h4 class="panel-title">
								<span class="titletext"><b>�޲z�s�i</b></span> <a
									class="titlebrand collapsed linka" href="#fff"
									data-parent="#accordion2" data-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="fff"> <span
									class="box-left glyphicon glyphicon-chevron-down"></span></a>
							</h4>
						</div>
						<div id="fff" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body panelbody">�f�ּs�i�ӽ�</div>
							<div class="panel-body panelbody">�Z�n�s�i</div>
						</div>
						<div class="panel-heading paneltitle row" role="tab" id="panel2">
							<h4 class="panel-title">
								<span class="titletext"><b>�޲z�`�����D</b></span> <a
									class="titlebrand collapsed linka" href="#ggg"
									data-parent="#accordion2" data-toggle="collapse" role="button"
									aria-expanded="false" aria-controls="ggg"> <span
									class="box-left glyphicon glyphicon-chevron-down"></span></a>
							</h4>
						</div>
						<div id="ggg" class="panel-collapse collapse" role="tabpanel"
							aria-labelledby="panel2">
							<div class="panel-body panelbody">��s���D</div>
						</div>
						<!-- </div> -->
					</div>
				</div>
			</div>

			<!-- DashBoard ================================================================================================================== -->
			<div class="col-xs-12 col-sm-10 maincontext">
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-tasks"></span>
								<p class="text-right panelboxtitle">2</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-send"></span>
								<p class="text-right panelboxtitle">10</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-question-sign"></span>
								<p class="text-right panelboxtitle">15</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-gift"></span>
								<p class="text-right panelboxtitle">22</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-flag"></span>
								<p class="text-right panelboxtitle">212</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-grain"></span>
								<p class="text-right panelboxtitle">20</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-tasks"></span>
								<p class="text-right panelboxtitle">9</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
				<div class="col-xs-12 col-sm-3">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h2 class="panel-title paneltext">
								<span class="glyphicon glyphicon-thumbs-down"></span>
								<p class="text-right panelboxtitle">0</p>
							</h2>
							<p>Lorem ipsum dolor sit amet.</p>
						</div>
						<div class="panel-body">
							<p class="text-right">
								�Ա� <span class="glyphicon glyphicon-circle-arrow-down"></span>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- DashBoard ================================================================================================================== -->

	<!-- ��CDN -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- ��CDN -->

	<!-- �����D�n_js -->
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/back/js/main.js"></script>
	<!-- �����D�n_js -->


</body>
</html>