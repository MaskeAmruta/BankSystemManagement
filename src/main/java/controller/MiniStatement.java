package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Transection;

import java.io.IOException;
import java.util.List;

import dao.TransectionDAO;

@WebServlet("/MiniStatement")
public class MiniStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		long ac =(Long) session.getAttribute("acno");
		
		Transection t = new Transection();
		t.setAcno(ac);
		
		TransectionDAO tdao = new TransectionDAO();
		List<Transection>list = tdao.getMiniStatByAc(t);
		
//		for(Transection t1 : list) {
//			System.out.println("tansection list " + t1.getAcno() + "" +t1.getAmount() + "" +t1.getType() + " "+ t1.getDate());
//		}
		
		request.setAttribute("transection", list);
		request.getRequestDispatcher("/customer/minStatement.jsp").forward(request, response);
		
	}
}
