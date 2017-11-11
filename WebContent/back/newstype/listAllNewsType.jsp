<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.newstype.model.*"%>

<jsp:useBean id="newstypeSvc" scope="page"
	class="com.newstype.model.NewsTypeService" />

<%
	NewsTypeVO newstypeVO = (NewsTypeVO) request.getAttribute("newstypeVO");
%>

<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- �@�w�n�d��<div> ================================================================================== -->
	<!-- �H�U�O�A�i�H�񪺤��e ================================================================================== -->
	<!-- �s�D���� ========================================================================================= -->
	<div class="container cooper_house">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">
						�s�D���� <a href='#newstype_jump' data-toggle="modal"
							class="btn btn_cooper modal_jump cooper_ann_href"> �s�W�s�D����</a>
					</caption>
					<thead>
						<tr class="col_title">
							<th>�s�D�����s��</th>
							<th>�s�D����</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="newstypeVO" items="${newstypeSvc.all}">
							<tr class="col_name">
								<td>${newstypeVO.ntype_no}</td>
								<td>${newstypeVO.news_type}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
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
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back/newstype/newstype.do">
								<b>��ܷs�D�����s��:</b> <select size="1" name="ntype_no">
									<c:forEach var="newstypeVO" items="${newstypeSvc.getAll()}">
										<option value="${newstypeVO.ntype_no}">${newstypeVO.ntype_no}-&nbsp;[${newstypeVO.news_type}]
									</c:forEach>
								</select> <input type="hidden" name="action" value="getOne_For_Display">
								<input type="submit" value="�e�X">
							</FORM>
						</td>
					</tr>
					<tr>
						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back/newstype/newstype.do">
								<b>��ܷs�D����:</b> <select size="1" name="ntype_no">
									<c:forEach var="newstypeVO" items="${newstypeSvc.getAll()}">
										<option value="${newstypeVO.ntype_no}">${newstypeVO.news_type}
									</c:forEach>
								</select> <input type="hidden" name="action" value="listNews_ByNtype_No_B">
								<input type="submit" value="�e�X">
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

	<!-- �u�X�s�W�s�D����=====================================================================================-->
	<div class="modal fade" id="newstype_jump">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">�s�W�s�D����</h4>
				</div>
				<div class="modal-body">
					<form role="form" METHOD="post" ACTION="<%=request.getContextPath()%>/back/newstype/newstype.do"
						enctype="multipart/form-data" name="house">

						<div class="form-group">
							<label for="ntype_no">�s�D����</label> <select
								class="form-control btn_cooper" id="sel1" name="ntype_no">
								<option name="default_item1" value="">�п��</option>
								<c:forEach var="newstypeVO" items="${newstypeSvc.all}">
									<option class="onitem" value="${newstypeVO.ntype_no}"
										${(newsVO.ntype_no==newstypeVO.ntype_no)? 'selected': ''}>[${newstypeVO.ntype_no}
										- ${newstypeVO.news_type}]</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label for="news_title">�s�D����</label> <input type="text"
								class="form-control" name="ntype_no"
								value="<%=(newstypeVO == null) ? "�s�W�s�D����" : newstypeVO.getNtype_no()%>" />
						</div>
						<div class="modal-footer">
							<input type="hidden" name="action" value="insert">
							<button type="submit" class="btn btn_cooper" value="�e�X�s�W">�e�X�s�W</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- �����s�D���� ================================================================================== -->
	
	<%if (request.getAttribute("listNews_ByNtype_No") != null){%>
		<jsp:include page="listNews_ByNtype_No.jsp" />
	<%} %>
	

	<!-- �H�W�O�A�i�H�񪺤��e =========================================================================== -->

	<!-- �@�w�n�d��</div> ============================================================================ -->
</div>
<!-- �@�w�n�d��</div> ================================================================================ -->