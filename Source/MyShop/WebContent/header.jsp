<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<div id="header">
		<!--header-->
		<div class="header_top">
			<!--header_top-->
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="contactinfo">
							<ul class="nav nav-pills">
								<li><a href="#"><i class="fa fa-phone"></i>01688653287</a></li>
								<li><a href="#"><i class="fa fa-envelope"></i>
										ndhlong1994@gmail.com</a></li>

							</ul>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="social-icons pull-right">
							<ul class="nav navbar-nav">
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<!-- <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
							<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
							 -->
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header_top-->

		<div class="header-middle">
			<!--header-middle-->
			<div class="container">
				<div class="row">
					<div class="col-sm-4">
						<div class="logo pull-left">
							<a href="index.jsp"><img src="images/home/logo1.jpg" alt=""
								width="50px" height="50px" />YOLO</a>
						</div>

						<div class="btn-group pull-right">
							<div class="btn-group">
							<% if(session.getAttribute("username") != null) {%>
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									Xin chào, <%=session.getAttribute("username") %><span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="infoacount.jsp">Sửa thông tin</a></li>
									<li><a href="LoginServlet?command=logout">
									Đăng xuất</a></li>
<%-- 									<%}else{ %> --%>
<!-- 									<li>Bạn chưa đăng nhập, nếu chưa có tài khoản tạo <a -->
<!-- 										href="/login.jsp">ở đây</a></li> -->
								</ul>
								<%} %>
							</div>

							<div class="btn-group">
								<button type="button"
									class="btn btn-default dropdown-toggle usa"
									data-toggle="dropdown">
									Tiếng việt <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="#">English</a></li>
							
								</ul>
							</div>
						</div>



					</div>
					<div class="col-sm-8">
						<div class="shop-menu pull-right">
							<ul class="nav navbar-nav">
							<% if(session.getAttribute("username") != null) {%>
								<li><a href="infoacount.jsp"><i class="fa fa-user"></i>Tài khoản</a></li>
								<%}else{ %>
								<li><a href="#"><i class="fa fa-user"></i>Tài khoản</a></li>
								<%} %>
								<li><a href="favorite.jsp"><i class="fa fa-star"></i>Sản phẩm yêu thích</a></li>
								<li><a href="checkout.jsp"><i class="fa fa-crosshairs"></i>
										Đơn hàng</a></li>
								<li><a href="cart.jsp"><i class="fa fa-shopping-cart"></i>
										Giỏ hàng</a></li>
								<li><a href="login.jsp"><i class="fa fa-lock"></i> Đăng
										nhập</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-middle-->

		<div class="header-bottom">
			<!--header-bottom-->
			<div class="container">
				<div class="row">
					<div class="col-sm-9">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="mainmenu pull-left">
							<ul class="nav navbar-nav collapse navbar-collapse">
								<li><a href="index.jsp" class="active">Trang chủ</a></li>
								<li class="dropdown"><a href="#">Sản phẩm<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="shop.html">Sách</a></li>
										<li><a href="product-details.html">Dụng cụ học tập</a></li>
										<li><a href="checkout.html">Đơn hàng</a></li>
										<li><a href="cart.jsp">Giỏ hàng</a></li>
										<li><a href="login.html">Đăng nhập</a></li>
									</ul></li>
								<li class="dropdown"><a href="#">Diễn đàn<i
										class="fa fa-angle-down"></i></a>
									<ul role="menu" class="sub-menu">
										<li><a href="blog.html">Facebook</a></li>
										<li><a href="blog-single.html">Blog</a></li>
									</ul></li>
								<!-- 	<li><a href="404.html">404</a></li> -->
								<li><a href="contact.jsp">Liên hệ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="search_box pull-right">
							<input type="text" placeholder="Search" />
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/header-bottom-->
	</div>
	<!--/header-->

</body>
</html>