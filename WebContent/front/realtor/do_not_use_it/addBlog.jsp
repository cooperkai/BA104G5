<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>
<%@ page import="com.article.model.*"%>



<%
	RealtorService realtorSvc = new RealtorService();
	List<RealtorVO> list = realtorSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<%
	ArticleService articleSvc = new ArticleService();
	List<ArticleVO> artlist = articleSvc.getAll();
	pageContext.setAttribute("artlist", artlist);

	ArticleVO articleVO = (ArticleVO) request.getAttribute("articleVO");
%>



<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<jsp:useBean id="reSvc" scope="page"
	class="com.realestate.model.RealEstateService" />

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>員工資料新增 - addEmp.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>文章新增</h3>
			</td>
			<td>
				<h4>
					<a
						href="<%=request.getContextPath()%>/front/realtor/listAllBlog.jsp"><img
						src="images/tomcat.png" width="100" height="100" border="0">回房仲文章列表</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>資料新增:</h3>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/front/article/article.do"
		name="form1">
		<table>
			<tr>
				<td>房仲編號</td>
				<td><input type="TEXT" name="rtr_no" size="45" class="form-control"
					value="<%=(articleVO == null) ? "編號" : articleVO.getRtr_no()%>" /></td>
			</tr>
			<tr>
				<td>文章內容</td>
				<td><textarea rows="10" class="form-control"
						name="article_body"><%=(articleVO == null) ? "文章內容" : articleVO.getArticle_body()%>
						</textarea></td>
			</tr>
			<tr>
				<td>是否開放</td>
				<td><input type="TEXT" name="article_state" size="45"
					value="<%=(articleVO == null) ? "OFF" : articleVO.getArticle_state()%>" /></td>
			</tr>
		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="hidden" name="post_date" value=""> <input type="submit"
			value="送出新增">
	</FORM>
</body>

<%
	java.sql.Timestamp post_date = null;
	try {
		post_date = articleVO.getPost_date();
	} catch (Exception e) {
		post_date = new java.sql.Timestamp(System.currentTimeMillis());
	}
%>

</html>