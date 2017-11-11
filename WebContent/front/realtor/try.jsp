<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>

<jsp:useBean id="realtorSvc" scope="page" class="com.realtor.model.RealtorService" />
<jsp:useBean id="realestateSvc" scope="page" class="com.realestate.model.RealEstateService" />


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
<title>Insert title here</title>
</head>
<body>

	<%-- �U�νƦX�d��-�H�U���-�i�H�N�W�� --%>
	<ul>
		<li>
			<FORM METHOD="post"	ACTION="realtor.do"	name="form1">
				<b><font color=blue>�U�νƦX�d��:</font></b> 
				<br> <b>��J�Х�s��:</b> 
				<input type="text" name="rtr_no" value="RT00000001"><br> 
				<b>��J�Х�m�W:</b>
				<input type="text" name="rtr_name" value="���p�_"><br> 
				<b>��J�Х�IDemail:</b>
				<input type="text" name="rtr_id" value="realtor001@gmail.com"><br>

				<b>��ܦa��:</b> <select size="1" name="rtr_area">
				<option value="">
				<c:forEach var="realtorVO" items="${realtorSvc.all}">
					<option value="${realtorVO.rtr_area }">${realtorVO.rtr_area }</option>
				</c:forEach>
				</select><br> 
				<b>��ܪA�Ȥ��q:</b> 
				<select name="re_no">
				<option value="">
				<c:forEach var="realestateVO" items="${realestateSvc.all}">
					<option value="${realestateVO.re_no}">${realestateVO.re_name}</option>
				</c:forEach>
				</select>
				 <input type="hidden" name="action" value="listRealtor_ByCompositeQuery">
				<input type="submit" value="�e�X"> 
			</FORM>
		</li>
	</ul>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>




</body>
</html>