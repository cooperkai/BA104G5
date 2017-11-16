<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>


<jsp:useBean id="list" scope="request" type="java.util.List<MemVO>" />



<%--
	MemService memSvc = new MemService();
	List<MemVO> list = memSvc.getOpenList();
	pageContext.setAttribute("list", list);
--%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>



<html>
<head>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}
</style>

</head>
<body bgcolor='white'>


	<table id="table-1">
		<tr>
			<td>
				<h3>開放找房的會員</h3>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<!--Search Bar-->
	<div class="container container_size">
		<div class="row">
			<div class="col-xs-12 col-sm-10 col-sm-offset-1 search_size">
				<form method="post"
					action="<%=request.getContextPath()%>/front/realtor/realtor.do">
					<div class="">
						<input type="text" name="MEM_ADDR" value="" placeholder="請輸入關鍵字">
						<input type="hidden" name="action" value="memOpen"> <input
							type="submit" value="搜尋" class="cooperhide">
					</div>
				</form>
			</div>
		</div>
	</div>
	<br>

	<table class="cooper">
		<tr>
			<th>會員姓名</th>
			<th>會員地址</th>
			<th>選擇聊天</th>
		</tr>
		<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
		<c:forEach var="memVO" items="${list}">
			<tr align='center' valign='middle'
				${(memVO.mem_no==param.mem_no) ? 'bgcolor=#CCCCFF':''}>
				<!--將修改的那一筆加入對比色而已-->
				<td>${memVO.mem_name}</td>
				<td>${memVO.mem_addr}</td>
				<td>
					<FORM METHOD="post" ACTION="<%=request.getContextPath()%>"
						style="margin-bottom: 0px;">
						<input type="submit" value="聊天"> <input type="hidden"
							name="" value="${memVO.mem_no}"> <input type="hidden"
							name="requestURL" value="<%=request.getServletPath()%>">
						<!--送出本網頁的路徑給Controller-->
						<input type="hidden" name="action" value="">
					</FORM>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>