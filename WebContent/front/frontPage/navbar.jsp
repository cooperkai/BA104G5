<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
  MemVO memVO = (MemVO) session.getAttribute("memVO");
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
    <!-- <nav class="navbar navbar-fixed-top"> -->
        <div class="container headerBar" id="headerBar">
            <div class="navbar-header col-xs-11 col-sm-2">
                <a class="navbar-brand" href="<%= request.getContextPath()%>/index.jsp"><img class="navshadow" src="images/For House logo.png" width="120px"></a>
            </div>
            <div class="col-xs-12 col-sm-8">
                <ul class="nav navbar-nav activebar">
                    <li><a href="#" data-toggle="tooltipNews" data-placement="bottom" >最新消息</a></li>
                    <li><a href="#">常見問題</a></li>
                    <li><a href="#">看房去</a></li>
                    <li><a href="<%=request.getContextPath()%>/front/realtor/realtor.do?action=listQueryB">找房仲</a></li>
                    <li><a href="#">安家商城</a></li>
                    <c:if test="${memVO==null}"> <!-- 判斷如果會員登入了就不顯示 "加入我們" -->
                    	<li><a href="<%=request.getContextPath()%>/index.jsp#joinUs" data-toggle="modal">加入我們</a></li>
                    </c:if>
                </ul> 
            </div>
            <div class="col-xs-12 col-sm-2">
                <ul class="nav navbar-nav logina">
                <c:if test="${memVO==null}">
                    <li><a href='<%=request.getContextPath()%>/register.jsp'><span class='glyphicon glyphicon-edit'></span> 註冊</a></li>
                    <li><a href='<%=request.getContextPath()%>/login.jsp'><span class='glyphicon glyphicon-log-in'></span> 登入</a></li>
                </c:if>
                <c:if test="${memVO!=null}">
                	<li><a href='<%= request.getContextPath()%>/member/memdata.jsp'><span class='glyphicon glyphicon-user'>.<%= memVO.getMem_name()%></span></a></li>
                	
                    <li><a href='<%= request.getContextPath()%>/logout.do'><span class='glyphicon glyphicon-log-out'></span>.登出</a></li>
                </c:if>
                </ul>
            </div>
        </div>
    <!-- </nav>  -->
    
</body>
</html>