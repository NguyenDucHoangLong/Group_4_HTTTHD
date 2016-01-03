package dao;

import entities.DonHang;

public interface DonHangDAO {
	public void themDonHang(DonHang dh);
	public DonHang getDonHang(int id);
	public DonHang getDonHangMoiNhat();
	public DonHang getDonHangMoiNhat(int MaKH);
}
