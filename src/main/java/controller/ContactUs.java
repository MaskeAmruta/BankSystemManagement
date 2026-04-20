package controller;

import java.io.IOException;

import dao.ContactFormDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.ContactForm;

@WebServlet("/contactUs")
public class ContactUs extends HttpServlet{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ContactForm cForm = new ContactForm();
		
		cForm.setName(req.getParameter("name"));
		cForm.setEmail(req.getParameter("email"));
		cForm.setSubject(req.getParameter("subject"));
		cForm.setMessage(req.getParameter("message"));
		
		ContactFormDAO conDao = new ContactFormDAO();
		boolean status = conDao.contactUs(cForm);
		
		if(status) {
			resp.sendRedirect("contact.jsp?msg=Message send successfully.");
		}
		else {
			resp.sendRedirect("contact.jsp?error=Not send.");
		}
		
		
	}

}
