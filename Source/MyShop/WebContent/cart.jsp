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
<title>Giỏ hàng</title>
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
		<div class="breadcrumbs">
			<ol class="breadcrumb">
				<li><a href="index.jsp">Trờ về</a></li>
				<li class="active">Giỏ hàng</li>
			</ol>
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
								<a href=""><%=entry.getKey().getTenSp() %></a>
							</h4>
							<p>Mã sản phẩm: <%=entry.getKey().getMaSp() %></p>
						</td>
						<td class="cart_price">
							<p>$<%=entry.getKey().getGiaBan() %></p>
						</td>
						<td class="cart_quantity">
							<div class="cart_quantity_button">
								<a class="cart_quantity_up"
								 href="CartServlet?command=addItem&product_id=<%=entry.getKey().getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"> 
								 + </a> <input
									class="cart_quantity_input" type="text" name="quantity"
									value="<%=entry.getValue()%>" autocomplete="off" size="2" disabled="disabled"> <a
									class="cart_quantity_down" href="CartServlet?command=subItem&product_id=<%=entry.getKey().getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"> - </a>
							</div>
						</td>
						<td class="cart_total">
							<p class="cart_total_price"><%=entry.getValue() * entry.getKey().getGiaBan() %></p>
						</td>
						<td class="cart_delete"><a class="cart_quantity_delete"
							href="CartServlet?command=removeItem&product_id=<%=entry.getKey().getMaSp()%>&cartID=<%=System.currentTimeMillis()%>"><i class="fa fa-times"></i></a></td>
					</tr>

					<%
						}
					%>
					<tr>
					    <td>
							<a class="btn btn-default update" href="index.jsp">Tiếp tục mua hàng</a>
					    </td>
					    <td>
							<a class="btn btn-default update" href="CartServlet?command=cancelItem&product_id=0&cartID=<%=System.currentTimeMillis()%>">Hủy đơn hàng</a>
					    </td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	</section>
	<!--/#cart_items -->
	<section id="do_action">
	<div class="container">
		<div class="heading">
			<h3>What would you like to do next?</h3>
			<p>Choose if you have a discount code or reward points you want
				to use or would like to estimate your delivery cost.</p>
		</div>
		<div class="row">
			<div class="col-sm-6">
				<div class="chose_area">
					<ul class="user_option">
						<li><input type="checkbox"> <label>Use Coupon
								Code</label></li>
						<li><input type="checkbox"> <label>Use Gift
								Voucher</label></li>
						<li><input type="checkbox"> <label>Estimate
								Shipping & Taxes</label></li>
					</ul>
					<ul class="user_info">
						<li class="single_field"><label>Country:</label> <select>
								<option>United States</option>
								<option>Bangladesh</option>
								<option>UK</option>
								<option>India</option>
								<option>Pakistan</option>
								<option>Ucrane</option>
								<option>Canada</option>
								<option>Dubai</option>
						</select></li>
						<li class="single_field"><label>Region / State:</label> <select>
								<option>Select</option>
								<option>Dhaka</option>
								<option>London</option>
								<option>Dillih</option>
								<option>Lahore</option>
								<option>Alaska</option>
								<option>Canada</option>
								<option>Dubai</option>
						</select></li>
						<li class="single_field zip-field"><label>Zip Code:</label> <input
							type="text"></li>
					</ul>
					<a class="btn btn-default update" href="">Get Quotes</a> <a
						class="btn btn-default check_out" href="">Continue</a>
				</div>
			</div>
			<div class="col-sm-6">
				<div class="total_area">
					<ul>
						<li>Cart Sub Total <span>$59</span></li>
						<li>Eco Tax <span>$2</span></li>
						<li>Shipping Cost <span>Free</span></li>
						<li>Total <span>$61</span></li>
					</ul>
					<a class="btn btn-default update" href="">Cập nhật</a> <a
						class="btn btn-default check_out" href="">Xác nhận thanh toán</a>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!--/#do_action -->

</body>
</html>