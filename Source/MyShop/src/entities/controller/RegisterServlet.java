package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.KhachHangDAOImpl;
import dao.TaiKhoanDAOImpl;
import entities.KhachHang;
import entities.TaiKhoan;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TaiKhoanDAOImpl taikhoanDAO = new TaiKhoanDAOImpl();
	private KhachHangDAOImpl khachhangDAO = new KhachHangDAOImpl();
       

    public RegisterServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String TenKh = request.getParameter("TenKH");
		String DiaChi = request.getParameter("DiaChi");
		String SDT = request.getParameter("SDT");
		
		String url = "/login.jsp";
		
		String username_err = "", password_err = "", email_err ="", Tenkh_err = "", DiaChi_err = "", SDT_err = "";
		
		if(username.equals(""))
		{
			username_err += "Vui lòng nhập tên đăng nhập!";
		}
		else
		{
			if(taikhoanDAO.checkUsername(username) == true)
				username_err += "Tên đăng nhập đã tồn tại";
		}
		if(password.equals(""))
		{
			password_err += "Vui lòng nhập password!";
		}
		else
		{
			if(password.length() < 5 && password.length() > 0)
				password_err += "Mật khẩu yếu vui lòng nhập lại!";
		}
		if(email.equals("") )
		{
			email_err += "Vui lòng nhập dịa chỉ email!";
		}
		if(TenKh.equals(""))
		{
			Tenkh_err += "Vui lòng nhập tên khách hàng";
		}
		if(DiaChi.equals(""))
		{
			DiaChi_err += "Vui lòng nhập địa chỉ";
		}
		if(SDT.equals(""))
		{
			SDT_err += "Vui lòng nhập số điện thoại";
		}
		

		
		if(username_err.length() > 0){
			request.setAttribute("username_err", username_err);
			request.setAttribute("username", username);
		}
		
		if(password_err.length() > 0)
		{
			request.setAttribute("password_err", password_err);
		}
		
		if(email_err.length() > 0)
		{
			request.setAttribute("email_err", email_err);
		}
	
		if(Tenkh_err.length() > 0)
		{
			request.setAttribute("Tenkh_err", Tenkh_err);
		}
			
		if(DiaChi_err.length() > 0)
		{
			request.setAttribute("DiaChi_err", DiaChi_err);
		}
	
		if(SDT_err.length() > 0)
		{
			request.setAttribute("SDT_err", SDT_err);
		}
		
		
		
		try{
			if(username_err.length() == 0 && password_err.length() == 0 && email_err.length() == 0
				&& Tenkh_err.length() == 0 && DiaChi_err.length() == 0 && SDT_err.length() == 0)
			{
				khachhangDAO.insertKhachHang(new KhachHang(0, 1, TenKh, null, null, DiaChi, SDT, 0));
				
				int makh = khachhangDAO.getMaxKhachHang().getMaKh();
						
				taikhoanDAO.insertUser(new TaiKhoan(0, username, password, false, 0, makh, email));
				HttpSession session = request.getSession();
				session.setAttribute("username", username);	
				url = "/index.jsp";
			}
			else
			{
				url = "/login.jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}catch(Exception e){
			e.printStackTrace();
		}
	}


}





