package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.TaiKhoanDAOImpl;
import entities.TaiKhoan;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TaiKhoanDAOImpl taikhoanDAO = new TaiKhoanDAOImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		
		String url = "/login.jsp";
		
		String username_err = "", password_err = "", email_err ="";
		
		if(username.equals("") || password.equals("") || email.equals("")){
			username_err += "Vui lòng nhập tên đăng nhập!";
			password_err += "Vui lòng nhập password!";
			email_err += "Vui lòng nhập dịa chỉ email!";
		}
		else
		{
			if(taikhoanDAO.checkUsername(username) == true)
			{
				username_err += "Tên đăng nhập đã tồn tại";
			}
		}
		
		if(password.length() < 5 && password.length() > 0){
			password_err += "Mật khẩu yếu vui lòng nhập lại!";
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
		
		try{
			if(username_err.length() == 0 && password_err.length() == 0 && email_err.length() == 0){
				taikhoanDAO.insertUser(new TaiKhoan(0, username, password, false, "khachhang", null, email));
				HttpSession session = request.getSession();
				session.getAttribute(username);		
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
