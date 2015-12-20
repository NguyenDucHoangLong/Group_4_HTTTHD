package test;
import java.util.List;

import dao.DanhMucDAOImpl;
import entities.DanhMuc;


public class test {

	public static void main(String[] args) {
		DanhMucDAOImpl danhmucDAO = new DanhMucDAOImpl();
		System.out.println(danhmucDAO.getCategoryById(1).getTenDanhMuc());
		
		List<DanhMuc> lstdm = danhmucDAO.getCategoryByParent();
		for (DanhMuc dm : lstdm) {
			System.out.println(dm.getTenDanhMuc());
		}

	}

}
