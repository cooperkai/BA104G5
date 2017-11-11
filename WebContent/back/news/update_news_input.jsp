<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>

<%
	NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<style >
 table, th, td {
    border: 0px solid #CCCCFF;
  }
</style>


<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- �@�w�n�d��<div> ================================================================================== -->

	<!-- �H�U�O�A�i�H�񪺤��e ================================================================================ -->
	<!--�ק�s�D���i========================================================================================= -->
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
				<form role="form" METHOD="post" ACTION="news.do"
					enctype="multipart/form-data" name="news">
					<div class="modal-header">
						<h4 class="modal-title">�ק�Х��̷s����</h4>
					</div>
					<div class="form-group">
						<label for="news_no">�s�D�s��</label>
						<div>
							<h5 class="update_color"><%=newsVO.getNews_no()%></h5>
						</div>
					</div>
					<!-- �ª����g�k -->
					<!-- <div class="form-group"> -->
					<!-- <label for="ntype_no">�s�D����</label> <select -->
					<!-- class="form-control btn_cooper" id="sel1" name="ntype_no"> -->
					<!-- <option name="default_item1" value="">�п��</option> -->
					<!-- <option class="onitem" value="LK002" -->
					<%-- ${(newsVO.ntype_no=='LK002')? 'selected': ''}>LK002</option> --%>
					<!-- <option class="onitem" value="GH003" -->
					<%-- ${(newsVO.ntype_no=='GH003')? 'selected': ''}>GH003</option> --%>
					<!-- <option class="onitem" value="HN001" -->
					<%-- ${(newsVO.ntype_no=='HN001')? 'selected': ''}>HN001</option> --%>
					<!-- </select> -->
					<!-- </div> -->
					
					<!-- �s���q�O�s�D������table join�L�� -->
					<jsp:useBean id="newstypeSvc" scope="page"
						class="com.newstype.model.NewsTypeService" />
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
						<label for="news_title">�s�D���D</label> <input type="text"
							class="form-control" name="news_title"
							value="<%=(newsVO == null) ? "�ק�s�D���D" : newsVO.getNews_title()%>">
					</div>
					<div class="form-group">
						<label for="news_content">�s�D���e</label>
						<textarea rows="10" class="form-control" name="news_content"
							value="<%=(newsVO == null) ? "�ק�s�D���e" : newsVO.getNews_content()%>"></textarea>
					</div>
					<div class="form-group dropdown">
						<label for="news_content">�ק�s�D���A</label> <select name="news_state"
							class="form-control btn_cooper" id="sel1">
							<option name="default_item2" value="">�п��</option>
							<option class="onitem" value="���i��"
								${(newsVO.news_state=='���i��')? 'selected': ''}>���i��</option>
							<option class="offitem" value="�w�M�P"
								${(newsVO.news_state=='�w�M�P')? 'selected': ''}>�w�M�P</option>
						</select>
					</div>
					<!-- <div class="" style="height: 145.8px; width: 194px;"> -->
					<!-- <img style="height: 145.8px; width: 194px;" -->
					<%-- src="<%=request.getContextPath()%>/tool/showimage.do?action=news_photo&news_no=${newsVO.news_no}"> --%>
					<!-- </div> -->
					<div class="form-group">
						<input type="file" name="news_photo">
					</div>
					<div class="form-group">
						<label for="empno_no">���u�s��</label><input type="text"
							class="form-control" name="emp_no"
							value="<%=(newsVO == null) ? "EM00000002" : newsVO.getEmp_no()%>" />
					</div>
					<div class="modal-footer">
						<!-- <input type="hidden" name="action" value="leave"> -->
						<!-- <button type="submit" class="btn btn-default" data-dismiss="modal" -->
						<!-- value="���}">���}</button> -->
						<input type="hidden" name="action" value="update">
						<input type="hidden" name="news_no" value="${newsVO.news_no}">
						<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
						<input type="hidden" name="whichPage" value="<%=request.getParameter("whichPage")%>"> <!--�u�Ω�:istAllEmp.jsp-->
						<button type="submit" class="btn btn_cooper" value="�e�X�ק�">�e�X�ק�</button>
					</div>
				</form>
			</div>
		</div>
		<br>�e�X�ק諸�ӷ��������|:<br><b>
   <font color=blue>request.getParameter("requestURL"):</font> <%=request.getParameter("requestURL")%><br>
   <font color=blue>request.getParameter("whichPage"): </font> <%=request.getParameter("whichPage")%> (���d�ҥثe�u�Ω�:istAllEmp.jsp))</b>
	</div>
	<!-- �����ק�s�D���i ===================================================================================== -->
	<!-- �H�W�O�A�i�H�񪺤��e ================================================================================= -->

	<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->
