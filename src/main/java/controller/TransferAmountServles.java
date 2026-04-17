package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Transection;

import java.io.IOException;

import dao.TransectionDAO;




@WebServlet("/TransferAmount")
public class TransferAmountServles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/customer/transferAmount.jsp").forward(request, response);
		}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long sender = Long.parseLong(request.getParameter("sender"));
		long reciver =Long.parseLong(request.getParameter("reciver"));
		int amount = Integer.parseInt(request.getParameter("tamount"));

		
		Transection t =new Transection();
		t.setAcno(sender);
		
		TransectionDAO tdao = new TransectionDAO();
		double bal = tdao.getCurrentBalance(t);
		
		System.out.println("current balance= " +bal);
		
		
		if(bal < amount || bal<=0) {
			request.setAttribute("error", "Insufficient Balance");
			request.getRequestDispatcher("/customer/transferAmount.jsp").forward(request, response);
		}else {
			
		boolean status = tdao.transerAmount(sender, reciver, amount);
		System.out.print(status);
		
			if(status) {
				request.setAttribute("success", "Transection successfuly");
				request.getRequestDispatcher("/customer/transferAmount.jsp").forward(request, response);
				
			}else {
				request.setAttribute("error1", "Transection failed");
				request.getRequestDispatcher("/customer/transferAmount.jsp").forward(request, response);
			}
			
		}
		
	}

}
