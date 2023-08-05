package DB;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("userText");
		String password = request.getParameter("passText");
		String userType = request.getParameter("userType");
		
		UserDatabase db = new UserDatabase(ConnectionPro.getConnection());
		User user = db.logUser(username, password, userType);
		if(user!=null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			response.sendRedirect("HomePage.jsp");
		} else {
			request.setAttribute("message", "Invalid username/password. Try again!");
			RequestDispatcher rd = request.getRequestDispatcher("LoginPage.jsp");
			rd.forward(request, response);
			//response.sendRedirect("LoginPage.jsp");
		}
	}

}
