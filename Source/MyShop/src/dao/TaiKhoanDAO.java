package dao;

import java.util.List;

import entities.TaiKhoan;

public interface TaiKhoanDAO {
	public List<TaiKhoan> FindAll();
	
	public void insertUser(TaiKhoan tk);
	
	public TaiKhoan getUser(int id);
	
	public boolean checkLogin(String username, String password);
	
	public boolean checkUsername(String username);
}
