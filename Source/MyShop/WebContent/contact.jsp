<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Liên hệ</title>
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

	<jsp:include page="header.jsp"></jsp:include>

	<div id="contact-page" class="container">
		<div class="bg">
			<div class="row">
				<div class="col-sm-12">
					<h2 class="title text-center">
						Liên hệ <strong>Với YOLO</strong>
					</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-8">
					<div class="contact-form">
						<h2 class="title text-center">NHẬP THÔNG TIN</h2>
						<div class="status alert alert-success" style="display: none"></div>
					<form id="main-contact-form" class="contact-form row"
							name="contact-form" method="post" action="SendMail">
							<div class="form-group col-md-6">
								<input type="text" name="name" class="form-control"
									required="required" placeholder="Tên">
							</div>
							<div class="form-group col-md-6">
								<input type="email" name="email" class="form-control"
									required="required" placeholder="Email">
							</div>
							<div class="form-group col-md-12">
								<input type="text" name="subject" class="form-control"
									required="required" placeholder="Tiêu đề">
							</div>
							<div class="form-group col-md-12">
								<textarea name="message" id="message" required="required"
									class="form-control" rows="8" placeholder="Nội dung email"></textarea>
							</div>
							<div class="form-group col-md-12">
								<input type="submit" name="submit"
									class="btn btn-primary pull-right" value="Gửi">
							</div>
						</form>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="contact-info">
						<h2 class="title text-center">THÔNG TIN LIÊN HỆ</h2>
						<address>
							<p>YOLO SHOP.</p>
							<p>Sản phẩm môn phân tích thiết kế phần mềm</p>
							<p>Hồ Chí Minh</p>
							<p>Mobile: 01688653287</p>
							<p>Fax: 1-714-252-0026</p>
							<p>Email: ndhlong1994@gmail.com</p>
						</address>
						<div class="social-networks">
							<h2 class="title text-center">MẠNG XÃ HỘI</h2>
							<ul>
								<li><a href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#"><i class="fa fa-google-plus"></i></a></li>
								<li><a href="#"><i class="fa fa-youtube"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--/#contact-page-->

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>