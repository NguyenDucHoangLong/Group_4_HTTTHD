package dao;
import java.util.List;

import entities.DanhMuc;

public interface DanhMucDao {
	public List<DanhMuc> getCategoryByParent();
	
	public List<DanhMuc> getCategoryByChildren(int parent);
	
	public DanhMuc getCategoryById(int maDanhMuc);
	
	
}
