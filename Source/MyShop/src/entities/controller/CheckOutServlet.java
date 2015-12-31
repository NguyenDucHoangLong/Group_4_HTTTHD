package controller;

import java.io.IOException;
import java.util.Map.Entry;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ChiTietDonHangImpl;
import dao.DonHangImpl;
import entities.Cart;
import entities.CtdonHang;
import entities.DonHang;
import entities.SanPham;

@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DonHangImpl donHangDAO = new DonHangImpl();
	private ChiTietDonHangImpl chiTietHoaDonDAO = new ChiTietDonHangImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckOutServlet() {
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
		response.setCharacterEncoding("utf-8");
		String dia_chi = request.getParameter("dia-chi");
		//String dien_thoai = request.getParameter("dien_thoai");
		HttpSession session = request.getSession();
		Cart cart = (Cart) session.getAttribute("cart");
		//String khach_hang = (String) session.getAttribute("username");
		//ArrayList<Long> listbuy = (ArrayList<Long>) session
				//.getAttribute("cardID");
		//long idBuy = Long.parseLong(request.getParameter("cardID"));
		//if (listbuy == null) {
			//listbuy = new ArrayList<Long>();
			//session.setAttribute("cardID", listbuy);
		//}

		try {
			//DonHang dh = null;
			//CtdonHang cthd = null;
			//DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			//Date date = new Date();
			
			
			donHangDAO.themDonHang(new DonHang(0, 1, null, null, dia_chi, 0, false, 100));
			TreeMap<SanPham, Integer> list = cart.getListProduct();
			for (Entry<SanPham, Integer> entry : list.entrySet()) {
				double giaban = entry.getKey().getGiaBan();
				chiTietHoaDonDAO.themChiTietDonHang(new CtdonHang(0, 0, entry.getKey().getMaSp(),
						entry.getValue(), giaban));
			}
			session.removeAttribute("cart");
			session.setAttribute("cart", new Cart());
			response.sendRedirect("/shop/index.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
