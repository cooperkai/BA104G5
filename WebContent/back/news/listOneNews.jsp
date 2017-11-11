<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.news.model.*"%>
<%@ page import="com.newstype.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%--
// 	NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
--%>

<!-- ���XController NewsServlet.java�w�s�Jrequest��newsVOreq����-04�t�C -->
<%
	NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
%>

<%
	NewsTypeService newstypeSvc = new NewsTypeService();
	NewsTypeVO newstypeVO = newstypeSvc.getOne(newsVO.getNtype_no());
%>


<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- �@�w�n�d��<div> ================================================================================== -->

	<!-- �H�U�O�A�i�H�񪺤��e ================================================================================ -->
	<!-- �Х��̷s���� ========================================================================================= -->
	<div class="container cooper_house">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">
						�Х��̷s����
					</caption>
					<thead>
						<tr class="col_title">
							<th>�s�D�s��</th>
							<th>�s�D����</th>
							<th>�s�D���D</th>
							<th>�s�D���e</th>
							<th>�s�D���A</th>
							<th>�s�D�Ӥ�</th>
							<th>�s�W�ɶ�</th>
							<th>���u�s��</th>
						</tr>
					</thead>
					<tbody>
						<tr class="col_name">
							<td>${newsVO.news_no}</td>
							<!-- �ª����g�k -->
							<%--<td>${newsVO.ntype_no}</td> --%>

							<!-- �s���q�O�s�D������table join�L�� -04�t�C-->
							<td>${newsVO.ntype_no}[<%=newstypeVO.getNews_type()%>]
							</td>

							<td class="text_overflow">${newsVO.news_title}</td>
							<td class="text_overflow">${newsVO.news_content}</td>
							<td>
								<div class="dropdown">${newsVO.news_state}
									<!-- <select class="form-control btn_cooper" id="sel1"> -->
									<!-- <option class="onitem">���i��</option> -->
									<!-- <option class="offitem">�w�M�P</option> -->
									<!-- </select> -->
								</div>
							</td>
							<td><div class="" style="height: 145.8px; width: 194px;">
									<img style="height: 145.8px; width: 194px;"
										src="<%=request.getContextPath()%>/tool/showimage.do?action=news_photo&news_no=${newsVO.news_no}">
								</div></td>
							<td>${newsVO.news_date}</td>
							<td>${newsVO.emp_no}</td>
						</tr>
					</tbody>
				</table>
				<table>
					<tr>
						<td>
							<h4>
								<a
									href="<%=request.getContextPath()%>/back/news/listAllNews.jsp"><img
									src="<%=request.getContextPath()%>/images/back1.gif"
									width="100" height="32" border="0">�^�Х��̷s����</a>
							</h4>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<!-- �Х��̷s����=====================================================================================-->



	<!-- �Х��̷s���� ========================================================================================= -->
	<!-- 	<div class="container cooper_house"> -->
	<!-- 		<div class="row"> -->
	<!-- 			<div class="col-xs-12 col-sm-12 table_bgcolor"> -->
	<!-- 				<table class="table table-hover table_main"> -->
	<!-- 					<caption class="title_pr"> -->
	<!-- 						�Х��̷s���� <a href='#house_jump' data-toggle="modal" -->
	<!-- 							class="btn btn_cooper modal_jump cooper_ann_href"> �s�W�Х��̷s���� </a> -->
	<!-- 					</caption> -->
	<!-- 					<thead> -->
	<!-- 						<tr class="col_title"> -->
	<!-- 							<th>�s�D�s��</th> -->
	<!-- 							<th>�s�D����</th> -->
	<!-- 							<th>�s�D���D</th> -->
	<!-- 							<th>�s�D���e</th> -->
	<!-- 							<th>�s�D���A</th> -->
	<!-- 							<th>�s�D�Ӥ�</th> -->
	<!-- 							<th>�s�W�ɶ�</th> -->
	<!-- 							<th>���u�s��</th> -->
	<!-- 						</tr> -->
	<!-- 					</thead> -->
	<!-- 					<tbody> -->
	<!-- 						<tr class="col_name"> -->
	<%-- 							<td>${newsVO.news_no}</td> --%>
	<%-- 							<td>${newsVO.ntype_no}</td> --%>
	<%-- 							<td class="text_overflow">${newsVO.news_title}</td> --%>
	<%-- 							<td class="text_overflow">${newsVO.news_content}</td> --%>
	<!-- 							<td> -->
	<%-- 								<div class="dropdown">${newsVO.news_state} --%>
	<!-- 									<select class="form-control btn_cooper" id="sel1"> -->
	<!-- 									<option class="onitem">���i��</option> -->
	<!-- 									<option class="offitem">�w�M�P</option> -->
	<!-- 									</select> -->
	<!-- 								</div> -->
	<!-- 							</td> -->
	<!-- 							<td><div class="" style="height: 145.8px; width: 194px;"> -->
	<!-- 									<img style="height: 145.8px; width: 194px;" -->
	<%-- 										src="<%=request.getContextPath()%>/tool/showimage.do?action=news_photo&news_no=${newsVO.news_no}"> --%>
	<!-- 								</div></td> -->
	<%-- 							<td>${newsVO.news_date}</td> --%>
	<%-- 							<td>${newsVO.emp_no}</td> --%>
	<!-- 						</tr> -->
	<!-- 					</tbody> -->
	<!-- 				</table> -->
	<!-- 				<table> -->
	<!-- 					<tr> -->
	<!-- 						<td> -->
	<!-- 							<h4> -->
	<!-- 								<a -->
	<%-- 									href="<%=request.getContextPath()%>/back/news/listAllNews.jsp"><img --%>
	<%-- 									src="<%=request.getContextPath()%>/images/back1.gif" --%>
	<!-- 									width="100" height="32" border="0">�^�Х��̷s����</a> -->
	<!-- 							</h4> -->
	<!-- 						</td> -->
	<!-- 					</tr> -->
	<!-- 				</table> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</div> -->
	<!-- �Х��̷s����=====================================================================================-->




	<!-- �H�W�O�A�i�H�񪺤��e ================================================================================== -->

	<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->
