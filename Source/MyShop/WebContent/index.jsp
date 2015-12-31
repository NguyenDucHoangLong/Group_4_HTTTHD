<%@page import="java.util.List"%>
<%@page import="entities.*"%>
<%@page import="dao.DanhMucDAOImpl"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="entities.SanPham"%>
<%@page import="dao.SanPhamDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>YOLO</title>
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
		DanhMucDAOImpl danhmucDAO = new DanhMucDAOImpl();
		String maDanhMuc = request.getParameter("category_id");
		SanPhamDAOImpl sanphamDAO = new SanPhamDAOImpl();
		List<SanPham> ds = null;
		
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		

	%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="slider.jsp"></jsp:include>
	<section>
	<div class="container">
		<div class="row">
			<jsp:include page="category.jsp"></jsp:include>

			<div class="col-sm-9 padding-right">
				<div class="features_items">
					<!--features_items-->
					<%
						if (maDanhMuc == null) {
							ds = sanphamDAO.getListProduct();
							String page1 = "", page2 = "";
							int start = 0;
							int end;
							if (ds.size() < 18) {
								end = 9;
							} else {
								end = ds.size();
							}
							if (request.getParameter("start") != null) {
								page1 = request.getParameter("start");
								start = Integer.parseInt(page1);
							}
							if (request.getParameter("end") != null) {
								page2 = request.getParameter("end");
								end = Integer.parseInt(page2);
							}
							List<SanPham> list  = sanphamDAO.getListProductByPagination(ds, start, end);
					%>
					<h2 class="title text-center">Danh sách sản phẩm</h2>
					<%
						for (SanPham p : list) {
					%>
					<div class="col-sm-4">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/home/<%=p.getHinhAnh()%>" alt="" />
									<h2><%=p.getGiaBan()%>
										Đ
									</h2>
									<p><%=p.getTenSp()%></p>
									<a
										href="CartServlet?command=insertItem&product_id=<%=p.getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"
										class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>

								</div>
							</div>
							<div class="choose">
								<ul class="nav nav-pills nav-justified">
									<li><a
									href="FavoriteServlet?command=insertItem&product_id=<%=p.getMaSp()%>"
									>
									<i class="fa fa-plus-square"></i>Thêm
											vào yêu thích</a></li>
									<li><a href="detail.jsp?product_id=<%=p.getMaSp()%>"><i
											class="fa fa-plus-square"></i>Xem Chi tiết</a></li>
								</ul>
							</div>
						</div>
					</div>
					<%
						}
						} else {
							String tenDanhMuc = danhmucDAO.getCategoryById(Integer.parseInt(maDanhMuc)).getTenDanhMuc();
							ds = sanphamDAO.getListProductByCategory(Integer.parseInt(maDanhMuc));
							String page1 = "", page2 = "";
							int start = 0;
							int end;
							if (ds.size() < 18) {
								end = 6;
							} else {
								end = ds.size();
							}
							if (request.getParameter("start") != null) {
								page1 = request.getParameter("start");
								start = Integer.parseInt(page1);
							}
							if (request.getParameter("end") != null) {
								page2 = request.getParameter("end");
								end = Integer.parseInt(page2);
							}
							List<SanPham> list  = sanphamDAO.getListProductByPagination(ds, start, end);
							
					%>
					<h2 class="title text-center"><%=tenDanhMuc%></h2>
					<%
						for (SanPham sp : list ) {
					%>
					<div class="col-sm-4">
						<div class="product-image-wrapper">
							<div class="single-products">
								<div class="productinfo text-center">
									<img src="images/home/<%=sp.getHinhAnh()%>" alt=""
										width="220px" height="300px" />
									<h2><%=sp.getGiaBan()%>
										Đ
									</h2>
									<p><%=sp.getTenSp()%></p>
									<a
										href="CartServlet?command=insertItem&product_id=<%=sp.getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"
										class="btn btn-default add-to-cart"><i
										class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
								</div>
								<div class="product-overlay">
									<div class="overlay-content">
										<h2><%=sp.getGiaBan()%>
											Đ
										</h2>
										<p><%=sp.getTenSp()%></p>
										<a
											href="CartServlet?command=insertItem&product_id=<%=sp.getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"
											class="btn btn-default add-to-cart"><i
											class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
									</div>
								</div>
							</div>
							<div class="choose">
								<ul class="nav nav-pills nav-justified">
									<li><a href="#"><i class="fa fa-plus-square"></i>Thêm
											vào yêu thích</a></li>
									<li><a href="detail.jsp?product_id=<%=sp.getMaSp()%>"><i
											class="fa fa-plus-square"></i>Xem Chi tiết</a></li>
								</ul>
							</div>
						</div>
					</div>
					<%
						}
						}
					%>
				</div>
				<ul class="pagination">
					<%
							int a, b;
							int limit = ds.size() / 6;
							if (limit * 6 < ds.size()) {
								limit += 1;
							}
							for (int i = 1; i <= limit; i++) {
								a = (i - 1) * 6;
								b = i * 6;
								if (b > ds.size()) {
									b = ds.size();
								}
						%>
					<li class="active"><a href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%></a></li>
					<%
							}
						%><li>
				</ul>
			</div>
			<!--features_items-->
		</div>
	</div>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>