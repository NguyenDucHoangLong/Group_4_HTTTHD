package entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "LienHe")
public class LienHe {
	int MaLienHe;
	String HoTen;
	String Email;
	String TieuDe;
	String NoiDung;
	
	public LienHe() {
		
	}

	public LienHe(int maLienHe, String hoTen, String email, String tieuDe, String noiDung) {
		MaLienHe = maLienHe;
		HoTen = hoTen;
		Email = email;
		TieuDe = tieuDe;
		NoiDung = noiDung;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "MaLienHe", unique = true, nullable = false)
	public int getMaLienHe() {
		return MaLienHe;
	}

	public void setMaLienHe(int maLienHe) {
		MaLienHe = maLienHe;
	}

	@Column(name = "HoTen")
	public String getHoTen() {
		return HoTen;
	}

	public void setHoTen(String hoTen) {
		HoTen = hoTen;
	}

	@Column(name = "Email")
	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	@Column(name = "TieuDe")
	public String getTieuDe() {
		return TieuDe;
	}

	public void setTieuDe(String tieuDe) {
		TieuDe = tieuDe;
	}

	@Column(name = "NoiDung")
	public String getNoiDung() {
		return NoiDung;
	}

	public void setNoiDung(String noiDung) {
		NoiDung = noiDung;
	}
	
	
	
	
}
