<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
  MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
<!DOCTYPE HTML>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <!-- 神奇小按鈕的script 開始-->
    <script>
        $(document).ready(function() {
            $("#magicBtn1").click(function() {
                $("#loginid").val("abc@gmail.com");
                $("#password").val("123456");
            });
            $("#magicBtn2").click(function() {
                $("#mem_id").val("abc@gmail.com");
                $("#password1").val("123456");
                $("#password2").val("123456");
                $("#mem_name").val("大大");
                $("#mem_addr").val("中壢市中大路300號");
                $("#fancy-checkbox-info").attr("checked","enable");
                $("#aggrement2").attr("checked","enable");
            });
        });
    </script>
    <!-- 神奇小按鈕的script 結束-->

    <style type="text/css">
    body {
        font-family: Arial, Verdana, Helvetica, "LiHei Pro Medium", 微軟正黑體, sans-serif;
    }

    .imgbox {
        position: relative;
        z-index: -1;
        height: 20em;
        width: 20em;
    }

    .ina:hover {
        opacity: 0.85;
    }

    .imgbox img {
        position: relative;
        z-index: -10;
        max-height: 100%;
        box-shadow: 1px 1px 1px #bdbdbd;
    }

    .textbox {
        position: absolute;
        top: 0;
        z-index: 11;
        padding-top: 10em;
        width: 90%;
        height: 100%;
        text-align: center;
    }

    .textbackground {
        background-color: #ffd600;
        height: 3em;
        box-shadow: 1px 1px 1px grey;
        opacity: 0.8;
    }

    .textinline {
        /* height: 3em;*/
        position: relative;
        z-index: 5;
        opacity: 1;
        margin-top: -0.5em;
        line-height: 2;
    }

    .searchSRS {
        margin-top: 8em;
    }

    .furnitureAd {
        margin-top: 8em;
    }

    .furnitureAd>img {
        max-height: 100%;
        max-width: 100%;
    }

    .news {
        margin-top: 8em;
    }

    .redNote {
        position: relative;
        z-index: 3;
        height: 2em;
        width: 6em;
        margin-left: 9.7em;
        margin-right: 10em;
        background-color: red;
    }

    .newss {
        position: relative;
        z-index: 1;
        margin-top: -2.5em;
        background-color: #fff9c4;
    }

    .newss h3 {
        padding-top: 1.5em;
    }

    ul {
        list-style-type: none;
    }

    .textfix {
        margin-left: -15px;
    }
    .textfix ul{
        padding-bottom: 2em;
    }
    .mobileBar {
        margin-top: 8em;
    }
    .mobileBar>img {
        max-height: 100%;
        max-width: 100%;
    }
    .headerBar{
    	width: 95em;
    }
    
    #loginArea{
    	width: 130px;
    }

    footer {
        background-color: white;
        padding-top: 4em;
    }

    .copyri {
        margin-top: 3em;
    }
    
    .box-width{
        width:520px;
        margin-left: 50px;
    }
    .margin-top{
        margin-top: 20px;
    }
    .searchstate{
        margin-left: 50px;
    }
    #searchrequire{
        font-size: 18px;
    }
    #aggrement{
        color: #999999;
    }

    #fancy-checkbox-info {
    display: none;
    }
    
    #loginDiv{
    	margin-top: 200px;
    }
    
    #loginform{
        
    }

    .searchstate{
        margin-left: 50px;
    }
    #searchrequire{
        font-size: 18px;
    }

    #fancy-checkbox-info {
        display: none;
    }

    #searchSwitch{
        margin-left: 110px;
        margin-top: 8px;
    }
    
    #aggrement{
        color: #999999;
        margin-left: 30px;
        margin-top: 20px;
    }
    
     #loginBtn{
        margin-left: 50px;
        width: 510px;
    }
    
    .inForm{
    	margin-left: 50px;
    	width: 560px;
    }
    
    .magicdiv{
        margin-top: 8px;
    }
   
    </style>

</head>
<body>
    <div class="container-fluid backgroundpng">
        <img class="row" src="images/fixed_bg.png">
    </div>
    <nav class="navbar navbar-fixed-top">
        <jsp:include page="/front/frontPage/navbar.jsp" />
    </nav>
    
    
    <div class="container" id="loginDiv">
    	<div class="row">
    		<div class="col-xs-10 col-sm-7 col-sm-offset-3">
                 <div class="panel panel-default">
					<div class="panel-heading">
			            <h4 class="text-center"><label class="control-label">登入</label></h4>
			        </div>
			        
				    <%-- 錯誤表列 --%>
				    <div class="panel-body text-center">
				    <c:if test="${not empty errorMsgs}">
						<font style="color:red">${errorMsgs}</font>
					</c:if>
						
                  	<form class="form-horizontal" action="loginCheck.do" method="post">
                        <div class="form-group margin-top">
                        	<div class="col-sm-10 inForm">
                            <input type="email" class="form-control loginform" id="loginid" name="mem_id" placeholder="帳號 (請輸入e-mail)">
                            </div>
                        </div>
                        <div class="form-group margin-top">
                        	<div class="col-sm-10 inForm">
                            <input type="password" class="form-control loginform" id="password" name="mem_psw" placeholder="密碼">
                            </div>
                        </div>
                        <div class="form-group margin-top" id="loginBtn">
                            <input type="submit" value="登入" class="btn btn-primary btn-lg btn-block">
                            <div class="col-sm-offset-10 col-sm-2 magicdiv">
                                <button type="button" class="btn btn-default btn-xs" id="magicBtn1">貼</button>
                            </div>
                        </div>
                  </form>
              </div>
          </div>
        </div>
      </div>
    </div>
    

    <footer class="container-fluid">
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
        </div></div>
        <div class="copyri text-center">
            <p><small>Copyright © 2017 For House</small></p>
        </div>
    </footer>


        <div class="modal fade" id="loginForm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title text-center">登入</h4>
                    </div>
                    <form class="form-horizontal" action="loginCheck.do" method="post">
                          <div class="form-group margin-top">
                              <input type="email" class="form-control box-width" id="loginid" name="ID" placeholder="帳號(請輸入email)">
                          </div>
                          <div class="form-group margin-top">
                              <input type="password" class="form-control box-width" id="password" name="Password" placeholder="密碼">
                          </div>
                          <div class="form-group">
                              <button type="button" class="btn btn-primary btn-lg btn-block box-width">登入</button>
                              <div class="col-sm-offset-10 col-sm-2">
                                  <button type="button" class="btn btn-default btn-xs" id="magicBtn1">貼</button>
                              </div>
                          </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="modal fade" id="registerForm">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="text-center"><label class="control-label">註冊會員</label></h4>
                    </div>
                    <form class="form-horizontal" action="insert" method="post">
                        <div class="form-group text-right">
                            <div class="col-sm-4">
                                <p id="formNote">注意:所有欄位都必須輸入</p>
                            </div>
                        </div>
                        <div class="form-group margin-top">
                            <input type="email" class="form-control box-width" id="mem_id" name="mem_id" placeholder="帳號(請輸入email)">
                        </div>
                        <div class="form-group margin-top">
                            <input type="password" class="form-control box-width" id="password1" name="mem_psw" placeholder="密碼">
                        </div>
                        <div class="form-group margin-top">
                            <input type="password" class="form-control box-width" id="password2" placeholder="確認密碼">
                        </div>
                        <div class="form-group margin-top">
                            <input type="text" class="form-control box-width" id="mem_name" name="mem_name" placeholder="姓名">
                        </div>
                        <div class="form-group margin-top">
                            <input type="text" class="form-control box-width" id="mem_addr" name="mem_addr" placeholder="地址">
                        </div>
                        <div class="[ form-group ]">
                            <input type="checkbox" name="search_state" id="fancy-checkbox-info" autocomplete="off"/>
                            <div class="[ btn-group ] magicbox">
                                <label for="fancy-checkbox-info" class="[ btn btn-info ]">
                                    <span class="[ glyphicon glyphicon-ok ]"></span>
                                    <span> </span>
                                </label>
                                <label for="fancy-checkbox-info" class="[ btn btn-default active ]">
                                   	我願意公開我的找房狀態，讓房仲能主動找到我
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                          <div class="col-sm-offset-1 col-sm-11"  id="aggrement">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="aggrement" id="aggrement2"> 
                                	  若要繼續註冊，請先閱讀並同意好房事的<a href="">服務條款</a> & <a href="">隱私權政策</a>
                                </label>
                              </div>
                          </div>
                        </div>
                          <div class="form-group">
                              <button type="button" class="btn btn-primary btn-lg btn-block box-width">註冊</button>
                              <div class="col-sm-offset-10 col-sm-2">
                                  <button type="button" class="btn btn-default btn-xs" id="magicBtn2">貼</button>
                              </div>
                          </div>
                    </form>

                </div>
            </div>
        </div>

</body>
</html>