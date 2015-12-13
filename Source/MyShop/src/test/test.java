package test;

import java.util.List;

import dao.DanhMucDAOImpl;
import dao.SanPhamDAOImpl;
import dao.TaiKhoanDAOImpl;
import entities.SanPham;
import entities.TaiKhoan;

public class test {

	public static void main(String[] args) {

	
		TaiKhoanDAOImpl taikhoanDAO = new TaiKhoanDAOImpl();
		taikhoanDAO.insertUser(new TaiKhoan(0, "hoanglong1", "12345", true, "nguoidung", 0, "ndhlong1994@gmail.com"));
		

	}

}
