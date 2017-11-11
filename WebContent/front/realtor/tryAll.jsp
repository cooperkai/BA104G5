<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>

<%

RealtorService realtorSvc = new RealtorService();
List<RealtorVO> list = realtorSvc.getAll();
pageContext.setAttribute("list", list);

%>

<jsp:useBean id="reSvc" scope="page" class="com.realestate.model.RealEstateService"/>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>

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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�Х�s��</th>
		<th>�Х�m�W</th>
		<th>�Х�ID</th>
		<th>�A�Ȧa��</th>
		<th>�A�Ȥ��q</th>
	</tr>
	<%@ include file="/page/page1.file" %> 
	<c:forEach var="realtorVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle' ${(realtorVO.rtr_no==param.rtr_no) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>${realtorVO.rtr_no}</td>
			<td>${realtorVO.rtr_name}</td>
			<td>${realtorVO.rtr_id}</td>
			<td>${realtorVO.rtr_area}</td>
			<td>${realtorVO.re_no}</td>
			<td><c:forEach var="realestateVO" items="${realestateSvc.all}">
                    <c:if test="${realtorVO.re_no==realestateVO.re_no}">
	                    ${realestateVO.re_no}�i${realestateVO.re_name}�j
                    </c:if>
                </c:forEach>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front/realtor/realtor.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�"> 
			     <input type="hidden" name="rtr_no"      value="${realtorVO.rtr_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"	    value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@include file="/page/page2.file"%>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>