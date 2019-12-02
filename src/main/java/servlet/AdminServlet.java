package servlet;

import manager.AppointManager;

import manager.MasterManager;
import manager.ServicesManager;

import models.Admin;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(urlPatterns = "/adminHome")

public class AdminServlet extends HomeServlet {
    private ServicesManager servicesManager = new ServicesManager();
    private MasterManager masterManager = new MasterManager();
    private AppointManager appointmentManager = new AppointManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin == null ) {
            resp.sendRedirect("home.jsp");
        } else {
            req.setAttribute("masters", masterManager.getAllMaster());
            req.setAttribute("services", servicesManager.getAllService());
            req.setAttribute("allAppointment", appointmentManager.getAllAppointment());
            req.getRequestDispatcher("adminHome.jsp").forward(req, resp);

        }
    }
}
