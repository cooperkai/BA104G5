<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<title>歡迎登入</title>
<link rel="shortcut icon" href="images/houselogo1.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- 神奇小按鈕的script 開始-->
<script>
	$(document).ready(function() {
		$("#magicBtn1").click(function() {
			$("#loginid").val("realtor002@gmail.com");
			$("#password").val("123456");
		});
	});
</script>
<!-- 神奇小按鈕的script 結束-->

<style type="text/css">
body {
	font-family: Arial, Verdana, Helvetica, "LiHei Pro Medium", 微軟正黑體,
		sans-serif;
}

#outter {
	margin-top: 4em;
}

#loginDiv {
	width: 40em;
}

.loginform {
	margin-top: 10px;
}

#loginBtn {
	margin-top: 20px;
}
</style>

<!-- cooperkai.css -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/front/realtor/css/realtor_cooper.css">
<!-- cooperkai.css -->


</head>
<body>
	<div class="container text-center" id="outter">
		<div class="row">
			<div class="col-xs-12 col-sm-12">
				<a href="sellercenter.jsp"><img src="images/For House logo.png"
					width="120px"></a>
			</div>
		</div>
	</div>
	<div class="container text-center" id="loginDiv">
		<div class="row">
			<div class="panel panel-default">
				<div class="panel-heading rtr_loghead_cooper">
					<h4 class="text-center">
						<label class="control-label rtr_label_cooper">房仲登入</label>
					</h4>
				</div>
				<%-- 錯誤表列 --%>
				<div class="panel-body">
					<c:if test="${not empty loginError}">
						<font style="color: red">${loginError}</font>
					</c:if>
					<form class="form-horizontal loginform"
						action="realtor.do"
						method="post">
						<div class="form-group">
							<div class="col-sm-12">
								<input type="email" class="form-control" id="loginid"
									name="rtr_id" placeholder="帳號 (請輸入e-mail)">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-12">
								<input type="password" class="form-control" id="password"
									name="rtr_psw" placeholder="密碼">
							</div>
						</div>
						<div class="form-group margin-top" id="loginBtn">
							<div class="col-sm-12">
								<input type="submit" value="登入"
									class="btn btn-primary btn-lg btn-block btn_rtr_cooper">
							</div>
							<div class="col-sm-offset-11 col-sm-1 loginform">
								<input type="hidden" name="action" value="realtorLogin">
								<button type="button" class="btn btn-default btn-xs"
									id="magicBtn1">貼</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>