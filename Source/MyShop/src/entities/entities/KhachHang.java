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
@Table(name = "KhachHang")
public class KhachHang {

	private int maKh;
	private int loaiKh;
	private String tenKh;
	private Date ngSinh;
	private String gioiTinh;
	private String diaChi;
	private String sdt;
	private Integer diemTichLuy;

	public KhachHang() {
	}

	public KhachHang(int maKh) {
		this.maKh = maKh;
	}

	public KhachHang(int maKh, int loaiKh, String tenKh, Date ngSinh, String gioiTinh,
			String diaChi, String sdt, Integer diemTichLuy) {
		this.maKh = maKh;
		this.loaiKh = loaiKh;
		this.tenKh = tenKh;
		this.ngSinh = ngSinh;
		this.gioiTinh = gioiTinh;
		this.diaChi = diaChi;
		this.sdt = sdt;
		this.diemTichLuy = diemTichLuy;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "MaKH", unique = true, nullable = false)
	public int getMaKh() {
		return this.maKh;
	}

	public void setMaKh(int maKh) {
		this.maKh = maKh;
	}
	
	@Column(name = "LoaiKH")
	public int getLoaiKh() {
		return this.loaiKh;
	}

	public void setLoaiKh(int loaiKh) {
		this.loaiKh = loaiKh;
	}

	@Column(name = "TenKH")
	public String getTenKh() {
		return this.tenKh;
	}

	public void setTenKh(String tenKh) {
		this.tenKh = tenKh;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "NgSinh", length = 10)
	public Date getNgSinh() {
		return this.ngSinh;
	}

	public void setNgSinh(Date ngSinh) {
		this.ngSinh = ngSinh;
	}

	@Column(name = "GioiTinh")
	public String getGioiTinh() {
		return this.gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	@Column(name = "DiaChi")
	public String getDiaChi() {
		return this.diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	@Column(name = "SDT")
	public String getSdt() {
		return this.sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	@Column(name = "DiemTichLuy")
	public Integer getDiemTichLuy() {
		return this.diemTichLuy;
	}

	public void setDiemTichLuy(Integer diemTichLuy) {
		this.diemTichLuy = diemTichLuy;
	}


}
