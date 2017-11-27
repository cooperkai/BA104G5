<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>

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
	href="<%=request.getContextPath()%>/images/Houselogo1.png">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/back/css/main.css">
<!-- ��ݭ����D�n_css&photo -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">


<!-- for jquery datepicker -->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<!-- for jquery datepicker -->




<title>�t�Τ��i�Ҧ����</title>
</head>
<body>
	<!-- <div class=""> -->
	<nav class="navbar navbar-fixed-top main">
	<div class="container-fluid">
		<div class="navbar-header col-xs-12 col-sm-3">
			<a class="navbar-brand "
				href="<%=request.getContextPath()%>/back/backend/select_page_home.jsp"><img
				class="navshadow"
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
				<li><a href="#"><span class="">��ݭ��u�m�W</span> </a></li>
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
						<b>��ݭ��u�m�W</b>
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
							<div class="panel-body panelbody">
								<a
									href='<%=request.getContextPath()%>/back/checkmail/RtrMailCheck.jsp'
									class='cooper_ann_href'>�f�֩Х���U</a>
							</div>
							<div class="panel-body panelbody">
								<a
									href='<%=request.getContextPath()%>/back/checkmail/SlrMailCheck.jsp'
									class='cooper_ann_href'>�f�ּt�ӵ��U</a>
							</div>
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
								<a
									href='<%=request.getContextPath()%>/back/news/listAllNews.jsp'
									class='cooper_ann_href'>�޲z�Х��̷s����</a>
							</div>
							<div class="panel-body panelbody ann_table">
								<a href='<%=request.getContextPath()%>/back/ann/listAllAnn.jsp'
									class='cooper_ann_href'>�޲z�t�Τ��i</a>
							</div>
							<div class="panel-body panelbody promo_table">
								<a
									href='<%=request.getContextPath()%>/back/promo/listAllPromo.jsp'
									class='cooper_ann_href'>�޲z�P�P��T</a>
							</div>
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



			<!-- ��CDN -->
			<script src="https://code.jquery.com/jquery.js"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
			<!-- ��CDN -->

			<!-- ��ݭ����D�n_js -->
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/back/js/main.js"></script>
			<!-- ��ݭ����D�n_js -->

			<!-- cooperkai_js -->
			<script type="text/javascript"
				src="<%=request.getContextPath()%>/back/js/backend_cooperkai.js"></script>
			<!-- cooperkai_js -->

			<!-- jquerydate picker -->
			<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
			<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
			<!-- jquerydate picker -->
</body>
</html>