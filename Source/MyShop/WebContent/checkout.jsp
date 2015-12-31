<%@page import="entities.SanPham"%>
<%@page import="entities.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Xác nhận thanh toán</title>
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
		Cart cart = (Cart) session.getAttribute("cart");
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<SanPham, Integer> list = cart.getListProduct();
	%>

	<jsp:include page="header.jsp"></jsp:include>

	<section id="cart_items">
	<div class="container">

		<div class="shopper-informations">
			<div class="row">
				<div class="col-sm-3">
					<div class="shopper-info">
						<p>Thông tin giao hàng</p>
						<form action="CheckOutServlet" method="post">
							<input type="text" placeholder="Địa chỉ giao hàng" name="dia_chi">
							<input type="text" placeholder="Điện thoại liên hệ"
								name="dien_thoai">
							<button type="submit" class="btn btn-primary">Xác nhận
								thanh toán</button>
						</form>
						<a class="btn btn-primary" href="CartServlet?command=cancleItem">Hủy
							đơn hàng</a>
					</div>
				</div>


			</div>
		</div>
		<div class="review-payment">
			<h2>Thông tin đơn hàng</h2>
		</div>

		<div class="table-responsive cart_info">
			<table class="table table-condensed">
				<thead>
					<tr class="cart_menu">
						<td class="image">Tên sản phẩm</td>
						<td class="description"></td>
						<td class="price">Giá bán</td>
						<td class="quantity">Số lượng</td>
						<td class="total">Thành tiền</td>
						<td></td>
					</tr>
				</thead>
				<tbody>
					<%
						for (Map.Entry<SanPham, Integer> entry : list.entrySet()) {
					%>
					<tr>
						<td class="cart_product"><a href=""><img
								src="images/home/<%=entry.getKey().getHinhAnh() %>" alt=""></a></td>
						<td class="cart_description">
							<h4>
								<a href=""><%=entry.getKey().getTenSp()%></a>
							</h4>
							<p>
								Mã sản phẩm:
								<%=entry.getKey().getMaSp()%></p>
						</td>
						<td class="cart_price">
							<p><%=entry.getKey().getGiaBan()%></p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button">
								<a class="cart_quantity_up"
									href="CartServlet?command=addItem&product_id=<%=entry.getKey().getMaSp()%>&cartID=<%=System.currentTimeMillis()%>">
									+ </a> <input class="cart_quantity_input" type="text"
									name="quantity" value="<%=entry.getValue()%>"
									autocomplete="off" size="2" disabled="disabled"> <a
									class="cart_quantity_down"
									href="CartServlet?command=subItem&product_id=<%=entry.getKey().getMaSp()%>&cartID=<%=System.currentTimeMillis()%>">
									- </a>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price"><%=entry.getValue() * entry.getKey().getGiaBan()%></p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href="CartServlet?command=removeItem&product_id=<%=entry.getKey().getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"><i
								class="fa fa-times"></i></a></td>
					</tr>

					<%
						}
					%>

				</tbody>
			</table>
		</div>

	</div>
	</section>
	<!--/#cart_items-->



	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>