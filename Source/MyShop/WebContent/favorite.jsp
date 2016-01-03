<%-- <%@page import="dao.SanPhamDAOImpl"%>
<%@page import="dao.KhachHangDAOImpl"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="entities.GiaSach"%>
<%@page import="java.util.List"%>
<%@page import="dao.GiaSachDAOImpl"%>
<%@page import="entities.TaiKhoan"%>
<%@page import="dao.TaiKhoanDAOImpl"%>
<%@page import="entities.SanPham"%>
<%@page import="entities.Cart"%>
<%@page import="java.util.TreeMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sản phẩm yêu thích</title>
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
	<section id="cart_items">
	<div class="container">
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="index.jsp">Trở về</a></li>
				<li class="active">Giá sách</li>
			</ol>
		</div>
		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">Tên sản phẩm</td>
						<td class="description">Thông tin</td>
						<td class="cart_price">Giá bán</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<%
						if(session.getAttribute("username") != null)
						{
							String username = (String)session.getAttribute("username");
							TaiKhoanDAOImpl taiKhoanDAO = new TaiKhoanDAOImpl();
							TaiKhoan tk = taiKhoanDAO.getuserByUsername(username);
							
							GiaSachDAOImpl giaSachDAO = new GiaSachDAOImpl();
							List<GiaSach> lst = giaSachDAO.ListGiaSachByMaKH(tk.getMaNd());
							
							SanPhamDAOImpl sanPhamDAO = new SanPhamDAOImpl();
						%>
					<%
				   	 for (GiaSach giaSach : lst) {
					%>
					<tr>
						<td class="cart_product"><a href=""><img
								src="images/home/<%=sanPhamDAO.getProduct(giaSach.getMaSP()).getHinhAnh() %>" alt=""></a></td>
						<td class="cart_description">
						<h4>
							<%=sanPhamDAO.getProduct(giaSach.getMaSP()).getTenSp() %>
						</h4>
						<br/>
					     <p class="fa fa-plus-square"></i><a 
					     href="CartServlet?command=insertItem&product_id=<%=sanPhamDAO.getProduct(giaSach.getMaSP()).getMaSp()%>&cartID=<%=System.currentTimeMillis()%>">Thêm
											vào giỏ hàng</a></p>
						</td>
						<td class="cart_price"><p class="cart_total_price"><%=sanPhamDAO.getProduct(giaSach.getMaSP()).getGiaBan() %> Đ</p></td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href="FavoriteServlet?command=removeItem&product_id=<%=sanPhamDAO.getProduct(giaSach.getMaSP()).getMaSp()%>"><i class="fa fa-times"></i></a></td>
					</tr>
					<%
				   	 }	}
					%>
					<tr>
						<td><a class="btn btn-default update" href="index.jsp">Tiếp
								tục mua hàng</a></td>
						<td><a class="btn btn-default update"  href="FavoriteServlet?command=cancelItem&product_id=0">Hủy giá
								sách</a></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</section>
	<!--/#cart_items -->

	<!--/#do_action -->
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html> --%>