<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
%>


<!-- <nav class="navbar navbar-fixed-top"> -->
<div class="container headerBar" id="headerBar">
	<div class="navbar-header col-xs-11 col-sm-2">
		<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp"><img
			class="navshadow"
			src="<%=request.getContextPath()%>/images/For House logo.png"
			width="120px"></a>
	</div>
	<div class="col-xs-12 col-sm-8">
		<ul class="nav navbar-nav activebar">
			<li><a href="#" data-toggle="tooltipNews"
				data-placement="bottom">最新消息</a></li>
			<li><a href="#">常見問題</a></li>
			<li><a href="#">看房去</a></li>
			<li><a
				href="<%=request.getContextPath()%>/front/realtor/realtor.do?action=listQueryB">找房仲</a></li>
			<li><a href="#">安家商城</a></li>
			<c:if test="${memVO==null}">
				<!-- 判斷如果會員登入了就不顯示 "加入我們" -->
				<li><a href="<%=request.getContextPath()%>/index.jsp#joinUs"
					data-toggle="modal">加入我們</a></li>
			</c:if>
		</ul>
	</div>
	<div class="col-xs-12 col-sm-2">
		<ul class="nav navbar-nav logina">
			<c:if test="${memVO==null}">
				<li><a href='<%=request.getContextPath()%>/register.jsp'><span
						class='glyphicon glyphicon-edit'></span> 註冊</a></li>
				<li><a href='<%=request.getContextPath()%>/login.jsp'><span
						class='glyphicon glyphicon-log-in'></span> 登入</a></li>
			</c:if>
			<c:if test="${memVO!=null}">
				<li><a href='<%=request.getContextPath()%>/member/memdata.jsp'><span
						class='glyphicon glyphicon-user'>.<%=memVO.getMem_name()%></span></a></li>

				<li><a href='<%=request.getContextPath()%>/logout.do'><span
						class='glyphicon glyphicon-log-out'></span>.登出</a></li>
			</c:if>
		</ul>
	</div>
</div>
<!-- </nav>  -->
