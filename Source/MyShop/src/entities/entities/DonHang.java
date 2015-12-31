package entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "DonHang", catalog = "QLWEBSITE")
public class DonHang{

	private int maDh;
	private int maKH;
	private Date ngayLap;
	private Date ngayGiao;
	private String diaChiGiao;
	private Integer tinhTrangDonHang;
	private Boolean daThanhToan;
	private double tongTien;


	public DonHang() {
	}

	public DonHang(int maDh) {
		this.maDh = maDh;
	}

	
	public DonHang(int maDh, int maKH, Date ngayLap, Date ngayGiao, String diaChiGiao, Integer tinhTrangDonHang,
			Boolean daThanhToan, double tongTien) {
		super();
		this.maDh = maDh;
		this.maKH = maKH;
		this.ngayLap = ngayLap;
		this.ngayGiao = ngayGiao;
		this.diaChiGiao = diaChiGiao;
		this.tinhTrangDonHang = tinhTrangDonHang;
		this.daThanhToan = daThanhToan;
		this.tongTien = tongTien;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "MaDH", unique = true, nullable = false)
	public int getMaDh() {
		return this.maDh;
	}

	public void setMaDh(int maDh) {
		this.maDh = maDh;
	}


	@Column(name = "MaKH")
	public int getKhachHang() {
		return this.maKH;
	}

	public void setKhachHang(int maKH) {
		this.maKH = maKH;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayLap", length = 10)
	public Date getNgayLap() {
		return this.ngayLap;
	}

	public void setNgayLap(Date ngayLap) {
		this.ngayLap = ngayLap;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayGiao", length = 10)
	public Date getNgayGiao() {
		return this.ngayGiao;
	}

	public void setNgayGiao(Date ngayGiao) {
		this.ngayGiao = ngayGiao;
	}

	@Column(name = "DiaChiGiao")
	public String getDiaChiGiao() {
		return this.diaChiGiao;
	}

	public void setDiaChiGiao(String diaChiGiao) {
		this.diaChiGiao = diaChiGiao;
	}

	@Column(name = "TinhTrangDonHang")
	public Integer getTinhTrangDonHang() {
		return this.tinhTrangDonHang;
	}

	public void setTinhTrangDonHang(Integer tinhTrangDonHang) {
		this.tinhTrangDonHang = tinhTrangDonHang;
	}

	@Column(name = "DaThanhToan")
	public Boolean getDaThanhToan() {
		return this.daThanhToan;
	}

	public void setDaThanhToan(Boolean daThanhToan) {
		this.daThanhToan = daThanhToan;
	}

	@Column(name = "TongTien", precision = 18, scale = 0)
	public double getTongTien() {
		return this.tongTien;
	}

	public void setTongTien(double tongTien) {
		this.tongTien = tongTien;
	}


}
