<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>
<%@ page import="com.article.model.*"%>

<%
	RealtorVO realtorVO = (RealtorVO) session.getAttribute("realtorVO");

	RealtorService realtorSvc = new RealtorService();

	String No = realtorVO.getRtr_no();
	Set<ArticleVO> list = realtorSvc.getArtByRtrNo(No);
	pageContext.setAttribute("list", list);

	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>




<jsp:include page="/front/realtor/blogTop.jsp" />


<!-- 標籤面板：內容區 -->
<div class="tab-content">
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<div class="container" style="margin-top: 1em;">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<%@ include file="page_front_realtor/pageart.file"%>
				</div>
			</div>
		</div>



		<!-- 右邊房仲文章資料 =====================================-->
		<c:forEach var="articleVO" items="${list}">
			<div class="container">
				<div class="row">
					<div
						class="panel panel-default col-sm-12  col-sm-8 col-sm-offset-2">
						<div class="panel-heading form-group">
							<h4>文章</h4>
							<h4 style="float: right;">
								<a
									href="<%=request.getContextPath()%>/front/realtor/do_not_use_it/listAllBlog.jsp">回房仲文章列表</a>
							</h4>
						</div>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front/article/article.do"
							name="form1">
							<div class="form-group">
								<label for="rtr_name">房仲名稱</label>
								<div>
									<h5>${realtorVO.rtr_name}</h5>
									<img
										src="<%=request.getContextPath()%>/tool/showimage.do?action=rtr_photo&rtr_no=${realtorVO.rtr_no}"
										style="width: 80px; height: 80px;">
								</div>
							</div>
							<div class="form-group">
								<label for="article_body">文章內容</label>
								<textarea rows="3" class="form-control" readonly
									style="cursor: no-drop;" name="article_body">${articleVO.article_body}</textarea>
							</div>
							<div class="form-group">
								<label for="post_date">發佈日期</label>
								<div>
									<h5 class="">${articleVO.post_date}</h5>
								</div>
							</div>

							<div class="input-group" style="margin-bottom: 10px;">
								<textarea class="form-control" name=""></textarea>
								<span class="input-group-btn">
									<button class="btn btn-primary" type="submit"
										style="padding: 16px;">留言</button> <input type="hidden"
									name="action" value="insert"> <input type="hidden"
									name="post_date" value="">
								</span>
							</div>
						</FORM>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>






	
				</div>
			</div>
		</div>
	</div>
	
	
	
	
	
	
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
	
