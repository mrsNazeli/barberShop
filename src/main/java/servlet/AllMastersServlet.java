package servlet;

import manager.MasterManager;
import models.Master;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/allMaster")
public class AllMastersServlet  extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MasterManager masterManager=new MasterManager();
        List<Master> allMaster = masterManager.getAllMaster();
        req.setAttribute("masters",allMaster);
        req.getRequestDispatcher("/all_Master").forward(req, resp);

    }
}
