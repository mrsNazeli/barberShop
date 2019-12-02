<%@ page import="java.util.List" %>
<%@ page import="models.Img" %>
<%@ page import="models.Master" %>
<%@ page import="models.Service" %>
<%@ page contentType="text/html;charset=UTF-8" %>
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
                                    <li><a href="index.jsp">home</a></li>
                                    <li><a class="active" href="about.jsp">About</a></li>
                                    <li><a href="service.jsp">service</a></li>
                                    <li><a class="popup-with-form" href="#test-form2">login </a></li>
                                    <li><a href="#">blog <i class="ti-angle-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="blog.jsp">blog</a></li>
                                            <li><a href="single-blog.jsp">single-blog</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="#">pages <i class="ti-angle-down"></i></a>
                                        <ul class="submenu">
                                            <li><a href="elements.jsp">elements</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="contact.jsp">Contact</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                        <div class="book_room">
                            <div class="book_btn d-none d-lg-block">
                                <a class="popup-with-form" href="#test-form">Make an Appointment</a>
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

<!-- bradcam_area_start -->
<div class="bradcam_area breadcam_bg overlay2">
    <h3>About Us</h3>
</div>
<!-- bradcam_area_end -->

<!-- about_area_start -->
<div class="about_area">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-xl-6 col-lg-6">
                <div class="about_thumb">
                    <img src="img/about/about_lft.png" alt="">
                    <div class="opening_hour text-center">
                        <i class="flaticon-clock"></i>
                        <h3>Opening Hour</h3>
                        <p>Mon-Fri (9.00-11.00) <br>
                            Sat (10.00-4.00)</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-lg-6">
                <div class="about_info">
                    <div class="section_title mb-20px">
                        <span>About Us</span>
                        <h3>Experienced and <br>
                            Traditional Stylish <br>
                            Barber Shop</h3>
                    </div>
                    <p>Inspires employees and organizations to support causes they care <br>
                        about. We do this to bring more resources to the nonprofits that are <br>
                        changing our world.</p>
                    <a href="#" class="boxed-btn3">Learn More</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- about_area_end -->

<!-- gallery_area_start -->
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
                <div class="col-xl-12">
                    <div class="book_btn text-center">
                        <a class="boxed-btn3 popup-with-form" href="#test-form">Make an Appointment</a>
                    </div>
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
                    <i class="flaticon-scissors"></i>
                    <h3>Our Gallery</h3>
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
                    <div class="single_gallery">
                        <div class="thumb">
                            <img src="img/gallery/2.png" alt="">
                            <div class="image_hover">
                                <a class="popup-image" href="img/gallery/2.png">
                                    <i class="ti-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="single_gallery">
                        <div class="thumb">
                            <img src="img/gallery/3.png" alt="">
                            <div class="image_hover">
                                <a class="popup-image" href="img/gallery/3.png">
                                    <i class="ti-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="single_gallery">
                        <div class="thumb">
                            <img src="img/gallery/1.png" alt="">
                            <div class="image_hover">
                                <a class="popup-image" href="img/gallery/1.png">
                                    <i class="ti-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="single_gallery">
                        <div class="thumb">
                            <img src="img/gallery/2.png" alt="">
                            <div class="image_hover">
                                <a class="popup-image" href="img/gallery/2.png">
                                    <i class="ti-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="single_gallery">
                        <div class="thumb">
                            <img src="img/gallery/3.png" alt="">
                            <div class="image_hover">
                                <a class="popup-image" href="img/gallery/3.png">
                                    <i class="ti-plus"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- gallery_area_end -->

<!-- video_area_start -->
<div class="video_area">
    <div class="container-fluid p-0">
        <div class="row align-items-center no-gutters">
            <div class="col-xl-6 col-lg-6">
                <div class="video_info">
                    <div class="about_info">
                        <div class="section_title mb-20px">
                            <span>How we Work</span>
                            <h3>Watch the Video <br>
                                How we Work?</h3>
                        </div>
                        <p>Inspires employees and organizations to support causes they care <br>
                            about. We do this to bring more resources to the nonprofits that are <br>
                            changing our world.</p>
                        <a href="#" class="boxed-btn3">book now</a>
                    </div>
                </div>
            </div>
            <div class="col-xl-6 col-lg-6">
                <div class="video_thumb">
                    <div class="video_thumb_inner">
                        <img src="img/gallery/video.png" alt="">
                        <a href="https://www.youtube.com/watch?v=I4NcwG-zusE" class="popup-video">
                            <i class="fa fa-play"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- video_area_end -->

<!-- cutter_muster_start -->
<div class="cutter_muster">
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <div class="section_title2 text-center mb-90">
                    <i class="flaticon-scissors"></i>
                    <h3>Our Cutter Masters</h3>
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
<!-- cutter_muster_end -->

<!-- find_us_area start -->
<div class="find_us_area find_bg_1 ">
    <div class="container">
        <div class="row">
            <div class="col-xl-5 offset-xl-7 col-lg-6 offset-lg-6">
                <div class="find_info">
                    <h3 class="find_info_title">How to Find Us</h3>
                    <div class="single_find d-flex">
                        <div class="icon">
                            <i class="flaticon-placeholder"></i>
                        </div>
                        <div class="find_text">
                            <h3>Location</h3>
                            <p>200, A-block, Green road, USA</p>
                        </div>
                    </div>
                    <div class="single_find d-flex">
                        <div class="icon">
                            <i class="flaticon-phone-call"></i>
                        </div>
                        <div class="find_text">
                            <h3>Call Us</h3>
                            <p>+10 378 478 2789</p>
                        </div>
                    </div>
                    <div class="single_find d-flex">
                        <div class="icon">
                            <i class="flaticon-paper-plane"></i>
                        </div>
                        <div class="find_text">
                            <h3>Mail Us</h3>
                            <p>contact@barbershop.com</p>
                        </div>
                    </div>
                    <div class="single_find">
                        <div class="book_btn">
                            <a class="popup-with-form" href="#test-form">Make an Appointment</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- find_us_area_end -->

<!-- footer -->
<footer class="footer">
    <div class="footer_top">
        <div class="container">
            <div class="row">
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            Join With Us
                        </h3>
                        <p class="footer_text doanar"><a class="first" href="#">Make Appointment</a> <br>
                            <a href="#">+10 378 478 2789</a></p>

                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-lg-3">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            address
                        </h3>
                        <p class="footer_text">200, A-block, Green road, USA <br>
                            +10 367 267 2678 <br>
                            <a class="domain" href="#">contact@nonprofit.com</a></p>
                        <div class="socail_links">
                            <ul>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-facebook-square"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-twitter"></i>
                                    </a>
                                </li>
                                <li>
                                    <a href="#">
                                        <i class="fa fa-instagram"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-2 col-md-6 col-lg-2">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            Navigation
                        </h3>
                        <ul>
                            <li><a href="#">Home</a></li>
                            <li><a href="#">Rooms</a></li>
                            <li><a href="#">About</a></li>
                            <li><a href="#">News</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-xl-4 col-md-6 col-lg-4">
                    <div class="footer_widget">
                        <h3 class="footer_title">
                            Newsletter
                        </h3>
                        <form action="#" class="newsletter_form">
                            <input type="text" placeholder="Enter your mail">
                            <button type="submit">Sign Up</button>
                        </form>
                        <p class="newsletter_text">Subscribe newsletter to get updates</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copy-right_text">
        <div class="container">
            <div class="footer_border"></div>
            <div class="row">
                <div class="col-xl-12">
                    <p class="copy_right text-center">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                        All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                            aria-hidden="true"></i> by <a
                            href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- footer -->
<!-- link that opens popup -->

<!-- form itself end-->
<form id="test-form" class="white-popup-block mfp-hide" action="/addApointement" method="post">
    <div class="popup_box ">
        <div class="popup_inner">
            <h3>Make an Appointment</h3>
            <form action="#">
                <div class="row">
                    <div class="col-xl-6 col-md-6">
                        <input id="datepicker" name="date" placeholder="Date">
                    </div>
                    <div class="col-xl-6 col-md-6">
                        <input id="timepicker" placeholder="time" name="time">
                    </div>
                    <div class="col-xl-6 col-md-6">

                        <select class="form-select wide" id="default-select1" class="" name="service_id">

                            <option data-display="Choose services">Choose services</option>
                            <%for (Service service : allService) { %>

                            <option name="service_id" value="<%=service.getId()%>"><%=service.getName()%>
                            </option>
                            <% }%>

                            <%--                            <option value="2">Choose services 3</option>--%>
                            <%--                            <option value="3">Choose services 4</option>--%>
                        </select>
                    </div>

                    <div class="col-xl-6 col-md-6">
                        <select class="form-select wide" id="default-select" class="" name="master_id">

                            <option data-display="Choose Barbers">Choose Barbers</option>

                            <%
                                for (Master master : allMaster) {%>
                            <option value="<%=master.getId()%>" name="master_id"><%=master.getName()%>
                            </option>
                            <%--                            <option value="2">Ronky</option>--%>
                            <%--                            <option value="3">kalu</option>--%>

                            <% }%>
                        </select>
                    </div>
                    <div class="col-xl-6 col-md-6">
                        <input type="text" placeholder="name" name="name">
                    </div>
                    <div class="col-xl-6 col-md-6">
                        <input type="text" placeholder="phoneNumber" name="phoneNumber">
                    </div>
                    <div class="col-xl-12">
                        <input type="email" placeholder="Your email" name="email">
                    </div>
                    <div class="col-xl-12">
                        <button type="submit" class="boxed-btn3">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</form>
<!-- form itself end -->
<form id="test-form2" class="white-popup-block mfp-hide" action="/login" method="post">
    <div class="popup_box ">
        <div class="popup_inner">
            <h3>Admin Login</h3>
            <form action="#">
                <div class="row">

                    <div class="col-xl-6 col-md-6">
                        <input type="text" placeholder="email" name="email">
                    </div>
                    <div class="col-xl-6 col-md-6">
                        <input type="password" placeholder="password" name="password">
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
</body>

</html>