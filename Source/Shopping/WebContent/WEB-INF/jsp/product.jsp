<%@page import="entities.*"%>
<%@page import="dao.DanhMucDAOImpl"%>
<%@page import="dao.SanPhamDAO"%>
<%@page import="entities.SanPham"%>
<%@page import="dao.SanPhamDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		SanPhamDAOImpl sanphamDAO = new SanPhamDAOImpl();
		DanhMucDAOImpl danhmucDAO = new DanhMucDAOImpl();
		String maDanhMuc = request.getParameter("category_id");

		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
	%>
	<div class="col-sm-9 padding-right">
		<div class="features_items">
			<!--features_items-->
			<%
				if (maDanhMuc == null) {
			%>
			<h2 class="title text-center">Sản phẩm</h2>
			<%
				for (SanPham list : sanphamDAO.getListProduct()) {
			%>
			<div class="col-sm-4">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="images/home/<%=list.getHinhAnh()%>" alt=""
								width="180px" height="370px" />
							<h2><%=list.getGiaBan()%>
								Đ
							</h2>
							<p><%=list.getTenSp()%></p>
							<a
								href="CartServlet?command=insertItem&product_id=<%=list.getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"
								class="btn btn-default add-to-cart"><i
								class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</a>
						</div>
					</div>
					<div class="choose">
						<ul class="nav nav-pills nav-justified">
							<li><a href="#"><i class="fa fa-plus-square"></i>Thêm
									vào yêu thích</a></li>
							<li><a href="detail.jsp?product_id=<%=list.getMaSp()%>"><i
									class="fa fa-plus-square"></i>Xem Chi tiết</a></li>
						</ul>
					</div>
				</div>
			</div>
			<%
				}
				} else {
					String tenDanhMuc = danhmucDAO.getCategoryById(Integer.parseInt(maDanhMuc)).getTenDanhMuc();
			%>
			<h2 class="title text-center"><%=tenDanhMuc%></h2>
			<%
				for (SanPham sp : sanphamDAO.getListProductByCategory(Integer.parseInt(maDanhMuc))) {
			%>
			<div class="col-sm-4">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">
							<img src="images/home/<%=sp.getHinhAnh()%>" alt="" width="220px"
								height="300px" />
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
		<!--features_items-->
	</div>

</body>
</html>