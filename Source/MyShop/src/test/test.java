package test;



import java.text.ParseException;
import java.text.SimpleDateFormat;

import dao.DanhMucDAOImpl;
import dao.KhachHangDAOImpl;
import entities.KhachHang;


public class test {

	public static void main(String[] args) {

		//KhachHangDAOImpl khachhangDAO = new KhachHangDAOImpl();
		DanhMucDAOImpl danhmucDAO = new DanhMucDAOImpl();
		System.out.print(danhmucDAO.getCategoryById(1).getTenDanhMuc());
		//System.out.println(khachhangDAO.getMaxKhachHang().getTenKh());
		//SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
//		try {
//			khachhangDAO.insertKhachHang(new KhachHang(0, 1, "Lê Trí", formatter.parse("6/6/1994"), "Nam", "Quận 7", "12345", 100));
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}

	}

}
