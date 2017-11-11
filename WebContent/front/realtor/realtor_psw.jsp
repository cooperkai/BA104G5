<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.realtor.model.*"%>

<%
	RealtorVO realtorVO = (RealtorVO) session.getAttribute("realtorVO");

	if (realtorVO == null) { // 如為 null, 代表此user未登入過 , 才做以下工作
		session.setAttribute("location", request.getRequestURI()); //*工作1 : 同時記下目前位置 , 以便於login.jsp登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java)
		response.sendRedirect("realtor_login.jsp"); //*工作2 : 請該user去登入網頁(login.jsp) , 進行登入
		return;
	}
%>


<!-- 房仲修改密碼用 =================================================-->
<form role="form" method="post"
	ACTION="<%=request.getContextPath()%>/front/realtor/realtorchange.do" id="realtor_change_psw">
	<div class="modal-header">
		<h4 class="modal-title">修改密碼</h4>
	</div>
	<div class="form-group">
		<label for="rtr_name">舊密碼</label>
		<div>
			<input type="password" class="form-control" id="realtor_psw"
				placeholder="舊密碼" name="psw_ori">
		</div>
	</div>
	<div class="form-group">
		<label for="rtr_name">新密碼</label>
		<div>
			<input type="password" class="form-control" id="psw_new1"
				name="psw_new1" placeholder="新密碼">
		</div>
	</div>

	<div class="form-group">
		<label for="rtr_name">確認新密碼</label>
		<div>
			<input type="password" class="form-control" id="psw_new2"
				name="psw_new2" placeholder="確認新密碼">
		</div>
	</div>
	<div class="modal-footer">
		<input type="hidden" name="action" value="realtor_Change_Psw">
		<button type="submit" class="btn btn-danger" value="送出修改">修改密碼</button>
		<div style="float:left;">
			<c:if test="${not empty pswErrors}">
				<font style="color: red">請修正以下錯誤:</font>
				<ul>
					<c:forEach var="message" items="${pswErrors}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>
</form>


<!-- 結束房仲修改密碼用 =================================================-->