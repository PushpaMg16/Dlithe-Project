package Authentication;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import com.inventory.DTO.UserDTO;
import com.inventory.Database.ConnectionFactory;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String userType;
	UserDTO userDTO;
    LocalDateTime inTime;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String username = request.getParameter("userText");
        String password = request.getParameter("passText");
        //TODO Password encryption to be added later:
        //String password = encryptPass(pass);
        userType = request.getParameter("userType");

        if (new ConnectionFactory().checkLogin(username, password, userType)){
            inTime = LocalDateTime.now();
            //userDTO.setInTime(String.valueOf(inTime));
            //new Dashboard(username, userType, userDTO);
            request.setAttribute("username", username);
            request.setAttribute("userType", userType);
            RequestDispatcher rd = request.getRequestDispatcher("HomePage.jsp");
            rd.forward(request,response);
        } else {
        	request.setAttribute("invalid", "true");
        	request.getRequestDispatcher("LoginPage.jsp").forward(request,response);
        }
	}

}
