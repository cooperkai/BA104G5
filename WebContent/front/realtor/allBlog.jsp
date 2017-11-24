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
	<c:forEach var="articleVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" varStatus="s">
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
							<textarea rows="3"  id="article_context"  class="form-control" style="cursor: text;" name="article_body">${articleVO.article_body}</textarea>
							<input type="button" value="修改文章" onclick="update(this)"> 
							
							<!-- 圖片用 -->	
							<input id="upload_img" type="file" name="upload_img"> 
							<input type="hidden" id="show_base64" name="img" value="">
							<!-- 預覽圖片用 -->
							<img src="<%= request.getAttribute("img")%>">
						</div>
						
						<!-- ajax更新資料用 -->
						<script type="text/javascript">
							//更新資料用
							function update(e){
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
											alert(<%= request.getAttribute("img")%>);
											alert('已修改完成');
										}
									});
								}
							//base64圖片用
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
						
						
					
						<div class="form-group">
							<input type="button" value="刪除文章" id="${articleVO.article_no}" onclick="deleteArt(event);"> 
						</div>

					
					
					
					
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


<!-- 刪除用 -->
<script type="text/javascript">
	function deleteArt(event){//一定要用event
		$.ajax({
			type:'post',
			url: '<%=request.getContextPath()%>/front/article/article.do',
			dataType: "json",
			data: {
				action: 'delete',
				article_no: event.target.id //一定要用event
			},
			success: function(result){
				alert("你知道有些事情，就像潑出去的水一樣收不回來嗎?");
				alert("已經刪除囉，不能回到過去了^^");
				//設置時間自動挑轉
				setTimeout(function(){location.reload()}, 1000);
			},
			error: function(xhr){
				alert('不能刪除喔');
			}
		});
	}
</script>



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


