<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Đăng nhập</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/price-range.css" rel="stylesheet">
<link href="css/animate.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.scrollUp.min.js"></script>
<script src="js/price-range.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/main.js"></script>
</head>
<body>

<%
String username_err = "", password_err = "", email_err = "", username = "", 
err = "", Tenkh_err = "", DiaChi_err = "", SDT_err = "";


	if(request.getAttribute("username_err") != null){
		username_err = (String)request.getAttribute("username_err");
	}
	
	if(request.getAttribute("password_err") != null){
		password_err = (String)request.getAttribute("password_err");
	}
	
	if(request.getAttribute("email_err") != null){
		email_err = (String)request.getAttribute("email_err");
	}
	
	if(request.getAttribute("Tenkh_err") != null)
	{
		Tenkh_err = (String)request.getAttribute("Tenkh_err");
	}
	
	if(request.getAttribute("DiaChi_err") != null)
	{
		DiaChi_err = (String)request.getAttribute("DiaChi_err");
	}
	
	
	if(request.getAttribute("SDT_err") != null)
	{
		SDT_err = (String)request.getAttribute("SDT_err");
	}
	
	if(request.getAttribute("username") != null){
		err = (String)request.getAttribute("err");
	}
	
%>

<jsp:include page="header.jsp"></jsp:include>
<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-1">
					<div class="login-form"><!--login form-->
						<h2>Đăng nhập</h2>
						<form action="LoginServlet" method="post">
						<p style="color:red"><%=err %></p>
							<input type="text" placeholder="Nhập tên đăng nhập" name="username"/>
							<input type="password" placeholder="Mật khẩu" name="password"/>
							<button type="submit" class="btn btn-default">Đăng nhập</button>
						</form>
					</div><!--/login form-->
				</div>
				<div class="col-sm-1">
					<h2 class="or">OR</h2>
				</div>
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Tạo tài khoản mới</h2>
						<form action="RegisterServlet" method="post">
							<p style="color:red"><%=username_err %></p>
							<input type="text" placeholder="Tên đăng nhập" name="uname" value="<%=username%>"/>
							<p style="color:red"><%=email_err %></p>
							<input type="email" placeholder="Email" name="email"/>
							<p style="color:red"><%=password_err %></p>
							<input type="password" placeholder="Mật khẩu" name="password"/>
							<p style="color:red"><%=Tenkh_err %></p>
							<input type="text" placeholder="Họ tên" name="TenKH"/>
							<p style="color:red"><%=DiaChi_err %></p>
							<input type="text" placeholder="Địa chỉ" name="DiaChi"/>
							<p style="color:red"><%=SDT_err %></p>
							<input type="text" placeholder="Điện thoại" name="SDT"/>
							<button type="submit" class="btn btn-default">Đăng ký</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
</body>
</html>