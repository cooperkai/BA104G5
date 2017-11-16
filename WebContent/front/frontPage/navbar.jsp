<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
  MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/houselogo1.png" />
    <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/main.css">
    <script src="https://code.jquery.com/jquery.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

    <style type="text/css">
    body {
        font-family: Arial, Verdana, Helvetica, "LiHei Pro Medium", 微軟正黑體, sans-serif;
    }
    
    .headerBar{
    	width: 95em;
    }
    
    .imgbox {
        position: relative;
        z-index: -1;
        height: 20em;
        width: 20em;
    }

    .ina:hover {
        opacity: 0.85;
    }

    .imgbox img {
        position: relative;
        z-index: -10;
        max-height: 100%;
        box-shadow: 1px 1px 1px #bdbdbd;
    }

    .textbox {
        position: absolute;
        top: 0;
        z-index: 11;
        padding-top: 10em;
        width: 90%;
        height: 100%;
        text-align: center;
    }

    .textbackground {
        background-color: #ffd600;
        height: 3em;
        box-shadow: 1px 1px 1px grey;
        opacity: 0.8;
    }

    .textinline {
        /* height: 3em;*/
        position: relative;
        z-index: 5;
        opacity: 1;
        margin-top: -0.5em;
        line-height: 2;
    }

    .searchSRS {
        margin-top: 8em;
    }

    .furnitureAd {
        margin-top: 8em;
    }

    .furnitureAd>img {
        max-height: 100%;
        max-width: 100%;
    }

    .news {
        margin-top: 8em;
    }

    .redNote {
        position: relative;
        z-index: 3;
        height: 2em;
        width: 6em;
        margin-left: 9.7em;
        margin-right: 10em;
        background-color: red;
    }

    .newss {
        position: relative;
        z-index: 1;
        margin-top: -2.5em;
        background-color: #fff9c4;
    }

    .newss h3 {
        padding-top: 1.5em;
    }

    ul {
        list-style-type: none;
    }

    .textfix {
        margin-left: -15px;
    }
    .textfix ul{
        padding-bottom: 2em;
    }
    
    </style>

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