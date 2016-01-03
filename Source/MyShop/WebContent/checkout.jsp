<%@page import="javax.swing.JOptionPane"%>
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
		//JOptionPane.showMessageDialog(null, cart);
	%>
	<h1>Chua null</h1>
	<% 
		if (cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		TreeMap<SanPham, Integer> list = cart.getListProduct();
		
		%>

	<jsp:include page="header.jsp"></jsp:include>

	<section id="cart_items">
	<div class="container">
<div class="review-payment">
			<h2>Thông tin đơn hàng</h2>
		</div>

		<div class="table cart_info">
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

					String username = (String)session.getAttribute("username");
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
		<%-- <h1>this is <%=list.entrySet().toArray().toString() %></h1> --%>
		<div class="shopper-informations">
			<div class="row">
				<div class="col-sm-3">
					<div class="shopper-info">
					
				<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post"> 
					<%
					int dem=0;
					for (Map.Entry<SanPham, Integer> entry : list.entrySet()){
						dem++;
						%>
						<input type="hidden" name="item_name_<%=dem%>" value="<%= entry.getKey().getMaSp()%>">
						<input type="hidden" name="quantity_<%=dem%>" value="<%= entry.getValue()%>">
						<input type="hidden" name="amount_<%=dem%>" value="<%=entry.getKey().getGiaBan()* 0.000044%>">
						<% } %>
						   <input type="hidden" name="cmd" value="_cart">
            <input type="hidden" name="rm" value="2">
                <input type="hidden" name="business" value="htnamitus-facilitator@gmail.com">
				
            <input type="hidden" name="return" value="http://localhost:8080/MyShop/PaypalResponse.jsp">
                <input type="hidden" name="cancel_return" value="http://localhost:8080/MyShop/PaypalResponseCancel.jsp">
                <input type="hidden" name="upload" value="1">
                <input type="image" name="submit" border="0" src="https://www.paypal.com/en_US/i/btn/btn_buynow_LG.gif" alt="PayPal - The safer, easier way to pay online">
                <img alt="" border="0" width="1" height="1" src="https://www.paypal.com/en_US/i/scr/pixel.gif">
        </form>	
				<a href="http://localhost:8080/MyShop/PaypalResponse.jsp">Test Thanh Toan</a>
					</div>
				</div>


			</div>
		</div>
		
	</div>
	</section>
	<!--/#cart_items-->



	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>