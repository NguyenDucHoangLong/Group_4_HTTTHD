package entities;

import javax.persistence.Column;
import javax.persistence.Entity;

import javax.persistence.Id;

import javax.persistence.Table;


@Entity
@Table(name = "DanhMuc")
public class DanhMuc{

	private int maDanhMuc;
	private String tenDanhMuc;
	private Integer maDanhMucCha;


	public DanhMuc() {
	}

	public DanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}

	public DanhMuc(int maDanhMuc, String tenDanhMuc, Integer maDanhMucCha) {
		this.maDanhMuc = maDanhMuc;
		this.tenDanhMuc = tenDanhMuc;
		this.maDanhMucCha = maDanhMucCha;
	}

	@Id

	@Column(name = "MaDanhMuc", unique = true, nullable = false)
	public int getMaDanhMuc() {
		return this.maDanhMuc;
	}

	public void setMaDanhMuc(int maDanhMuc) {
		this.maDanhMuc = maDanhMuc;
	}

	@Column(name = "TenDanhMuc")
	public String getTenDanhMuc() {
		return this.tenDanhMuc;
	}

	public void setTenDanhMuc(String tenDanhMuc) {
		this.tenDanhMuc = tenDanhMuc;
	}

	@Column(name = "MaDanhMucCha")
	public Integer getMaDanhMucCha() {
		return this.maDanhMucCha;
	}

	public void setMaDanhMucCha(Integer maDanhMucCha) {
		this.maDanhMucCha = maDanhMucCha;
	}

	

}
