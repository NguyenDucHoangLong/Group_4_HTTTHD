package entities;
// Generated Dec 20, 2015 1:45:18 PM by Hibernate Tools 4.3.1.Final

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * CtkhuyenMai generated by hbm2java
 */
@Entity
@Table(name = "CTKhuyenMai", catalog = "QLWEBSITE")
public class CtkhuyenMai implements java.io.Serializable {

	private int maKm;
	private Date ngayBd;
	private Date ngayKt;
	private Serializable tenCtkm;
	private Set<SanPhamKhuyenMai> sanPhamKhuyenMais = new HashSet<SanPhamKhuyenMai>(0);

	public CtkhuyenMai() {
	}

	public CtkhuyenMai(int maKm) {
		this.maKm = maKm;
	}

	public CtkhuyenMai(int maKm, Date ngayBd, Date ngayKt, Serializable tenCtkm,
			Set<SanPhamKhuyenMai> sanPhamKhuyenMais) {
		this.maKm = maKm;
		this.ngayBd = ngayBd;
		this.ngayKt = ngayKt;
		this.tenCtkm = tenCtkm;
		this.sanPhamKhuyenMais = sanPhamKhuyenMais;
	}

	@Id

	@Column(name = "MaKM", unique = true, nullable = false)
	public int getMaKm() {
		return this.maKm;
	}

	public void setMaKm(int maKm) {
		this.maKm = maKm;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayBD", length = 10)
	public Date getNgayBd() {
		return this.ngayBd;
	}

	public void setNgayBd(Date ngayBd) {
		this.ngayBd = ngayBd;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayKT", length = 10)
	public Date getNgayKt() {
		return this.ngayKt;
	}

	public void setNgayKt(Date ngayKt) {
		this.ngayKt = ngayKt;
	}

	@Column(name = "TenCTKM")
	public Serializable getTenCtkm() {
		return this.tenCtkm;
	}

	public void setTenCtkm(Serializable tenCtkm) {
		this.tenCtkm = tenCtkm;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "ctkhuyenMai")
	public Set<SanPhamKhuyenMai> getSanPhamKhuyenMais() {
		return this.sanPhamKhuyenMais;
	}

	public void setSanPhamKhuyenMais(Set<SanPhamKhuyenMai> sanPhamKhuyenMais) {
		this.sanPhamKhuyenMais = sanPhamKhuyenMais;
	}

}
