<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.ann.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	AnnVO annVO = (AnnVO) request.getAttribute("annVO"); //AnnServlet.java(Concroller), �s�Jreq��annVO����
%>
<!-- ���include -->
<jsp:include page="/back/backend/backend_page.jsp" flush="true" />
<!-- ���include -->

<!-- �@�w�n�d��<div> ================================================================================== -->
<div class="col-xs-12 col-sm-10 maincontext">
<!-- �@�w�n�d��<div> ================================================================================== -->

<!-- �H�U�O�A�i�H�񪺤��e ================================================================================ -->
	<div class="container">
		<div class="row">
			<div class="col-xs-12 col-sm-12 table_bgcolor">
				<table class="table table-hover table_main">
					<caption class="title_pr">�d�ߨt�Τ��i</caption>
					<thead>
						<tr class="col_title">
							<th>���i�s��</th>
							<th>���i���D</th>
							<th>���i���e</th>
							<th>���i���A</th>
							<th>���i�ɶ�</th>
							<th>���u�s��</th>
						</tr>
					</thead>
					<tbody>
						<tr class="col_name">
							<td><%=annVO.getAnn_no()%></td>
							<td class="text_overflow"><%=annVO.getAnn_title()%></td>
							<td class="text_overflow"><%=annVO.getAnn_content()%></td>
							<td>
								<div class="dropdown">${annVO.ann_state}</div>
							</td>
							<td><%=annVO.getAnn_date()%></td>
							<td><%=annVO.getEmp_no()%></td>
						</tr>

					</tbody>
				</table>
				<table id="table-1">
					<tr>
						<td>
							<h4>
								<a href="<%=request.getContextPath()%>/back/ann/listAllAnn.jsp"><img
									src="<%=request.getContextPath()%>/images/back1.gif"
									width="100" height="32" border="0">�^�t�Τ��i</a>
							</h4>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
<!-- �H�W�O�A�i�H�񪺤��e ================================================================================== -->	
	
<!-- �@�w�n�d��</div> ================================================================================== -->
</div>
<!-- �@�w�n�d��</div> ================================================================================== -->