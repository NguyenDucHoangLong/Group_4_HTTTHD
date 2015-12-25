package entities;


import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "LoaiKH")
public class LoaiKh{

	private int maCapBac;
	private String tenCapBac;
	private float chietKhau;
	private Date ngayApDung;


	public LoaiKh() {
	}

	public LoaiKh(int maCapBac) {
		this.maCapBac = maCapBac;
	}

	public LoaiKh(int maCapBac, String tenCapBac, float chietKhau, Date ngayApDung) {
		this.maCapBac = maCapBac;
		this.tenCapBac = tenCapBac;
		this.chietKhau = chietKhau;
		this.ngayApDung = ngayApDung;
	}

	@Id

	@Column(name = "MaCapBac", unique = true, nullable = false)
	public int getMaCapBac() {
		return this.maCapBac;
	}

	public void setMaCapBac(int maCapBac) {
		this.maCapBac = maCapBac;
	}

	@Column(name = "TenCapBac")
	public String getTenCapBac() {
		return this.tenCapBac;
	}

	public void setTenCapBac(String tenCapBac) {
		this.tenCapBac = tenCapBac;
	}

	@Column(name = "ChietKhau", precision = 53, scale = 0)
	public float getChietKhau() {
		return this.chietKhau;
	}

	public void setChietKhau(float chietKhau) {
		this.chietKhau = chietKhau;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayApDung", length = 10)
	public Date getNgayApDung() {
		return this.ngayApDung;
	}

	public void setNgayApDung(Date ngayApDung) {
		this.ngayApDung = ngayApDung;
	}

}
