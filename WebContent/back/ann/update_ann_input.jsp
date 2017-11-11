<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ann.model.*"%>

<%
	AnnVO annVO = (AnnVO) request.getAttribute("annVO");
	AnnService annSvc = new AnnService();
	List<AnnVO> list = annSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
<!-- �@�w�n�d��<div> ================================================================================== -->


<!-- �H�U�O�A�i�H�񪺤��e ================================================================================ -->
<!--�ק�t�Τ��i========================================================================================= -->
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-6 col-sm-offset-3 form_ann">
				<form role="form" METHOD="post" ACTION="ann.do" name="ann">
					<div class="modal-header">
						<h4 class="modal-title">�ק�t�Τ��i</h4>
					</div>
					<div class="form-group">
						<label for="ann_no">���i�s��</label>
						<div>
							<h5 class="update_color"><%=annVO.getAnn_no()%></h5>
						</div>
					</div>
					<div class="form-group">
						<label for="ann_title">���i���D</label> <input type="text"
							class="form-control" name="ann_title"
							value="<%=(annVO == null) ? " �ק綠�i���D " : annVO.getAnn_title()%>" />
					</div>
					<div class="form-group">
						<label for="ann_content">���i���e</label>
						<textarea rows="10" class="form-control" name="ann_content"
							value="<%=(annVO == null) ? "�ק綠�i���e " : annVO.getAnn_content()%>"></textarea>
					</div>
					<div class="form-group dropdown">
						<label for="ann_state">�ק綠�i���A</label> <select name="ann_state"
							class="form-control btn_cooper" id="sel1">
							<option class="default_item">�п��</option>
							<option class="onitem" value="���i��"
								${(annVO.ann_state=='���i��' )? 'selected': ''}>���i��</option>
							<option class="onitem" value="�w�M�P"
								${(annVO.ann_state=='�w�M�P' )? 'selected': ''}>�w�M�P</option>
						</select>
					</div>
					<div class="form-group">
						<label for="emp_no">���u�s��</label> <input type="text"
							class="form-control" name="emp_no"
							value="<%=(annVO == null) ? " EM00000002 " : annVO.getEmp_no()%>" />
					</div>
					<div class="modal-footer">						
						<input type="hidden" name="ann_no" value="${annVO.ann_no}">
						<input type="hidden" name="action" value="update">
						<button type="submit" class="btn btn_cooper" value="�e�X�ק�">�e�X�ק�</button>
					</div>
				</form>
			</div>
		</div>
	</div>
<!-- �����ק�t�Τ��i ===================================================================================== -->
<!-- �H�W�O�A�i�H�񪺤��e ================================================================================= -->

<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->