<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '193615331198785',
				xfbml : false,
				version : 'v2.11'
			});
			FB.AppEvents.logPageView();
		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
		
		
		function testAPI() {
			console.log('Welcome!  Fetching your information.... ');
			FB.api('/me',function(response) {
								console.log('Successful login for: '
										+ response.name);
								document.getElementById('status').innerHTML = 'Thanks for logging in, '
										+ response.name+ response.email  +response.id+'!';
							});
			FB.api('/me/picture?type=large', function(response) {
				document.getElementById('status1').innerHTML = response.data.url;
			});
		}
			function fblogin(){	
				  //===實作(填入程式碼)
					var xhr=new XMLHttpRequest();
				  xhr.onreadystatechange=function(){
					  if(xhr.readyState==4){
						  if(xhr.status==200){
							  document.getElementById("IdShowPanel").innerHTML=xhr.responseText;
							  }
						  else{
							  alert(xhr.status);
							  }
						  }
					  }
				  
				  FB.api('/me',function(response) {
					  name=response.name;
					  email=response.email;
					  fbid=response.id;
//	 				  FB.api('/me/picture',function(response) {
//	 					  pic=response.data.url;
//	 				  });
				  });
				  //建立好Get連接與送出請求
					var url="<%=request.getContextPath()%>/mem/MemServlet?action=FBLogin&name="+name+"&email="+email+"&id="+fbid;
					xhr.open("Get",url,true);
					xhr.send(null);
				};
	</script>



</body>
</html>