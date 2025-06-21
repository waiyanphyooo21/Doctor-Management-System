package controller.java;


import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.*;

@WebServlet("/login")
public class LoginController extends HttpServlet {

    private final String DB_URL = "jdbc:mysql://localhost:3306/doc_db";
    private final String DB_USER = "root";
    private final String DB_PASS = "your_password_here"; // ← update this

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);

            PreparedStatement stmt = conn.prepareStatement(
                    "SELECT role FROM users WHERE username=? AND password=?"
            );
            stmt.setString(1, username);
            stmt.setString(2, password);

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                String role = rs.getString("role");

                // Set session attributes
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                session.setAttribute("role", role);

                // Redirect to index.jsp (it will redirect again to correct page)
                response.sendRedirect("index.jsp");

            } else {
                request.setAttribute("error", "Invalid username or password");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}

