package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GiaSachDAOImpl;
import dao.TaiKhoanDAOImpl;
import entities.GiaSach;
import entities.TaiKhoan;


@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String username = (String)session.getAttribute("username");
		TaiKhoanDAOImpl taiKhoanDAO = new TaiKhoanDAOImpl();
		TaiKhoan tk = taiKhoanDAO.getuserByUsername(username);
		GiaSachDAOImpl giaSachDAO = new GiaSachDAOImpl();
		String product_id = request.getParameter("product_id");
		String command = request.getParameter("command");
		
		String url = "/favorite.jsp";
		try
		{
			switch(command){
			case "insertItem":
				if(giaSachDAO.checkGiaSach(tk.getMaNd(), Integer.parseInt(product_id)) == false)
				{
				giaSachDAO.ThemGiaSach(new GiaSach(0, Integer.parseInt(product_id), tk.getMaNd()));
				}
			
				url = "/favorite.jsp";
				
				break;
			case "cancelItem":
				giaSachDAO.DeleteGiaSachs(tk.getMaNd());
				break;
			case "removeItem":
				giaSachDAO.DeleteGiaSach(tk.getMaNd(), Integer.parseInt(product_id));
				break;
			default:
				break;
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		}catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
