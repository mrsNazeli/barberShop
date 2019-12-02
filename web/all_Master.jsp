<%@ page import="models.Master" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Master> allMaster = (List<Master>) request.getSession().getAttribute("allMasters");%>
<%for (Master master : allMaster) {%>
<div class="col-xl-3 col-md-6 col-lg-3">
    <div class="single_master">
        <div class="thumb">
            <img src="/getImage?imgName=<%=master.getImagePath()%>">
            <div class="social_link">
                <a href="#"><i class="fa fa-envelope"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
            </div>
        </div>
        <div class="master_name text-center">
            <h3><%=master.getName()%> <%=master.getSurname()%>
            </h3>
            <p><%=master.getProfession()%>
            </p>
        </div>
    </div>
</div>
<% }%>