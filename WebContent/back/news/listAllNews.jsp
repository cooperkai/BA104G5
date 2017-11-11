<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>

<%-- �ĥ� EL ���g�k���� --%>

<%
	NewsVO newsVO = (NewsVO) request.getAttribute("newsVO");
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<!-- ���Fnew NewsTypeService�� -04�t�C -->
<jsp:useBean id="newstypeSvc" scope="page"
	class="com.newstype.model.NewsTypeService" />

<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
	<!-- �@�w�n�d��<div> ================================================================================== -->

	<!-- �H�U�O�A�i�H�񪺤��e ================================================================================== -->
	<!-- �s�W�Х��̷s���� ========================================================================================= -->
	<div class="container cooper_house">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">
						�Х��̷s����<a href='#house_jump' data-toggle="modal"
							class="btn btn_cooper modal_jump cooper_ann_href"> �s�W�Х��̷s���� </a>
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
							<th>�ק�s�D���A</th>
						</tr>
					</thead>
					<tbody>
						<%@include file="/page/page1.file"%>
						<c:forEach var="newsVO" items="${list}" begin="<%=pageIndex%>"
							end="<%=pageIndex+rowsPerPage-1%>">
							<tr class="col_name" ${(newsVO.news_no==param.news_no) ? 'bgcolor=#54FF9F' : ''}><!--�N�ק諸���@���[�J����Ӥw-->
								<td>${newsVO.news_no}</td>
								<!-- �ª����g�k -->
								<%-- <td>${newsVO.ntype_no}</td> --%>

								<!-- �s���q�O�s�D������table join�L�� -04�t�C-->
								<%-- <td>${newstypeSvc.getOne(newsVO.ntype_no).news_type}</td> --%>

								<td>${newsVO.ntype_no}<br>
									[${newstypeSvc.getOne(newsVO.ntype_no).news_type}]</td>

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
								<td>
									<form METHOD="post" ACTION="<%=request.getContextPath()%>/back/news/news.do">
										<input class="btn btn_cooper modal_jump cooper_ann_href" type="submit" value="�ק�s�D���i"> 
										<input type="hidden" name="news_no" value="${newsVO.news_no}">
										<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
										<input type="hidden" name="whichPage" value="<%=whichPage%>"><!--�e�X��e�O�ĴX����Controller-->
										<input type="hidden" name="action" value="getOne_For_Update">
									</form>
								</td>
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
									width="100" height="32" border="0">�^��ݭ���</a>
							</h4>
						</td>
					</tr>
					<tr>
						<td>
							<FORM METHOD="post" ACTION="news.do">
								<b>��ܷs�D�s��:</b> <select size="1" name="news_no">
									<c:forEach var="newsVO" items="${list}">
										<option value="${newsVO.news_no}">${newsVO.news_no}
									</c:forEach>
								</select> <input type="hidden" name="action" value="getOne_For_Display">
								<input type="submit" value="�e�X">
							</FORM>
						</td>
					</tr>
					<tr>
						<td>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back/newstype/newstype.do">
								<b>��ܷs�D����:</b> <select size="1" name="ntype_no">
									<c:forEach var="newstypeVO" items="${newstypeSvc.getAll()}">
										<option value="${newstypeVO.ntype_no}">${newstypeVO.ntype_no}-&nbsp;[${newstypeVO.news_type}]</option>
									</c:forEach>
								</select> <input type="hidden" name="action" value="listNews_ByNtype_No_B">
								<input type="submit" value="�e�X">
							</FORM>
						</td>
					</tr>
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
				
				<%if (request.getAttribute("listNews_ByNtype_No") != null){%>
		<jsp:include page="/back/newstype/listNews_ByNtype_No.jsp" />
	<%} %>
				
				
			</div>
		</div>
	</div>
	<!-- �u�X�s�W�Х��̷s����=====================================================================================-->
	<div class="modal fade" id="house_jump">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">�s�W�Х��̷s����</h4>
				</div>
				<div class="modal-body">
					<form role="form" METHOD="post" ACTION="news.do"
						enctype="multipart/form-data" name="house">
						<!-- �I�sNews_Type table-->

						<div class="form-group">
							<label for="ntype_no">�s�D����</label> <select
								class="form-control btn_cooper" id="sel1" name="ntype_no">
								<option name="default_item1" value="">�п��</option>
								<option class="onitem" value="LK002"
									${(newsVO.ntype_no=='LK002')? 'selected': ''}>LK002</option>
								<option class="onitem" value="GH003"
									${(newsVO.ntype_no=='GH003')? 'selected': ''}>GH003</option>
								<option class="onitem" value="HN001"
									${(newsVO.ntype_no=='HN001')? 'selected': ''}>HN001</option>
							</select>
						</div>

						<div class="form-group">
							<label for="news_title">�s�D���D</label> <input type="text"
								class="form-control" name="news_title"
								value="<%=(newsVO == null) ? "�s�W�s�D���D" : newsVO.getNews_title()%>" />
						</div>
						<div class="form-group">
							<label for="news_content">�s�D���e</label>
							<textarea rows="10" class="form-control" name="news_content"
								value="<%=(newsVO == null) ? "�s�W�s�D���e" : newsVO.getNews_content()%>"></textarea>
						</div>
						<div class="form-group dropdown">
							<label for="news_content">�ק�s�D���A</label> <select
								name="news_state" class="form-control btn_cooper" id="sel1">
								<option name="default_item2" value="">�п��</option>
								<option class="onitem" value="���i��"
									${(newsVO.news_state=='���i��')? 'selected': ''}>���i��</option>
								<option class="offitem" value="�w�M�P"
									${(newsVO.news_state=='�w�M�P')? 'selected': ''}>�w�M�P</option>
							</select>
						</div>
						<div class="form-group">
							<input type="file" name="news_photo">
						</div>
						<div class="form-group">
							<label for="empno_no">���u�s��</label><input type="text"
								class="form-control" name="emp_no"
								value="<%=(newsVO == null) ? "EM00000002" : newsVO.getEmp_no()%>" />
						</div>
						<div class="modal-footer">
							<%-- <button type="button" class="btn btn-default"
								data-dismiss="modal">���}</button> --%>
							<input type="hidden" name="action" value="insert">
							<button type="submit" class="btn btn_cooper" value="�e�X�s�W">�e�X�s�W</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- �����Х��̷s���� ================================================================================== -->
	<!-- �H�W�O�A�i�H�񪺤��e ================================================================================== -->

	<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->