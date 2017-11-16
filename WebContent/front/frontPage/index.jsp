<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.mem.model.*"%>
<%
  MemVO memVO = (MemVO) session.getAttribute("memVO");
%>
 
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/images/houselogo1.png" />
    <title>For House</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/front/css_front/main.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
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

</head>

<body>
    <div class="container-fluid backgroundpng">
        <img class="row" src="<%=request.getContextPath()%>/images/fixed_bg.png">
    </div>
    
    <nav class="navbar navbar-fixed-top">
        <jsp:include page="/front/frontPage/navbar.jsp" />
    </nav>
    
    <!-- 燈箱內容 -->
    <div class="modal fade" id="joinUs">
		<div class="modal-dialog">
			<div class="modal-content">
			<div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-center">好房事歡迎您的加入</h4>
            </div>
				<div>
					<div class="form-group"> </div>
				    <div class="joinbtn">
				        <a class="btn btn-info btn-lg btn-block" href="<%=request.getContextPath()%>/front/realtor/register.jsp" role="button"><h3>我  是  房  仲</h3></a>
				    </div>
				    <div class="form-group"> </div>
				    <div class="joinbtn">
				        <a class="btn btn-info btn-lg btn-block" href="seller/register.jsp" role="button"><h3>我  是  廠  商</h3></a>
				    </div>
				</div>
			</div>
		</div>
	</div>
	<!-- 燈箱內容  結束-->
    
    <div id="myCarousel" class="carousel slide " data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="<%=request.getContextPath()%>/images/furniture_ad1.jpeg" alt="Image">
                <div class="carousel-caption">
                    <h3>Image1</h3>
                    <p>something</p>
                </div>
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/images/furniture_ad2.jpeg" alt="Image">
                <div class="carousel-caption">
                    <h3>Image2</h3>
                    <p>more</p>
                </div>
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/images/furniture_ad7.jpg" alt="Image">
                <div class="carousel-caption">
                    <h3>Image3</h3>
                    <p>more.</p>
                </div>
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/images/furniture_ad3.jpeg" alt="Image">
                <div class="carousel-caption">
                    <h3>Image4</h3>
                    <p>more..</p>
                </div>
            </div>
            <div class="item">
                <img src="<%=request.getContextPath()%>/images/furniture_ad4.jpeg" alt="Image">
                <div class="carousel-caption">
                    <h3>Image5</h3>
                    <p>more...</p>
                </div>
            </div>
            <div class="searchbar col-sm-5 col-sm-offset-3">
                <form class="search">
                    <div class="input-group">
                        <span class="input-group-btn">
                                <!-- <div class="dropdown"> -->
                                    <a href="#" class="btn btn-info dropdown-toggle search-filter" data-toggle="dropdown">台北市 <b class="caret"></b></a>
                                    <ul class="dropdown-menu">
                                        <li><a href="#">松山區</a></li>
                                        <li><a href="#">大安區</a></li>
                                        <li><a href="#">中正區</a></li>
                                        <li><a href="#">大同區</a></li>
                                        <li><a href="#">中山區</a></li>
                                        <li><a href="#">萬華區</a></li>
                                        <li><a href="#">士林區</a></li>
                                        <li><a href="#">北投區</a></li>
                                        <li><a href="#">內湖區</a></li>
                                        <li><a href="#">南港區</a></li>
                                        <li><a href="#">文山區</a></li>
                                        <li><a href="#">台灣大學</a></li>

                                    </ul>
                                <!-- </div> -->
                              </span>

                        <input type="text" class="form-control" placeholder= "關鍵字、學校、街道">
                        <div class="input-group-btn">

                            <button class="btn btn-default search-form-btn" type="submit">
                                <!-- <span class="button-text ">找房子 </span> -->
                                <i class="glyphicon glyphicon-search"></i>
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    </div>


    <div class="searchSRS">
        <div class="container">
            <div class="col-xs-12 col-sm-4 ina">
                <a href="#">
                    <div class="imgbox">
                        <img src="<%=request.getContextPath()%>/images/SearchHouse.jpg">
                        <div class="text-center textbox">
                            <div class="textbackground ">
                                <h3 class="textinline"><b>找 房 子<b></h3></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-12 col-sm-4 ina">
                <a href="#">
                    <div class="imgbox">
                        <img src="<%=request.getContextPath()%>/images/realtor.jpeg">
                        <div class="text-center textbox">
                            <div class="textbackground ">
                                <h3 class="textinline"><b>找 房 仲<b></h3></div>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col-xs-12 col-sm-4 ina">
                <a href="#">
                    <div class="imgbox">
                        <img src="<%=request.getContextPath()%>/images/Home-Sofa-2.jpg">
                        <div class="text-center textbox">
                            <div class="textbackground ">
                                <h3 class="textinline"><b>找 傢 俱<b></h3></div>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="jumbotron furnitureAd">

            <img src="<%=request.getContextPath()%>/images/furniture_ad6.jpg">

    </div>
    <div class="news">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-4">
                    <div class="redNote">
                    </div>
                    <div class="newss text-center">
                        <h3><b>房市新聞</b></h3>
                        <div class="text-left textfix">
                            <ul>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, minima.</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis, recusandae!</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, soluta?</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat, neque.</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, tenetur?</a></li>
                                <br>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="redNote">
                    </div>
                    <div class="newss text-center">
                        <h3><b>促銷資訊</b></h3>
                        <div class="text-left textfix">
                            <ul>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, minima.</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis, recusandae!</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, soluta?</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat, neque.</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, tenetur?</a></li>
                                <br>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <div class="redNote">
                    </div>
                    <div class="newss text-center">
                        <h3><b>系統公告</b></h3>
                        <div class="text-left textfix">
                            <ul>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Omnis, minima.</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis, recusandae!</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fugiat, soluta?</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat, neque.</a></li>
                                <br>
                                <li><a href="#">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Libero, tenetur?</a></li>
                                <br>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mobileBar jumbotron">
        
            <img src="<%=request.getContextPath()%>/images/mobileBar.jpg">
       
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