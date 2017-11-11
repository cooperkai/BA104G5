<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.news.model.*"%>


<jsp:useBean id="listNews_ByNtype_No" scope="request"
	type="java.util.Set<NewsVO>" />

<jsp:useBean id="newstypeSvc" scope="page"
	class="com.newstype.model.NewsTypeService" />


<!-- �H�U�O�A�i�H�񪺤��e ================================================================================== -->

<style type="text/css">
.newstype_title, .newstype_col {
	color: #4682B4;
}

#btn_newstype {
	background-color: #4682B4;
}
</style>

<div class="container cooper_house">
	<hr style="border: 1px solid red;">
	<div class="row">
		<div class="col-xs-12 col-sm-12 table_bgcolor">
			<table class="table table-hover table_main">
				<caption class="title_pr newstype_title">�Х��s�D�����C��</caption>
				<thead>
					<tr class="col_title newstype_col">
						<th>�s�D�s��</th>
						<th>�s�D����</th>
						<th>�s�D���D</th>
						<th>�s�D���e</th>
						<th>�s�D���A</th>
						<th>�s�D�Ӥ�</th>
						<th>�s�W�ɶ�</th>
						<th>���u�s��</th>
						<th>�ק�s�D���A</th>
					</tr>
				</thead>
				<tbody>
					<%@ include file="/page/pagenewstype.file"%>
					<c:forEach var="newsVO" items="${listNews_ByNtype_No}"
						begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
						<tr class="col_name">
							<td>${newsVO.news_no}</td>
							<td><c:forEach var="newstypeVO" items="${newstypeSvc.all}">
									<c:if test="${newsVO.ntype_no==newstypeVO.ntype_no}">
									${newstypeVO.ntype_no}<br>
										<font color=orange>[${newstypeVO.news_type}]</font>
									</c:if>
								</c:forEach></td>
							<td class="text_overflow">${newsVO.news_title}</td>
							<td class="text_overflow">${newsVO.news_content}</td>
							<td>
								<div class="dropdown">${newsVO.news_state}</div>
							</td>
							<td><div class="" style="height: 145.8px; width: 194px;">
									<img style="height: 145.8px; width: 194px;"
										src="<%=request.getContextPath()%>/tool/showimage.do?action=news_photo&news_no=${newsVO.news_no}">
								</div></td>
							<td>${newsVO.news_date}</td>
							<td>${newsVO.emp_no}</td>
							<td>
								<!-- �����Х��s�D�ק�s�D���e -->
								<form METHOD="post"
									ACTION="<%=request.getContextPath()%>/back/news/news.do">
									<input class="btn btn_cooper modal_jump cooper_ann_href"
										id="btn_newstype" type="submit" value="�ק�s�D���i"> <input
										type="hidden" name="news_no" value="${newsVO.news_no}">
									<input type="hidden" name="requestURL"
										value="<%=request.getServletPath()%>"> <input
										type="hidden" name="action" value="getOne_For_Update">
								</form> <!-- end�����Х��s�D�ק�s�D���e -->
							</td>
						</tr>
					</c:forEach>
				</tbody>
				<%@ include file="/page/pagenewstype2.file"%>
			</table>
			<table>
				<tr>
					<!-- <td> -->
					<!-- <h4> -->
					<!-- <a -->
					<%-- href="<%=request.getContextPath()%>/back/newstype/listAllNewsType.jsp"><img --%>
					<%-- src="<%=request.getContextPath()%>/images/back1.gif" width="100" --%>
					<!-- height="32" border="0">�^�s�D����</a> -->
					<!-- </h4> -->
					<!-- </td> -->
					<!-- </tr> -->
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
<!-- �H�W�O�A�i�H�񪺤��e =========================================================================== -->
