<%@page import="entities.DanhMuc"%>
<%@page import="dao.DanhMucDAOImpl"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		DanhMucDAOImpl danhmucDAO = new DanhMucDAOImpl();
	%>


	<div class="col-sm-3">
		<div class="left-sidebar">
			<h2>Danh mục</h2>
			<div class="panel-group category-products" id="accordian">
				<!--category-productsr-->
				<%
					for(DanhMuc lst: danhmucDAO.getCategoryByParent()){
				%>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordian"
								href="#sportswear"> <span class="badge pull-right"><i
									class="fa fa-plus1"></i></span> <%=lst.getTenDanhMuc()%>
							</a>
						</h4>
					</div>
					<%
						if (danhmucDAO.getCategoryByChildren(lst.getMaDanhMuc()).size() > 0) {
					%>
					<div id="sportswear1" class="panel-collapse collapse1">
						<div class="panel-body1">
							<ul>
								<%
									for (DanhMuc c2 : danhmucDAO.getCategoryByChildren(lst.getMaDanhMuc())) {
								%>
								<li><a href="index.jsp?category_id=<%=c2.getMaDanhMuc()%>"><%=c2.getTenDanhMuc()%>
								</a></li>
								<%
									}
								%>
							</ul>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<%
					}
				%>
			</div>
			<div class="brands_products"><!--brands_products-->
							<h2>Brands</h2>
							<div class="brands-name">
								<ul class="nav nav-pills nav-stacked">
									<li><a href="#"> <span class="pull-right">(50)</span>Acne</a></li>
									<li><a href="#"> <span class="pull-right">(56)</span>Grüne Erde</a></li>
									<li><a href="#"> <span class="pull-right">(27)</span>Albiro</a></li>
									<li><a href="#"> <span class="pull-right">(32)</span>Ronhill</a></li>
									<li><a href="#"> <span class="pull-right">(5)</span>Oddmolly</a></li>
									<li><a href="#"> <span class="pull-right">(9)</span>Boudestijn</a></li>
									<li><a href="#"> <span class="pull-right">(4)</span>Rösch creative culture</a></li>
								</ul>
							</div>
						</div><!--/brands_products-->
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
						
			<!--/category-products-->

			<!-- <div class="shipping text-center">
				<img src="images/home/shipping.jpg" alt="" />
			</div> -->

		</div>
	</div>
</body>
</html>