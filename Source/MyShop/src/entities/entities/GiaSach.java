package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "GiaSach")
public class GiaSach {
	int MaGiaSach;
	int MaSP;
	int MaKH;
	
	public GiaSach() {
	}

	public GiaSach(int maGiaSach, int maSP, int maKH) {
		MaGiaSach = maGiaSach;
		MaSP = maSP;
		MaKH = maKH;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "MaGiaSach", unique = true, nullable = false)
	public int getMaGiaSach() {
		return MaGiaSach;
	}

	
	public void setMaGiaSach(int maGiaSach) {
		MaGiaSach = maGiaSach;
	}

	@Column(name = "MaSP")
	public int getMaSP() {
		return MaSP;
	}

	public void setMaSP(int maSP) {
		MaSP = maSP;
	}

	@Column(name = "MaKH")
	public int getMaKH() {
		return MaKH;
	}

	public void setMaKH(int maKH) {
		MaKH = maKH;
	}
}
