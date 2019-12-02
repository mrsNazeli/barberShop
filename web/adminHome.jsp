<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Img" %>
<%@ page import="models.Master" %>
<%@ page import="models.Service" %>
<%@ page import="models.Appointment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Barber</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
    <!-- Place favicon.ico in the root directory -->

    <!-- CSS here -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/themify-icons.css">
    <link rel="stylesheet" href="css/nice-select.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/gijgo.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/slicknav.css">
    <link rel="stylesheet" href="css/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
</head>

<body>
<!--[if lte IE 9]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade
    your browser</a> to improve your experience and security.</p>
<![endif]-->
<%List<Service> allService = (List<Service>) request.getSession().getAttribute("allService");%>
<%List<Master> allMaster = (List<Master>) request.getSession().getAttribute("allMaster");%>
<%List<Img> allImage = (List<Img>) request.getSession().getAttribute("allImage");%>
<%List<Appointment> allAppointment = (List<Appointment>) request.getAttribute("allAppointment");%>
<!-- header-start -->
<header>
    <div class="header-area ">
        <div id="sticky-header" class="main-header-area">
            <div class="container-fluid p-0">
                <div class="row align-items-center no-gutters">
                    <div class="col-xl-3 col-lg-3">
                        <div class="logo-img">
                            <a href="index.jsp">
                                <img src="img/logo.png" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-6">
                        <div class="main-menu  d-none d-lg-block">
                            <nav>
                                <ul id="navigation">
                                    <li><a class="popup-with-form" href="#test-form">Add Master</a></li>
                                    <li><a class="popup-with-form" href="#test-form3">Add Service</a></li>
                                    <li><a class="popup-with-form" class="active" href="#test-form2">Add Image</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                        <div class="book_room">
                            <div class="book_btn d-none d-lg-block">
                                <a href="/logout">LogOut</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="mobile_menu d-block d-lg-none"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
<!-- header-end -->

<!-- service_area_start -->
<div class="service_area">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title2 text-center mb-90">
                    <i class="flaticon-scissors"></i>
                    <h3>Our Appointment</h3>
                </div>
            </div>
        </div>
        <div class="white_bg_pos">
            <div class="row">
                <div class="col-xl-6">
                    <table border="1px">
                        <%for (Appointment appointment : allAppointment) {%>


                        <th>Name:</th>
                        <th>Date_Time:</th>
                        <th>Master:</th>
                        <th>Service:</th>
                        <th>Email:</th>
                        <th>Phone Number:</th>
                        <tr>
                            <td><%=appointment.getName()%>
                            </td>
                            <td><%=appointment.getTime()%>
                            </td>
                            <td><%=appointment.getMaster().getName()%>
                            </td>
                            <td><%=appointment.getService().getName()%>
                            </td>
                            <td><%=appointment.getEmail()%>
                            </td>
                            <td><%=appointment.getPhoneNumber()%>
                            </td>
                        </tr>

                        <% } %>
                    </table>
                    <br>
                </div>
            </div>
        </div>
    </div>


    <div class="service_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title2 text-center mb-90">
                        <i class="flaticon-scissors"></i>
                        <h3>our service</h3>
                    </div>
                </div>
            </div>
            <div class="white_bg_pos">
                <div class="row">
                    <div class="col-xl-6">
                        <%for (Service service : allService) {%>
                        <div class="single_service d-flex justify-content-between align-items-center">
                            <div class="service_inner d-flex align-items-center">
                                <div class="thumb">
                                    <img src="/getImage?imgName=<%=service.getImagePath()%>" alt="">
                                </div>
                                <span>Name:<%=service.getName()%> :Description:<%=service.getDescription()%></span>
                            </div>
                            <p>………………………..$<%=service.getPrice()%>
                            </p>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- gallery_area_start -->
    <div class="gallery_area">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title2 text-center mb-90">
                        <i class="flaticon-scissors" style="color: black"></i>
                        <h3 class="flaticon-scissors" style="color: black">Our Gallery</h3>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-xl-12">
                    <div class="gallery_active owl-carousel">
                        <%for (Img image : allImage) { %>
                        <div class="single_gallery">
                            <div class="thumb">
                                <img src="/getImage?imgName=<%=image.getImgPath()%>">
                                <div class="image_hover">
                                    <a class="popup-image" href="/getImage?imgName=<%=image.getImgPath()%>">
                                        <i class="ti-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="cutter_muster">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="section_title2 text-center mb-90">
                        <i class="flaticon-scissors" class="flaticon-scissors" style="color: black"></i>
                        <h3 class="flaticon-scissors" style="color: black">Our Cutter Masters</h3>
                    </div>
                </div>
            </div>
            <div class="row">
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
            </div>
        </div>
    </div>
    <!-- footer -->
    <!-- link that opens popup -->

    <!-- form itself end-->
    <form id="test-form" class="white-popup-block mfp-hide" action="/addMaster" method="post"
          enctype="multipart/form-data">
        <div class="popup_box ">
            <div class="popup_inner">
                <h3>Add Master</h3>
                <form action="#">
                    <div class="row">
                        <div class="col-xl-6 col-md-6">
                            <input type="text" name="name" placeholder="Name">
                        </div>

                        <div class="col-xl-6 col-md-6">
                            <input type="text" name="surname" placeholder="Surname">
                        </div>

                        <div class="col-xl-6 col-md-6">
                            <input type="text" name="profession" placeholder="profession">
                        </div>

                        <div class="col-xl-6 col-md-6">
                            <input type="file" name="image" placeholder="Image">
                        </div>

                        <button type="submit" class="boxed-btn3">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </form>
    <!-- form itself end -->
    <form id="test-form2" class="white-popup-block mfp-hide" action="/addImage" method="post"
          enctype="multipart/form-data">
        <div class="popup_box ">
            <div class="popup_inner">
                <h3>Add Image</h3>
                <form action="#">
                    <div class="row">

                        <div class="col-xl-6 col-md-6">
                            <input type="file" name="image" placeholder="Image">
                        </div>

                        <button type="submit" class="boxed-btn3">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </form>
    <form id="test-form3" class="white-popup-block mfp-hide" action="/addService" method="post"
          enctype="multipart/form-data">
        <div class="popup_box ">
            <div class="popup_inner">
                <h3>Add Service</h3>
                <form action="#">
                    <div class="row">

                        <div class="col-xl-6 col-md-6">
                            <input type="file" name="image" placeholder="Image">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="text" name="name" placeholder="Name">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="text" name="description" placeholder="Description">
                        </div>
                        <div class="col-xl-6 col-md-6">
                            <input type="text" name="price" placeholder="price">
                        </div>

                        <button type="submit" class="boxed-btn3">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </form>
    <!-- JS here -->
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/scrollIt.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/nice-select.min.js"></script>
    <script src="js/jquery.slicknav.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/gijgo.min.js"></script>

    <!--contact js-->
    <script src="js/contact.js"></script>
    <script src="js/jquery.ajaxchimp.min.js"></script>
    <script src="js/jquery.form.js"></script>
    <script src="js/jquery.validate.min.js"></script>
    <script src="js/mail-script.js"></script>

    <script src="js/main.js"></script>
    <script>
        $('#datepicker').datepicker({
            iconsLibrary: 'fontawesome',
            disableDaysOfWeek: [0, 0],
            //     icons: {
            //      rightIcon: '<span class="fa fa-caret-down"></span>'
            //  }
        });
        $('#datepicker2').datepicker({
            iconsLibrary: 'fontawesome',
            icons: {
                rightIcon: '<span class="fa fa-caret-down"></span>'
            }

        });
        var timepicker = $('#timepicker').timepicker({
            format: 'HH.MM'
        });
    </script>
</div>
</body>
</html>
