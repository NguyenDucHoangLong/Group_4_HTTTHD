package dao;

import java.util.List;

import entities.GiaSach;

public interface GiaSachDAO {
	public void ThemGiaSach(GiaSach giaSach);
	
	public List<GiaSach> FindAll();
	
	public List<GiaSach> ListGiaSachByMaKH(int maKH);
	
	public void DeleteGiaSachs(int maKH);
	
	public void DeleteGiaSach(int maKH, int maSP);
	
	public boolean checkGiaSach(int maKH, int maSP);
}
