package dao;

import entities.KhachHang;

public interface KhachHangDAO {

	public void insertKhachHang(KhachHang kh);
	
	public KhachHang getKhachHang(int maKH);
	
	public KhachHang getMaxKhachHang();
}
