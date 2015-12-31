package entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "CTDonHang", catalog = "QLWEBSITE")
public class CtdonHang{
	private int maCtdonHang;
	private int maDH;
	private int maSP;
	private Integer soLuong;
	private Double donGia;

	

	public CtdonHang() {
	}

	public CtdonHang(int maCtdonHang, int maDH, int maSP, Integer soLuong, Double donGia) {
		this.maCtdonHang = maCtdonHang;
		this.maDH = maDH;
		this.maSP = maSP;
		this.soLuong = soLuong;
		this.donGia = donGia;
	}
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "MaCTDonHang")
	public int getMaCtdonHang() {
		return maCtdonHang;
	}

	public void setMaCtdonHang(int maCtdonHang) {
		this.maCtdonHang = maCtdonHang;
	}

	@Column(name = "MaDH")
	public int getMaDH() {
		return maDH;
	}

	public void setMaDH(int maDH) {
		this.maDH = maDH;
	}
	
	@Column(name = "MaSP")
	public int getMaSP() {
		return maSP;
	}

	public void setMaSP(int maSP) {
		this.maSP = maSP;
	}

	
	@Column(name = "SoLuong")
	public Integer getSoLuong() {
		return this.soLuong;
	}

	public void setSoLuong(Integer soLuong) {
		this.soLuong = soLuong;
	}

	@Column(name = "DonGia", precision = 18, scale = 0)
	public Double getDonGia() {
		return this.donGia;
	}

	public void setDonGia(Double donGia) {
		this.donGia = donGia;
	}

}
