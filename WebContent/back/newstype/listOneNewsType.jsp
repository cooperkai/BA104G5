<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.news.model.*"%>
<%@ page import="com.newstype.model.*"%>

<!-- ���Xcontroller NewsTypeServlet.java�w�s�Jrequest��NewsTypeVO���� -->
<%
	NewsTypeVO newstypeVO = (NewsTypeVO) request.getAttribute("newstypeVO");
%>

<!-- ���X������NewsVO���� -->
<%
	NewsService newsSvc = new NewsService();
	NewsVO newsVO = newsSvc.getOne(newstypeVO.getNtype_no());
%>


<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- �@�w�n�d��<div> ================================================================================== -->

	<!-- �H�U�O�A�i�H�񪺤��e ================================================================================ -->
	<!-- �s�D���� ========================================================================================= -->
	<div class="container cooper_house">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">�s�D����</caption>
					<thead>
						<tr class="col_title">
							<th>�s�D�����s��</th>
							<th>�s�D����</th>
						</tr>
					</thead>
					<tbody>
						<tr class="col_name">
							<td>${newstypeVO.ntype_no}</td>
							<td>${newstypeVO.news_type}</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tr>
						<td>
							<h4>
								<a
									href="<%=request.getContextPath()%>/back/newstype/listAllNewsType.jsp"><img
									src="<%=request.getContextPath()%>/images/back1.gif"
									width="100" height="32" border="0">�^�s�D����</a>
							</h4>
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
	<!-- �H�W�O�A�i�H�񪺤��e ================================================================================== -->

	<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->
