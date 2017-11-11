<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>
<%--�ĥ� EL ���g�k���� --%>

<%
	NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
<!-- �@�w�n�d��<div> ================================================================================== -->

<!-- �H�U�O�A�i�H�񪺤��e ================================================================================== -->

	<!-- �u�X�s�W�Х��̷s����=====================================================================================-->
	<div class="modal fade modal_jump" id="house_jump">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">�s�W�Х��̷s����</h4>
				</div>
				<div class="modal-body">
					<form role="form" METHOD="post" ACTION="news.do"
						enctype="multipart/form-data" name="house">
						<!-- �I�sNews_Type table-->
						<jsp:useBean id="newstypeSvc" scope="page"
							class="com.newstype.model.NewsTypeService" />
						<div class="form-group">
							<label for="ntype_no">�s�D����</label> <select
								class="form-control btn_cooper" id="sel1" name="ntype_no">
								<option class="default_item">�п��</option>
								<c:forEach var="newstypeVO" items="${newstypeSvc.all}">
									<option value="${newtypeVO.ntype_no}"
										${(newsVO.ntype_no==newstypeVO.ntype_no) ? 'selected': '' }>${newstypeVO.n_type}</option>
								</c:forEach>
							</select>
						</div>

						<div class="form-group">
							<label for="news_title">�s�D���D</label> <input type="text"
								class="form-control" name="news_title"
								value="<%=(newsVO == null) ? "�s�W�s�D���D" : "newsVO.getNews_title()"%>">
						</div>
						<div class="form-group">
							<label for="news_content">�s�D���e</label>
							<textarea rows="10" class="form-control" name="news_content"
								value="<%=(newsVO == null) ? "�s�W�s�D���e" : newsVO.getNews_content()%>"></textarea>
						</div>
						<div class="form-group dropdown">
							<label for="ann_content">�ק�s�D���A</label> <select name="news_state"
								class="form-control btn_cooper" id="sel1">
								<option class="default_item">�п��</option>
								<option class="onitem" value="���i��"
									${(newsVO.news_state=='���i��')? 'selected': ''}>���i��</option>
								<option class="offitem" value="�w�M�P"
									${(newsVO.news_state=='�w�M�P')? 'selected': ''}>�w�M�P</option>
							</select>
						</div>
						<div class="form-group">
							<input type="file" name="news_photo">
						</div>
						<div class="form-group">
							<label for="empno_no">���u�s��</label><input type="text"
								class="form-control" name="emp_no"
								value="<%=(newsVO == null) ? "EM00000002" : newsVO.getEmp_no()%>" />
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
	<!-- �����Х��̷s���� -->
<!-- �H�W�O�A�i�H�񪺤��e ================================================================================== -->

<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->