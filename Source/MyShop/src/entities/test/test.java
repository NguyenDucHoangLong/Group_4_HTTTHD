package test;

import java.util.List;

import dao.GiaSachDAOImpl;
import dao.LienHeDAOImpl;
import entities.GiaSach;
import entities.LienHe;

public class test {

	public static void main(String[] args){
		
		LienHeDAOImpl lienHeDAO = new LienHeDAOImpl();
		lienHeDAO.ThemLienHe(new LienHe(0, "Long","1@gmail.com", "test", "Content"));
	
	}

}
