package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "TaiKhoan")
public class TaiKhoan{

	private int id;
	private String tenTaiKhoan;
	private String matKhau;
	private Boolean trangThai;
	private int quyen;
	private Integer maNd;
	private String email;

	public TaiKhoan() {
	}

	public TaiKhoan(int id) {
		this.id = id;
	}

	public TaiKhoan(int id, String tenTaiKhoan, String matKhau, Boolean trangThai, int quyen, Integer maNd,
			String email) {
		super();
		this.id = id;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.trangThai = trangThai;
		this.quyen = quyen;
		this.maNd = maNd;
		this.email = email;
	}


	@Column(name="Email")
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "TenTaiKhoan")
	public String getTenTaiKhoan() {
		return this.tenTaiKhoan;
	}

	public void setTenTaiKhoan(String tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	@Column(name = "MatKhau")
	public String getMatKhau() {
		return this.matKhau;
	}

	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	@Column(name = "TrangThai")
	public Boolean getTrangThai() {
		return this.trangThai;
	}

	public void setTrangThai(Boolean trangThai) {
		this.trangThai = trangThai;
	}

	@Column(name = "Quyen")
	public int getQuyen() {
		return this.quyen;
	}

	public void setQuyen(int quyen) {
		this.quyen = quyen;
	}

	@Column(name = "MaND")
	public Integer getMaNd() {
		return this.maNd;
	}

	public void setMaNd(Integer maNd) {
		this.maNd = maNd;
	}

}
