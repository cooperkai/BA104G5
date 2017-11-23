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
	pageContext.setAttribute("articleVO", articleVO);
%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<jsp:useBean id="reSvc" scope="page"
	class="com.realestate.model.RealEstateService" />

<!-- 房仲前端 -->
<jsp:include page="/front/frontPage/frontPage.jsp" flush="true" />
<!-- 房仲前端 -->
<!-- 右邊房仲相關資料區include資料用 =====================================-->
<div class="col-sm-12 col-sm-8 form_realtor">

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color: red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color: red">${message}</li>
		</c:forEach>
	</ul>
</c:if>



		
			<div class="panel-heading panel-default form-group">
				<h4>文章新增</h4>
				<h4 style="float:right;">
					<a href="<%=request.getContextPath()%>/front/realtor/allBlog.jsp">房仲文章列表</a>
				</h4>
			</div>
		
			<FORM METHOD="post"
				ACTION="<%=request.getContextPath()%>/front/article/article.do"
				name="form1">
				<div class="form-group">
					<label for="article_body">文章內容</label>
					<textarea rows="10" class="form-control" name="article_body" required autofocus><%=(articleVO == null) ? "文章內容" : articleVO.getArticle_body()%></textarea>
				</div>
				<div class="form-group">
					<label for="article_state">是否開放</label> <select
						class="selectpicker show-tick form-control" name="article_state">
						<option name="default_item" value="">選擇是否開放</option>
						<option value="ON"
							${(articleVO.article_state == 'ON') ? 'selected' : ''}>ON</option>
						<option value="OFF"
							${(articleVO.article_state == 'OFF') ? 'selected' : ''}>OFF</option>
					</select>
				</div>

				<div class="panel-footer form-group">
					<input type="hidden" name="action" value="insert"> 
					<input type="hidden" name="post_date" value=""> 
					<input type="hidden" name="rtr_no" value="${realtorVO.rtr_no}"> 
					<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"> 
					<input type="submit" value="送出新增">
				</div>
			</FORM>
	

<%
	java.sql.Timestamp post_date = null;
	try {
		post_date = articleVO.getPost_date();
	} catch (Exception e) {
		post_date = new java.sql.Timestamp(System.currentTimeMillis());
	}
%>


</div>
<!-- 右邊房仲相關資料區include資料用結束 =====================================-->

<!-- 充版面用 -->
<div class="col-sm-1"></div>
<!-- 充版面用 -->
</div>
</div>
<!-- 房仲左邊功能列結束 ================================================================-->


<!-- footer -->
<footer class="container-fluid" id="cooper_footer">
	<div class="container text-center">
		<div class="col-xs-12 col-sm-2">
			<a href="#">HOME</a>
		</div>
		<div class="col-xs-12 col-sm-2">
			<a href="#">OUR TEAM</a>
		</div>
		<div class="col-xs-12 col-sm-2">
			<a href="#">COMMUNITIES</a>
		</div>
		<div class="col-xs-12 col-sm-2">
			<a href="#">COMMUNITIES</a>
		</div>
		<div class="col-xs-12 col-sm-2">
			<a href="#">COMMUNITIES</a>
		</div>
		<div class="col-xs-12 col-sm-2">
			<a href="#">CONTACT US</a>
		</div>
	</div>
	<div class="copyri text-center">
		<p>
			<small>Copyright © 2017 For House</small>
		</p>
	</div>
</footer>
<!-- footer -->
</body>
</html>

