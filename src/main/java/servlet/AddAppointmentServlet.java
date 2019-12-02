package servlet;

import manager.AppointManager;

import manager.MasterManager;
import manager.ServicesManager;
import models.Appointment;
import models.Master;
import models.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/addAppointment")
public class AddAppointmentServlet extends HttpServlet {
    private AppointManager appointmentManager = new AppointManager();
    private ServicesManager servicesManager = new ServicesManager();
    private MasterManager masterManager = new MasterManager();


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String service_id = req.getParameter("service_id");
        String master_id = req.getParameter("master_id");

        int serviceId = Integer.parseInt(service_id);
        int masterId = Integer.parseInt(master_id);

        Service service = servicesManager.getServiceById(serviceId);
        Master master = masterManager.getMasterById(masterId);

        Appointment appointment = Appointment.builder()
                .name(req.getParameter("name"))
                .time(req.getParameter("date") + " " + req.getParameter("time"))
                .service(service)
                .master(master)
                .phoneNumber(req.getParameter("phoneNumber"))
                .email(req.getParameter("email"))
                .build();
        appointmentManager.add(appointment);
        req.getRequestDispatcher("home.jsp").forward(req, resp);

    }
}
