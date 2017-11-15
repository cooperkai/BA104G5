<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.slr.model.*"%>

<%

SlrService slrSvc = new SlrService();
List<SlrVO> list = slrSvc.getAllSlr();
pageContext.setAttribute("list", list);

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>所有廠商狀態</title>

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

<h4>此頁練習採用 EL 的寫法取值:</h4>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>廠商編號</th>
		<th>廠商名稱</th>
		<th>廠商ID</th>
		<th>廠商狀態</th>
		<th colspan="2">修改廠商狀態</th>
		 
	</tr>
	<%@ include file="/page/page1.file" %> 
	<c:forEach var="slrVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(slrVO.slr_no==param.slr_no) ? 'bgcolor=#CCCCFF':''}><!--將修改的那一筆加入對比色而已-->
			<td>${slrVO.slr_no}</td>
			<td>${slrVO.slr_name}</td>
			<td>${slrVO.slr_id}</td>
			<td>${slrVO.slr_state}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back/checkmail/checkmail.do" style="margin-bottom: 0px;">
			     <input type="submit" value="通過"> 
			     <input type="hidden" name="slr_no"      value="${slrVO.slr_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	    value="onSlr">
			  </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back/checkmail/checkmail.do" style="margin-bottom: 0px;">
			     <input type="submit" value="停權"> 
			     <input type="hidden" name="slr_no"      value="${slrVO.slr_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--送出當前是第幾頁給Controller-->
			     <input type="hidden" name="action"	    value="offSlr">
			  </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@include file="/page/page2.file"%>

<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>