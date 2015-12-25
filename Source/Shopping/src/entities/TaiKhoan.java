package entities;
// Generated Dec 20, 2015 1:45:18 PM by Hibernate Tools 4.3.1.Final

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TaiKhoan generated by hbm2java
 */
@Entity
@Table(name = "TaiKhoan", catalog = "QLWEBSITE")
public class TaiKhoan implements java.io.Serializable {

	private int id;
	private Serializable tenTaiKhoan;
	private Serializable matKhau;
	private Boolean trangThai;
	private Integer quyen;
	private Integer maNd;
	private Serializable email;
	private Set<BaiPost> baiPosts = new HashSet<BaiPost>(0);
	private Set<BinhLuanBaiPost> binhLuanBaiPosts = new HashSet<BinhLuanBaiPost>(0);

	public TaiKhoan() {
	}

	public TaiKhoan(int id) {
		this.id = id;
	}

	public TaiKhoan(int id, Serializable tenTaiKhoan, Serializable matKhau, Boolean trangThai, Integer quyen,
			Integer maNd, Serializable email, Set<BaiPost> baiPosts, Set<BinhLuanBaiPost> binhLuanBaiPosts) {
		this.id = id;
		this.tenTaiKhoan = tenTaiKhoan;
		this.matKhau = matKhau;
		this.trangThai = trangThai;
		this.quyen = quyen;
		this.maNd = maNd;
		this.email = email;
		this.baiPosts = baiPosts;
		this.binhLuanBaiPosts = binhLuanBaiPosts;
	}

	@Id

	@Column(name = "ID", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@Column(name = "TenTaiKhoan")
	public Serializable getTenTaiKhoan() {
		return this.tenTaiKhoan;
	}

	public void setTenTaiKhoan(Serializable tenTaiKhoan) {
		this.tenTaiKhoan = tenTaiKhoan;
	}

	@Column(name = "MatKhau")
	public Serializable getMatKhau() {
		return this.matKhau;
	}

	public void setMatKhau(Serializable matKhau) {
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
	public Integer getQuyen() {
		return this.quyen;
	}

	public void setQuyen(Integer quyen) {
		this.quyen = quyen;
	}

	@Column(name = "MaND")
	public Integer getMaNd() {
		return this.maNd;
	}

	public void setMaNd(Integer maNd) {
		this.maNd = maNd;
	}

	@Column(name = "Email")
	public Serializable getEmail() {
		return this.email;
	}

	public void setEmail(Serializable email) {
		this.email = email;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taiKhoan")
	public Set<BaiPost> getBaiPosts() {
		return this.baiPosts;
	}

	public void setBaiPosts(Set<BaiPost> baiPosts) {
		this.baiPosts = baiPosts;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "taiKhoan")
	public Set<BinhLuanBaiPost> getBinhLuanBaiPosts() {
		return this.binhLuanBaiPosts;
	}

	public void setBinhLuanBaiPosts(Set<BinhLuanBaiPost> binhLuanBaiPosts) {
		this.binhLuanBaiPosts = binhLuanBaiPosts;
	}

}