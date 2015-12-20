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


	<div class="col-sm-2">
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
								<li><a href="index.html?category_id=<%=c2.getMaDanhMuc()%>"><%=c2.getTenDanhMuc()%>
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
			<!--/category-products-->

			<div class="shipping text-center">
				<img src="images/home/shipping.jpg" alt="" />
			</div>

		</div>
	</div>
</body>
</html>