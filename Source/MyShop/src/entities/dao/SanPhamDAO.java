package dao;

import java.util.List;

import entities.SanPham;

public interface SanPhamDAO {
	public List<SanPham> getListProduct();
	
	public List<SanPham> getListProductByCategory(int maDanhMuc);
	
	public SanPham getProduct(int maSanPham);
	
	public List<SanPham> getListProductByPagination(List<SanPham> list,
			int start, int end);
}
