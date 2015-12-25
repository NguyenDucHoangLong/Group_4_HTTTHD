
<%@page import="entities.SanPham"%>
<%@page import="java.util.List"%>
<%@page import="dao.SanPhamDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Chi tiết sản phẩm</title>
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
		SanPhamDAOImpl sanphamDAO = new SanPhamDAOImpl();
		String maSP = request.getParameter("product_id");
		int msp = Integer.parseInt(maSP);
		int maDanhMuc = sanphamDAO.getProduct(msp).getDanhMuc();
	%>
	<jsp:include page="header.jsp"></jsp:include>
<%-- 	<jsp:include page="slider.jsp"></jsp:include> --%>
	<section>
	<div class="contatiner">
		<div class="row">
			<jsp:include page="category.jsp"></jsp:include>
			<div class="col-sm-9 padding-right">
				<div class="product-details">
					<!--product-details-->
					<div class="col-sm-5">
						<div class="view-product">
							<img src="images/home/<%=sanphamDAO.getProduct(msp).getHinhAnh() %>" alt="" width="180px" height="370px"/>
						</div>
					</div>
					<div class="col-sm-7">
						<div class="product-information">
							<!--/product-information-->
<!-- 							<img src="images/product-details/new.jpg" class="newarrival" -->
<!-- 								alt="" /> -->
							<h2>
							<%=sanphamDAO.getProduct(msp).getTenSp()%></h2>
							<p>Mã sản phẩm:<%=msp %></p>
							<img src="images/product-details/rating.png" alt="" /> <span>
								<span><%=sanphamDAO.getProduct(msp).getGiaBan()%> VNĐ</span>
								<button type="button" class="btn btn-fefault cart">
									<i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng
								</button>
							</span>
							<span>Nhà sản xuất:<%=sanphamDAO.getProduct(msp).getNhaSanXuat() %></span><br/>
							<span>Số lượng hiện còn: <%=sanphamDAO.getProduct(msp).getSlton() %></span>
							<a href=""><img src="images/product-details/share.png"
								class="share img-responsive" alt="" /></a>
						</div>
						<!--/product-information-->
					</div>
				</div>
				<!--/product-details-->

				<div class="category-tab shop-details-tab">
					<!--category-tab-->
					<div class="col-sm-12">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#details" data-toggle="tab">Thông tin</a></li>
<!-- 							<li><a href="#companyprofile" data-toggle="tab">Thông tin</a></li> -->
                            <li><a href="#reviews" data-toggle="tab">Đánh giá</a></li>
							<li><a href="#tag" data-toggle="tab">Sản phẩm liên quan</a></li>
						</ul>
					</div>
					<div class="tab-content">
						<div class="tab-pane fade active in" id="details">
							<%=sanphamDAO.getProduct(msp).getMoTa()%>
						</div>

						<% List<SanPham> lst = sanphamDAO.getListProductByCategory(maDanhMuc); 
						   int i = 0;
						%>
						<div class="tab-pane fade" id="tag">
						<% for(SanPham sp : lst){ %>
							<div class="col-sm-3">
								<div class="product-image-wrapper">
									<div class="single-products">
										<div class="productinfo text-center">
											<img src="images/home/<%=sp.getHinhAnh() %>" alt="" />
											<h2><%=sp.getGiaBan()%> Đ </h2>
											<p><%=sp.getTenSp() %></p>
											<button type="button" class="btn btn-default add-to-cart">
												<i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng
											</button>
										</div>
									</div>
								</div>
							</div>
							<%
							i++;
						if(i > 3){
							break;
						}	
						} %>
						</div>
		
						<div class="tab-pane fade" id="reviews">
							<div class="col-sm-12">
								<ul>
									<li><a href=""><i class="fa fa-user"></i>EUGEN</a></li>
									<li><a href=""><i class="fa fa-clock-o"></i>12:41 PM</a></li>
									<li><a href=""><i class="fa fa-calendar-o"></i>31 DEC
											2014</a></li>
								</ul>
								<p></p>
								<p>
									<b>Đánh giá của bạn</b>
								</p>

								<form action="#">
									<span> <input type="text" placeholder="Your Name" /> <input
										type="email" placeholder="Email Address" />
									</span>
									<textarea name=""></textarea>
									<b>Rating: </b> <img src="images/product-details/rating.png"
										alt="" />
									<button type="button" class="btn btn-default pull-right">
										Submit</button>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>