package dao;

import java.util.Date;

import entities.KhachHang;

public interface KhachHangDAO {

	public void insertKhachHang(KhachHang kh);
	
	public KhachHang getKhachHang(int maKH);
	
	public KhachHang getMaxKhachHang();
	
	public void updateKhachHang(int makh, String tenkh, Date ngsinh, String gioitinh, String diachi, String SDT);
}
