<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promo.model.*"%>
 
<%
	PromoVO promoVO = (PromoVO) request.getAttribute("promoVO");
	PromoService promoSvc = new PromoService();
	List<PromoVO> list = promoSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<!-- 後端include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- 後端include -->

<!-- 一定要留住的<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- 一定要留住的<div> ================================================================================== -->

	<!-- 以下是你可以放的內容 ================================================================================== -->
	<!-- 新增促銷資訊 ========================================================================================= -->

	<div class="container cooper_promo">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">
						促銷活動 <a href='#promo_jump' data-toggle="modal"
							class="btn btn_cooper modal_jump"> 新增促銷活動 </a>
					</caption>
					<thead>
						<tr class="col_title">
							<th>促銷編號</th>
							<th>促銷時間</th>
							<th>促銷標題</th>
							<th>促銷內容</th>
							<th>促銷照片</th>
							<th>修改狀態</th>
							<th>新增時間</th>
						</tr>
					</thead>
					<tbody>
						<%@include file="/page/page1.file"%>
						<c:forEach var="promoVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr class="col_name"
								${(promoVO.promo_no==param.promo_no) ? 'bgcolor=#54FF9F' : ''}>
								<td>${promoVO.promo_no}</td>
								<td><fmt:formatDate value="${promoVO.promo_from}"
										pattern="yyyy-MM-dd" />~<fmt:formatDate
										value="${promoVO.promo_to}" pattern="yyyy-MM-dd" /></td>
								<td class="text_overflow">${promoVO.promo_name}</td>
								<td class="text_overflow">${promoVO.promo_content}</td>
								<td>
									<div class="" style="height: 145.8px; width: 194px;">
										<img style="height: 145.8px; width: 194px;"
											src="<%=request.getContextPath()%>/tool/showimage.do?action=promo_photo&promo_no=${promoVO.promo_no}" />
									</div>
								</td>

								<td>
									<div class="dropdown">${promoVO.promo_state}</div>
								</td>
								<td>${promoVO.promo_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@include file="/page/page2.file"%>

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
							<FORM METHOD="post" ACTION="promo.do">
								<b>選擇促銷編號:</b> <select size="1" name="promo_no">
									<c:forEach var="promoVO" items="${list}">
										<option value="${promoVO.promo_no}">${promoVO.promo_no}
									</c:forEach>
								</select> <input type="hidden" name="action" value="getOne_For_Display">
								<input type="submit" value="送出">
							</FORM>
						</td>
					</tr>
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


	<!-- 彈出新增促銷活動 =======================================================================================-->
	<div class="modal fade modal_jump" id="promo_jump">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">新增促銷活動</h4>
				</div>
				<div class="modal-body">
					<form role="form" METHOD="post" ACTION="/back/promo/promo.do"
						name="promo">
						
						<div class="form-group div0">
							<label for="promo_photo">促銷照片</label> 
							<input type="file"	name="promo_photo" onchange="readURL(this);"> 
							<img name="promo_photo" id="imgpreview" alt="preview image" />
						</div>
						
						<label for="promo_period">促銷時間</label>
						<div class="col-sm-12">
							<div class="form-group">
								<div class="row date_size">
									<div class="col-xs-12 col-sm-6">
										From <input type="text" class="form-control"
											id="promo_period_from" name="promo_from" placeholder="新增促銷時間">
									</div>
									<div class="col-xs-12 col-sm-6">
										to <input type="text" class="form-control"
											id="promo_period_to" name="promo_to" placeholder="新增促銷時間">
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="promo_name">促銷標題</label> <input type="text"
								class="form-control" name="promo_name"
								value="<%=(promoVO == null) ? "新增促銷標題" : promoVO.getPromo_name()%>">
						</div>
						<div class="form-group">
							<label for="promo_content">促銷內容:</label>
							<textarea rows="10" class="form-control" name="promo_content"><%=(promoVO == null) ? "請輸入促銷內容" : promoVO.getPromo_content()%></textarea>
						</div>
						<div class="form-group dropdown">
							<label for="ann_content">修改狀態</label> <select name="promo_state"
								class="form-control btn_cooper" id="sel1">
								<option name="default_item2" value="">請選擇</option>
								<option class="onitem" value="已上架"
									${(promoVO.promo_state=='已上架')? 'selected': ''}>已上架</option>
								<option class="offitem" value="已下架"
									${(promoVO.promo_state=='已下架')? 'selected': ''}>已下架</option>
								<option class="offitem" value="未上架"
									${(promoVO.promo_state=='未上架')? 'selected': ''}>未上架</option>
							</select>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">離開</button>

							<input type="hidden" name="action" value="insert">
							<button type="submit" class="btn btn_cooper" value="送出新增">送出新增</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 結束促銷活動 =============================================================================-->
	<!-- 結束促銷資訊 ================================================================================== -->
	<!-- 以上是你可以放的內容 ================================================================================== -->

	<!-- 一定要留住的</div> ================================================================================== -->
</div>
<!-- 一定要留住的</div> ================================================================================== -->