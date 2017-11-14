<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.promo.model.*"%>

<%

PromoVO promoVO = (PromoVO) request.getAttribute("promoVO");
PromoService promoSvc = new PromoService(); 

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
							<th>促銷名稱</th>
							<th>促銷內容</th>
							<th>促銷照片</th>
							<th>修改狀態</th>
							<th>新增時間</th>
							<th>員工編號</th>
						</tr>
					</thead>
					<tbody>
						<tr class="col_name">
							<td>PR100000</td>
							<td>2017-12-12~2017-12-31</td>
							<td class="text_overflow">剩但傑</td>
							<td class="tex class="text_overflow "t_overflow">只剩下但，所以就有特價</td>
							<td><img style="width: 100%; display: block;"
								src="https://api.fnkr.net/testimg/180x100"></td>
							<td>
								<div class="dropdown">
									<select class="form-control btn_cooper" id="sel1">
										<option class="onitem">已上架</option>
										<option class="offitem">已下架</option>
										<option class="yetitem">未上架</option>
									</select>
								</div>
							</td>
							<td>2017-12-01</td>
							<td>EP100000</td>
						</tr>
					</tbody>
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
					<form role="form" METHOD="post" ACTION="" name="promo">
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
							<label for="promo_name">促銷名稱</label> <input type="text"
								class="form-control" name="promo_name" placeholder="新增促銷名稱">
						</div>
						<div class="form-group">
							<label for="promo_content">促銷內容:</label>
							<textarea rows="10" class="form-control" name="promo_content"
								placeholder="新增促銷內容"></textarea>
						</div>
						<div class="form-group dropdown">
							<label for="ann_content">修改狀態</label> <select name="promo_state"
								class="form-control btn_cooper" id="sel1">
								<option class="default_item">請選擇</option>
								<option class="onitem" value="已上架">已上架</option>
								<option class="offitem" value="已下架">已下架</option>
								<option class="yetitem" value="未上架">未上架</option>
							</select>
						</div>
						<div class="form-group">
							<label for="empno_no">員工編號</label> <input type="text"
								class="form-control" name="emp_no" placeholder="輸入員工編號">
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