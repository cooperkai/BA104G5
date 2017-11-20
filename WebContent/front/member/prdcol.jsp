<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	if (memVO == null) { // 如為 null, 代表此user未登入過 , 才做以下工作
		session.setAttribute("location", request.getRequestURI()); //*工作1 : 同時記下目前位置 , 以便於login.jsp登入成功後 , 能夠直接導至此網頁(須配合LoginHandler.java)
		response.sendRedirect(request.getContextPath() + "/login.jsp"); //*工作2 : 請該user去登入網頁(login.jsp) , 進行登入
		return;
	}
%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
<link rel="shortcut icon" href="images/houselogo1.png" />
<title>For House</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/main.css">
<script src="https://code.jquery.com/jquery.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
	body {
		font-family: Arial, Verdana, Helvetica, "LiHei Pro Medium", 微軟正黑體,	sans-serif;
	}
	#headerBar{
    	width: 95em;
    }
	/* 會員中心  開始  */
	.memtitle {
		margin-top: 70px;
	}
    .member_center{
      color: #00ADEE;
    }
    .areaOutter{
        margin-top:40px;
    }
    .areaInner{
        margin-top:20px;
    }
    /* 會員中心  結束  */
	
	
	/* 收藏商品的form */
    h3.panel-title {
        font-size: 24px;
    }
    .savebutton{
      width: 630px;
      margin-left: 15px;
      font-size: 18px;
    }
    .new-prd{
        margin: 20px;
    }
    .box-width{
      font-size: 20px;
      width:690px;
    }
	
</style>


<body>

<!-- 背景圖 -->
<div class="container-fluid backgroundpng">
	<img class="row" src="images/fixed_bg.png">
</div>

<!-- 上方的 header (navbar) -->
<nav class="navbar navbar-fixed-top">
	<jsp:include page="/front/frontPage/navbar.jsp" />
</nav>
    
    
<div class="col-xs-12 memtitle"><h2 class="text-center member_center">會員中心</h2></div>

<!-- 下方大區塊 start -->
<div class="container areaOutter">
	<div class="row areaOutter">
	
	<!-- include 左側選單區塊  開始-->
	<jsp:include page="leftpanel.jsp" />
	<!-- include 左側選單區塊  結束-->

	<!-- 右側頁面區塊  開始 -->
	<div class="col-xs-12 col-sm-8 areaInner">
		<div class="container">
			<div class="col-xs-5 col-sm-8">
				<div class="tab-content">
					
						<div class="panel panel-primary">
                                   <div class="panel-heading">
                                     <h3 class="panel-title text-center">收藏的商品</h3>
                                   </div>
                                   <form>
                                       <div class="form-group new-prd">
                                         <label for="exampleInputEmail1">商品類別</label>
                                         <select class="form-control opts">
                                           <option value="table">桌子</option>
                                           <option value="chair">椅子</option>
                                           <option value="cabinet">櫃子</option>
                                         </select>
                                       </div>
                                       <div class="form-group new-prd">
                                         <label for="exampleInputEmail1">商品名稱</label>
                                         <input type="text" class="form-control" id="prd_name" placeholder="商品名稱">
                                       </div>
                                       <div class="form-group new-prd">
                                         <label for="exampleInputPassword1">商品詳情</label>
                                         <input type="text" class="form-control" id="prd-detail" placeholder="商品詳情">
                                       </div>
                                       <div class="form-group new-prd">
                                       <label for="exampleInputPassword1">商品單價</label>
                                         <input type="text" class="form-control" id="prd_price" placeholder="商品單價">
                                       </div>
                                       <div class="form-group new-prd">
                                       <label for="exampleInputPassword1">商品數量</label>
                                         <input type="text" class="form-control" id="prd_stock" placeholder="商品數量">
                                       </div>
                                       <div class="form-group new-prd">
                                         <label for="exampleInputFile">請選擇商品圖片</label>
                                         <input type="file" id="prd_photo1">
                                       </div>
                                       <div class="checkbox new-prd">
                                         <button type="submit" class="btn btn-warning box-width">上架</button>
                                       </div>
                                     </form>
                                 </div>
					
				</div>
			</div>
		</div>
	</div>
	<!-- 右側頁面區塊結束 -->
	
	
	</div>
</div>
<!-- 下方大區塊 end -->

</body>

</html>