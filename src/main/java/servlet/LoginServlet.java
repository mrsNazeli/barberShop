package servlet;

import manager.AdminManager;
import models.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/login")

public class LoginServlet extends HttpServlet {
    AdminManager adminManager = new AdminManager();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Admin admin = adminManager.getEmailAndPassword(email,password);
        if(admin == null){
            resp.sendRedirect("index.jsp");
        }else {
            req.getSession().setAttribute("admin",admin);
            resp.sendRedirect("/adminHome");
        }
    }
}
