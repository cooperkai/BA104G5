<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.coupon.model.*"%>
<%@ page import="com.promo.model.*"%>

<jsp:useBean id="promoSvc" scope="page" class="com.promo.model.PromoService"/>


<%
	CouponVO couponVO = (CouponVO) request.getAttribute("couponVO");
	CouponService couponSvc = new CouponService();
	List<CouponVO> list = couponSvc.getAll();
	pageContext.setAttribute("list", list);
	
%>

<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<!-- 為了new NewsTypeService用 -04系列 -->
<jsp:useBean id="newstypeSvc" scope="page"
	class="com.newstype.model.NewsTypeService" />

<!-- 後端include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- 後端include -->

<!-- 一定要留住的<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- 一定要留住的<div> ================================================================================== -->

	<!-- 以下是你可以放的內容 ================================================================================== -->
	<!-- 新增房市最新消息 ========================================================================================= -->
	<div class="container cooper_house">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">
						優惠卷<a href='#coupon_jump' data-toggle="modal"
							class="btn btn_cooper modal_jump cooper_ann_href"> 新增優惠卷 </a>
					</caption>
					<thead>
						<tr class="col_title">
							<th>優惠卷編號</th>
							<th>優惠卷期限</th>
							<th>優惠卷內容</th>
							<th>優惠卷折扣</th>
							<th>訂單編號</th>
							<th>優惠卷狀態</th>
							<th>新增時間</th>
							<th>會員編號</th>
							<th>促銷編號</th>
							<th>修改優惠卷內容</th>
						</tr>
					</thead>
					<tbody>
						<%@include file="/page/page1.file"%>
						<c:forEach var="couponVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr class="col_name"
								${(couponVO.cp_no==param.cp_no) ? 'bgcolor=#54FF9F' : ''}>
								<!--將修改的那一筆加入對比色而已-->
								<td>${couponVO.cp_no}</td>
								<td><fmt:formatDate value="${couponVO.cp_from}"
										pattern="MM-dd" />~ <br> <fmt:formatDate
										value="${couponVO.cp_to}" pattern="MM-dd" /></td>
								<td class="text_overflow">${couponVO.cp_content}</td>
								<td>${couponVO.cp_discount}</td>
								<td>${couponVO.pdo_no}</td>
								<td><div class="dropdown">${couponVO.cp_state}</div></td>
								<td>${couponVO.cp_date}</td>
								<td>${couponVO.mem_no}</td>
								<td>${couponVO.promo_no}</td>
								<td>
									<form METHOD="post"
										ACTION="<%=request.getContextPath()%>/back/coupon/coupon.do">
										<input class="btn btn_cooper modal_jump cooper_ann_href"
											type="submit" value="修改優惠卷"> <input type="hidden"
											name="cp_no" value="${couponVO.cp_no}"> <input
											type="hidden" name="requestURL"
											value="<%=request.getServletPath()%>">
										<!--送出本網頁的路徑給Controller-->
										<input type="hidden" name="whichPage" value="<%=whichPage%>">
										<!--送出當前是第幾頁給Controller-->
										<input type="hidden" name="action" value="getOne_For_Update">
									</form>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="table_main">
					<tr>
						<td>
							<h4>
								<a
									href="<%=request.getContextPath()%>/back/backend/select_page_home.jsp"><img
									src="<%=request.getContextPath()%>/images/back1.gif"
									width="100" height="32" border="0">回後端首頁</a>
							</h4>
						</td>
					</tr>
					<tr>
						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/back/coupon/coupon.do">
								<b>選擇優惠卷編號:</b> <select size="1" name="cp_no">
									<c:forEach var="couponVO" items="${list}">
										<option value="${couponVO.cp_no}">${couponVO.cp_no}
									</c:forEach>
								</select> 
								<input type="hidden" name="action" value="getOne_For_Display">
								
								<input type="submit" value="送出">
							</FORM>
						</td>
					</tr>
					<div class="container">
						<div class="row">
							<div class="col-sm-12">
								<%@include file="/page/pagecoupon2.file"%>
							</div>
						</div>
					</div>
					<tr>
						<td>
							<%-- 錯誤表列 --%> <c:if test="${not empty errorMsgs}">
								<font style="color: red">請修正以下錯誤:</font>
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
	<!-- 彈出新增=====================================================================================-->
	<div class="modal fade" id="coupon_jump">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">新增優惠卷</h4>
				</div>
				<div class="modal-body">
					<form role="form" METHOD="post"
						ACTION="<%=request.getContextPath()%>/back/coupon/coupon.do"
						name="house">
						<!-- 呼叫News_Type table-->

						<label for="promo_period">優惠時間</label>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="row date_size">
									<div class="col-xs-12 col-sm-6">
										From <p>promo</p>
									</div>
									<div class="col-xs-12 col-sm-6">
										to <input type="text" class="form-control"
											id="promo_period_to" name="cp_to" placeholder="結束時間">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="cp_content">優惠卷內容</label>
							<textarea rows="10" class="form-control" name="cp_content"><%=(couponVO == null) ? "請新增優惠卷內容" : couponVO.getCp_content()%></textarea>
						</div>
						<div class="form-group">
							<label for="cp_discount">優惠折扣</label>
							<input type="text" class="form-control" name="cp_discount" value="<%=(couponVO == null) ? "5折" : couponVO.getCp_discount()%>" />
						</div>
						<div class="form-group">
							<label for="pdo_no">訂單編號</label>
							<input type="text" class="form-control" name="pdo_no" value="<%=(couponVO == null) ? "OD00000001" : couponVO.getPdo_no()%>" />
						</div>
						<div class="form-group dropdown">
							<label for="cp_state">修改狀態</label> <select
								name="cp_state" class="form-control btn_cooper" id="sel1">
								<option name="default_item2" value="">請選擇</option>
								<option class="onitem" value="已使用"
									${(couponVO.cp_state=='已使用')? 'selected': ''}>已使用</option>
								<option class="offitem" value="未使用"
									${(couponVO.cp_state=='未使用')? 'selected': ''}>未使用</option>
							</select>
						</div>
						<div class="form-group">
							<label for="mem_no">會員編號</label>
							<input type="text" class="form-control" name="mem_no" value="<%=(couponVO == null) ? "MB00000001" : couponVO.getMem_no()%>" />
						</div>
						<div class="form-group">
							<label for="promo_no">促銷編號</label>
							<input type="text" class="form-control" name="promo_no" value="<%=(couponVO == null) ? "PRO0005000" : couponVO.getPromo_no()%>" />
						</div>
						<div class="modal-footer">
							<input type="hidden" name="action" value="insert">
							<input type="hidden" name="cp_no" value="${couponVO.cp_no}">
							<button type="submit" class="btn btn_cooper" value="送出新增">送出新增</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 結束房市最新消息 ================================================================================== -->
	<!-- 以上是你可以放的內容 ================================================================================== -->

	<!-- 一定要留住的</div> ================================================================================== -->
</div>
<!-- 一定要留住的</div> ================================================================================== -->