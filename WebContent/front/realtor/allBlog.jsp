<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.realtor.model.*"%>
<%@ page import="com.article.model.*"%>

<jsp:useBean id="articleSvc" scope="page"
	class="com.article.model.ArticleService" />
<jsp:useBean id="realtorSvc" scope="page"
	class="com.realtor.model.RealtorService" />

<%
	RealtorVO realtorVO = (RealtorVO) session.getAttribute("realtorVO");
	List<ArticleVO> list = articleSvc.getAllByTime();
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
	<c:forEach var="articleVO" items="${list}" begin="<%=pageIndex%>"
		end="<%=pageIndex+rowsPerPage-1%>">
		<div class="container">
			<div class="row">
				<div class="panel panel-default col-sm-12  col-sm-8 col-sm-offset-2">
					<div class="panel-heading form-group">
						<h4>文章</h4>
						<h4 style="float: right;">
							<a href="#top">回房仲文章列表</a>
						</h4>
					</div>
					<div class="form-group">
						<label for="rtr_name">房仲名稱</label>
						<div>
							<h5>${realtorSvc.getOne(articleVO.rtr_no).getRtr_name()}</h5>
							<img
								src="<%=request.getContextPath()%>/tool/showimage.do?action=rtr_photo&rtr_no=${realtorSvc.getOne(articleVO.rtr_no).getRtr_no()}"
								style="width: 80px; height: 80px;">
						</div>
					</div>
					<c:if test="${(realtorVO.rtr_no) == (articleVO.rtr_no) }"> 
						<div class="form-group">
							<label for="article_body">文章內容</label>
							<textarea rows="3"  id="article_context"  class="form-control" style="cursor: no-drop;" name="article_body">${articleVO.article_body}</textarea>
							<input type="button" value="修改文章" onclick="update()"> 
							<input type="hidden" name="article_no" value="${articleVO.article_no}">
							<input type="hidden" name="article_state" value="ON"> 
							<input type="hidden" name="rtr_no" value="${articleVO.rtr_no}">
							<input id="upload_img" type="file" name="upload_img"> 
							<input type="hidden" id="show_base64" name="img" value="">
							<img src="data:image/gif;base64,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">
						</div>
						<script type="text/javascript">
						
						
						
							function update(e){
							console.log($('#article_context').val());
									$.ajax({
										type:'post',
										url: '<%=request.getContextPath()%>/front/article/article.do',
										data: {
											action: 'update',
											article_no: '${articleVO.article_no}',
											article_state: 'ON',
											rtr_no: '${articleVO.rtr_no}',
											article_body:$('#article_context').val(),
											img:$('#show_base64').val()
										},
										
										error: function(xhr){
											alert('修改文章失敗');
										},
										success: function(result){
											alert('供黑雷阿');
										}
									});
								}
							
							function InputLoadImageToBindImageElement(uploadElement, targetElement) {								 
							    if (uploadElement.files && uploadElement.files[0]) {
							        var reader = new FileReader();							 
							        reader.onload = function (e) {
							            $(targetElement).val(e.target.result);
							        }
							        reader.readAsDataURL(uploadElement.files[0]);
							    }	
							}
							
							$("#upload_img").change(function () {
						          InputLoadImageToBindImageElement(this, $('#show_base64'));
						});
							
							
							
							
						
						</script>
						
						
						
						
						
						
						
						
						
						
						
						
					<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/front/article/article.do"	name="form1">
						<div class="form-group">
							<label for="article_body">文章內容</label>
							<textarea rows="3" id="article_context2" class="form-control" style="cursor: no-drop;" name="article_body">${articleVO.article_body}</textarea>
							<input type="button"  value="刪除文章"  onclick="toDataURL()"> 
							<input type="hidden" name="action" value="delete"> 
							<input type="hidden" name="article_no" value="${articleVO.article_no}">
						</div>
					</FORM>
					</c:if>
					<div class="form-group">
						<label for="post_date">發佈日期</label>
						<div>
							<h5 class="">
								<fmt:formatDate value="${articleVO.post_date}"
									pattern="yyyy-MM-dd HH:mm:ss" />
							</h5>
						</div>
					</div>
					<!-- <div class="input-group" style="margin-bottom: 10px;"> -->
					<!-- <textarea class="form-control" name=""></textarea> -->
					<!-- <span class="input-group-btn"> -->
					<!-- <button class="btn btn-primary" type="submit" style="padding: 16px;">留言</button>  -->
					<!-- </span> -->
					<!-- </div> -->
				</div>
			</div>
		</div>
	</c:forEach>
</div>

<div class="container" style="margin-top: 1em;">
	<div class="row">
		<div class="col-sm-6 col-sm-offset-3">
			<%@ include file="page_front_realtor/pageart2.file"%>
		</div>
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


