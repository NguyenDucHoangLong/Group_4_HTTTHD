package entities;


import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;

import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name = "SanPham")
public class SanPham implements Comparable<SanPham>{

	private int maSp;
	private int danhMuc;
	private int loaiSanPham;
	private String tenSp;
	private Long giaBan;
	private Integer slton;
	private String nhaSanXuat;
	private Date ngayCapNhat;
	private String moTa;
	private String hinhAnh;
	private String tacGia;

	public String getTacGia() {
		return tacGia;
	}

	public void setTacGia(String tacGia) {
		this.tacGia = tacGia;
	}

	public SanPham() {
	}

	public SanPham(int maSp) {
		this.maSp = maSp;
	}

	public SanPham(int maSp, int danhMuc, int loaiSanPham, String tenSp, Long giaBan, Integer slton,
			String nhaSanXuat, Date ngayCapNhat, String moTa, String hinhAnh, String tacGia) {
		this.maSp = maSp;
		this.danhMuc = danhMuc;
		this.loaiSanPham = loaiSanPham;
		this.tenSp = tenSp;
		this.giaBan = giaBan;
		this.slton = slton;
		this.nhaSanXuat = nhaSanXuat;
		this.ngayCapNhat = ngayCapNhat;
		this.moTa = moTa;
		this.hinhAnh = hinhAnh;
		this.tacGia = tacGia;
	}

	@Id

	@Column(name = "MaSP", unique = true, nullable = false)
	public int getMaSp() {
		return this.maSp;
	}

	public void setMaSp(int maSp) {
		this.maSp = maSp;
	}

	@Column(name = "MaDanhMuc")
	public int getDanhMuc() {
		return this.danhMuc;
	}

	public void setDanhMuc(int danhMuc) {
		this.danhMuc = danhMuc;
	}

	@Column(name = "LoaiSP")
	public int getLoaiSanPham() {
		return this.loaiSanPham;
	}

	public void setLoaiSanPham(int loaiSanPham) {
		this.loaiSanPham = loaiSanPham;
	}

	@Column(name = "TenSP")
	public String getTenSp() {
		return this.tenSp;
	}

	public void setTenSp(String tenSp) {
		this.tenSp = tenSp;
	}

	@Column(name = "GiaBan", precision = 18, scale = 0)
	public Long getGiaBan() {
		return this.giaBan;
	}

	public void setGiaBan(Long giaBan) {
		this.giaBan = giaBan;
	}

	@Column(name = "SLTon")
	public Integer getSlton() {
		return this.slton;
	}

	public void setSlton(Integer slton) {
		this.slton = slton;
	}

	@Column(name = "NhaSanXuat")
	public String getNhaSanXuat() {
		return this.nhaSanXuat;
	}

	public void setNhaSanXuat(String nhaSanXuat) {
		this.nhaSanXuat = nhaSanXuat;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "NgayCapNhat", length = 10)
	public Date getNgayCapNhat() {
		return this.ngayCapNhat;
	}

	public void setNgayCapNhat(Date ngayCapNhat) {
		this.ngayCapNhat = ngayCapNhat;
	}

	@Column(name = "MoTa")
	public String getMoTa() {
		return this.moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	@Column(name = "HinhAnh")
	public String getHinhAnh() {
		return this.hinhAnh;
	}

	public void setHinhAnh(String hinhAnh) {
		this.hinhAnh = hinhAnh;
	}

	@Override
	public int compareTo(SanPham sp) {
		return this.maSp - sp.maSp;
	}

	
}
