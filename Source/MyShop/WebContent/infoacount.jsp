<%@page import="entities.KhachHang"%>
<%@page import="dao.KhachHangDAOImpl"%>
<%@page import="dao.TaiKhoanDAOImpl"%>
<%@page import="entities.TaiKhoan"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Thông tin đăng nhập</title>
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
String  password_err = "", email_err = "", username = "", 
 Tenkh_err = "", DiaChi_err = "", SDT_err = "", NgaySinh_err = "";


	
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
	

	
	TaiKhoanDAOImpl taiKhoanDAO = new TaiKhoanDAOImpl();
	KhachHangDAOImpl khachHangDAO = new KhachHangDAOImpl();
	username = (String)session.getAttribute("username");
	TaiKhoan tk = taiKhoanDAO.getuserByUsername(username);
	KhachHang kh = khachHangDAO.getKhachHang(tk.getMaNd());
	
%>

<jsp:include page="header.jsp"></jsp:include>
<section id="form"><!--form-->
		<div class="container">
			<div class="row">
				<div class="col-sm-4">
					<div class="signup-form"><!--sign up form-->
						<h2>Thông tin tài khoản</h2>
						<form action="InfoAcountServlet" method="post">
							<span style="font-size:15px;">Tên đăng nhập</span>
							<input type="text" placeholder="Tên đăng nhập" name="username" value="<%=username%>"/>
							
							<p style="color:red"><%=email_err %></p>
							<span style="font-size:15px;">Email</span>
							<input type="email" placeholder="Email" name="email" value="<%=tk.getEmail()%>"/>
							
							<p style="color:red"><%=password_err %></p>
							<span style="font-size:15px;">Mật khẩu</span>
							<input type="password" placeholder="Mật khẩu" name="password" value="<%=tk.getMatKhau()%>"/>
							
							<p style="color:red"><%=Tenkh_err %></p>
							<span style="font-size:15px;">Họ tên</span>
							<input type="text" placeholder="Họ tên" name="TenKH" value="<%=kh.getTenKh()%>"/>
							
							<p style="color:red"><%=DiaChi_err %></p>
							<span style="font-size:15px;">Địa chỉ</span>
							<input type="text" placeholder="Địa chỉ" name="DiaChi" value="<%=kh.getDiaChi()%>"/>
							
							<p style="color:red"><%=SDT_err %></p>
							<span style="font-size:15px;">Điện thoại</span>
							<input type="text" placeholder="Điện thoại" name="SDT" value="<%=kh.getSdt()%>"/>
							
							<p style="color:red"><%=NgaySinh_err %></p>
							<span style="font-size:15px;">Ngày sinh</span>
							<input type="date" placeholder="Ngày sinh" name="NgaySinh" value="<%=kh.getNgSinh()%>"/>
							
							<button type="submit" class="btn btn-default">Cập nhật thông tin</button>
						</form>
					</div><!--/sign up form-->
				</div>
			</div>
		</div>
	</section><!--/form-->
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>