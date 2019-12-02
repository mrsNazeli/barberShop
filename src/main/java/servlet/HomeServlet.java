package servlet;


import manager.ImageManager;
import manager.MasterManager;
import manager.ServicesManager;
import models.Img;
import models.Master;
import models.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/home")

public class HomeServlet extends HttpServlet {

    private ServicesManager servicesManager = new ServicesManager();
    private MasterManager masterManager = new MasterManager();
    private ImageManager imageManager = new ImageManager();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        List<Service> allService = servicesManager.getAllService();
        List<Master> allMaster = masterManager.getAllMaster();
        List<Img> allImage = (List<Img>) imageManager.getAllImage();
        req.getSession().setAttribute("allService", allService);
        req.getSession().setAttribute("allMaster", allMaster);
        req.getSession().setAttribute("allImage", allImage);
        req.getRequestDispatcher("home.jsp").forward(req, resp);

    }
}