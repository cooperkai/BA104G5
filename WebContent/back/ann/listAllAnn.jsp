<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ann.model.*"%>
<%--�ĥ� EL ���g�k���� --%>

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


	<!-- �H�U�O�A�i�H�񪺤��e ================================================================================== -->
	<!--�s�W�t�Τ��i================================================================================ -->
	<div class="container cooper_ann">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">
						�t�Τ��i<a href='#ann_jump' data-toggle="modal"
							class="btn btn_cooper modal_jump cooper_ann_href"> �s�W�t�Τ��i </a>
					</caption>
					<thead>
						<tr class="col_title">
							<th>���i�s��</th>
							<th>���i���D</th>
							<th>���i���e</th>
							<th>���i���A</th>
							<th>���i�ɶ�</th>
							<th>���u�s��</th>
							<th>�ק綠�i���A</th>
						</tr>
					</thead>
					<tbody>
						<%@include file="/page/page1.file"%>
						<c:forEach var="annVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr class="col_name">
								<td>${annVO.ann_no}</td>
								<td class="text_overflow">${annVO.ann_title}</td>
								<td class="text_overflow">${annVO.ann_content}</td>
								<td>
									<div class="dropdown">${annVO.ann_state}
										<!-- <select class="form-control btn_cooper" id="sel1"> -->
										<!-- <option class="default_item">�п��</option> -->
										<%-- <option class="onitem btn_cooper">${annVO.ann_state}</option> --%>
										<!-- </select> -->
									</div>
								</td>
								<td>${annVO.ann_date}</td>
								<td>${annVO.emp_no}</td>
								<td>
									<form METHOD="post" ACTION="ann.do">
										<input class="btn btn_cooper modal_jump cooper_ann_href"
											type="submit" value="�ק�t�Τ��i"> <input type="hidden"
											name="ann_no" value="${annVO.ann_no}"> <input
											type="hidden" name="action" value="getOne_For_Update">
									</form>
								</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@include file="/page/page2.file"%>
				<table>
					<tr>
						<td>
							<h4>
								<a
									href="<%=request.getContextPath()%>/back/backend/select_page_home.jsp"><img
									src="<%=request.getContextPath()%>/images/back1.gif"
									width="100" height="32" border="0">�^��ݭ���</a>
							</h4>
						</td>
					</tr>
					<tr>
						<td>
							<FORM METHOD="post" ACTION="ann.do">
								<b>��ܤ��i�s��:</b> <select size="1" name="ann_no">
									<c:forEach var="annVO" items="${list}">
										<option value="${annVO.ann_no}">${annVO.ann_no}
									</c:forEach>
								</select> <input type="hidden" name="action" value="getOne_For_Display">
								<input type="submit" value="�e�X">
							</FORM>
						</td>
					</tr>
					<tr>
						<td>
							<FORM METHOD="post" ACTION="ann.do">
								<b>��ܧR�����i�s��:</b> <select size="1" name="ann_no">
									<c:forEach var="annVO" items="${list}">
										<option value="${annVO.ann_no}">${annVO.ann_no}
									</c:forEach>
								</select> <input type="hidden" name="action" value="delete"> <input
									class="delete_confirm btn btn-danger" type="submit" value="�e�X">
							</FORM>
						</td>
					</tr>
					<tr>
						<td>
							<%-- ���~��C --%> <c:if test="${not empty errorMsgs}">
								<font style="color: red">�Эץ��H�U���~:</font>
								<ul>
									<c:forEach var="message" items="${errorMsgs}">
										<li style="color: red">${message}</li>
									</c:forEach>
								</ul>
							</c:if>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>




	<!-- �u�X�s�W�t�Τ��i============================================================= -->
	<div class="modal fade" id="ann_jump">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">�s�W�t�Τ��i</h4>
				</div>
				<div class="modal-body">
					<form role="form" METHOD="post" ACTION="ann.do" name="ann">
						<div class="form-group">
							<label for="ann_title">���i���D</label> <input type="text"
								class="form-control" name="ann_title"
								value="<%=(annVO == null) ? "�s�W���i�W��" : annVO.getAnn_title()%>" />
						</div>
						<div class="form-group">
							<label for="ann_content">���i���e</label>
							<textarea rows="10" class="form-control" name="ann_content"
								value="<%=(annVO == null) ? "�s�W���i���e" : annVO.getAnn_content()%>"></textarea>
						</div>
						<div class="form-group dropdown">
							<label for="ann_state">���i���A</label> <select name="ann_state"
								class="form-control btn_cooper" id="sel1">
								<option name="default_item" value="">�п��</option>
								<option class="onitem" value="���i��"
									${(annVO.ann_state=='���i��')? 'selected': ''}>���i��</option>
								<option class="onitem" value="�w�M�P"
									${(annVO.ann_state=='�w�M�P')? 'selected': ''}>�w�M�P</option>
							</select>
						</div>
						<div class="form-group">
							<label for="emp_no">���u�s��</label> <input type="text"
								class="form-control" name="emp_no"
								value="<%=(annVO == null) ? "EM00000002" : annVO.getEmp_no()%>" />
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">���}</button>
							<input type="hidden" name="action" value="insert">
							<button type="submit" class="btn btn_cooper" value="�e�X�s�W">�e�X�s�W</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- �����s�W�t�Τ��i ============================================================================ -->




	<!-- �u�X�ק�t�Τ��i ============================================================================= -->
	<!-- 	<div class="modal2 fade" id="ann_jump_update"> -->
	<!-- 		<div class="modal-dialog"> -->
	<!-- 			<div class="modal-content2"> -->
	<!-- 				<div class="modal-header2"> -->
	<!-- 					<button type="button" class="close" data-dismiss="modal" -->
	<!-- 						aria-hidden="true">&times;</button> -->
	<!-- 					<h4 class="modal-title">�ק�t�Τ��i</h4> -->
	<!-- 				</div> -->
	<!-- 				<div class="modal-body2"> -->
	<!-- 					<form role="form" METHOD="post" ACTION="ann.do" name="ann"> -->
	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ann_title">���i�s��</label> -->
	<!-- 							<div> -->
	<%-- 								<h5 class="update_color"><%=annVO.getAnn_no()%></h5> --%>
	<!-- 							</div> -->
	<!-- 						</div> -->
	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ann_title">���i���D</label> <input type="text" -->
	<!-- 								class="form-control" name="ann_title" -->
	<%-- 								value="<%=(annVO == null) ? "�ק綠�i�W��" : annVO.getAnn_title()%>" /> --%>
	<!-- 						</div> -->
	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="ann_content">���i���e</label> -->
	<!-- 							<textarea rows="10" class="form-control" name="ann_content" -->
	<%-- 								value="<%=(annVO == null) ? "�ק綠�i���e" : annVO.getAnn_content()%>"></textarea> --%>
	<!-- 						</div> -->
	<!-- 						<div class="form-group dropdown"> -->
	<!-- 							<label for="ann_state">�ק綠�i���A</label> <select name="ann_state" -->
	<!-- 								class="form-control btn_cooper" id="sel1"> -->
	<!-- 								<option class="default_item">�п��</option> -->
	<!-- 								<option class="onitem" value="���i��" -->
	<%-- 									${(annVO.ann_state=='���i��')? 'selected': ''}>���i��</option> --%>
	<!-- 								<option class="onitem" value="�w�M�P" -->
	<%-- 									${(annVO.ann_state=='�w�M�P')? 'selected': ''}>�w�M�P</option> --%>
	<!-- 							</select> -->
	<!-- 						</div> -->
	<!-- 						<div class="form-group"> -->
	<!-- 							<label for="emp_no">���u�s��</label> <input type="text" -->
	<!-- 								class="form-control" name="emp_no" -->
	<%-- 								value="<%=(annVO == null) ? "EM00000002" : annVO.getEmp_no()%>" /> --%>
	<!-- 						</div> -->

	<!-- 						<div class="modal-footer2"> -->
	<!-- 							<input type="hidden" name="action" value="leave"> -->
	<!-- 							<button type="submit" class="btn btn-default" -->
	<!-- 								data-dismiss="modal" value="���}">���}</button> -->
	<%-- 							<input type="hidden" name="ann_no" value="${annVO.ann_no}"> --%>
	<!-- 							<input type="hidden" name="action" value="update"> -->
	<!-- 							<button type="submit" class="btn btn_cooper" value="�e�X�ק�">�e�X�ק�</button> -->
	<!-- 						</div> -->
	<!-- 					</form> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- �����ק�t�Τ��i ================================================================================== -->


<!-- �H�W�O�A�i�H�񪺤��e ================================================================================== -->

<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->

