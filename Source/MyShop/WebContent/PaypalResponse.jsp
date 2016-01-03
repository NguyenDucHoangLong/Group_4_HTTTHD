<%@page import="dao.ChiTietDonHangImpl"%>
<%@page import="dao.KhachHangDAOImpl"%>
<%@page import="entities.KhachHang"%>
<%@page import="java.util.Date"%>
<%@page import="entities.CtdonHang"%>
<%@page import="entities.SanPham"%>
<%@page import="com.sun.xml.internal.ws.wsdl.writer.UsingAddressing"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entities.SanPham"%>
<%@page import="entities.DonHang"%>
<%@page import="dao.DonHangImpl"%>
<%@page import="entities.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<H1>Giao Dich Thanh Cong</H1>
<%
Cart cart = (Cart) session.getAttribute("cart");
DonHang donhang = (DonHang) session.getAttribute("donhang");
TreeMap<SanPham, Integer> list = cart.getListProduct();
Date date = new Date();
donhang.setNgayDat(date);
%> 
<h1><%= donhang.getNgayGiao() %></h1>
<h1><%= donhang.getNgayDat() %></h1>
<h1><%= donhang.getNguoiNhan()%></h1>
<h1><%= donhang.getSdt()%></h1>
<h1><%= donhang.getNgayGiao() %></h1>
<% 
KhachHangDAOImpl khImpl = new KhachHangDAOImpl();
//Lay Khach hang hien tai:
String username = session.getAttribute("username").toString();
KhachHang kh = khImpl.getKhachHangByUsername(username);
donhang.setKhachHang(kh);
DonHangImpl donhangIm = new DonHangImpl();
donhangIm.themDonHang(donhang);

//Them chi tiet don hang:
ChiTietDonHangImpl ctdhImpl = new ChiTietDonHangImpl();
for(Map.Entry<SanPham, Integer> entity : list.entrySet())
{
CtdonHang ctdh = new CtdonHang();
ctdh.setDonGia(entity.getKey().getGiaBan());
ctdh.setSanPham(entity.getKey());
ctdh.setSoLuong(entity.getValue());
ctdhImpl.themChiTietDonHang(ctdh);
}

//Refresh shopping cart:
session.removeAttribute("cart");
session.removeAttribute("donhang");
%>
</body>
</html>