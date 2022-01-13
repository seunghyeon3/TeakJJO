<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
 <link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="resources/css/animate.css">

<link rel="stylesheet" href="resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="resources/css/magnific-popup.css">

<link rel="stylesheet" href="resources/css/aos.css">

<link rel="stylesheet" href="resources/css/ionicons.min.css">

<link rel="stylesheet" href="resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="resources/css/jquery.timepicker.css">


<link rel="stylesheet" href="resources/css/flaticon.css">
<link rel="stylesheet" href="resources/css/icomoon.css">
<link rel="stylesheet" href="resources/css/style.css">
</head>

<body>
    <section class="ftco-section">
        <div class="container">
            <div class="row" id="movieList">
            </div>

        </div>

    </section>
     <script type="text/javascript">
   
    $(document).ready(function(){

       console.log(${movie});
 	   console.log(${movie}.items);
 	   for(var field in ${movie}.items){
 	   		console.log(${movie}.items[field].title);
 		
    	   var list = $('#movieList');
 		   
           var first = $('<div>').attr('class','col-md-12');
           var second = $('<div>').attr('class','p-md-5');
           var image = $('<div>').attr('class', 'col-md-8 p-md-5 img img-2 d-flex justify-content-center align-items-center');
           var third = $('<div>').attr('class','property-wrap ftco-animate fadeInUp ftco-animated');
           var title = $('<div>').attr('class','mb-4');
           var content = $('<div>').attr('class','col-md-12');
           content.append('<p>' + 
        		   "배우: " + ${movie}.items[field].actor + "<br>" +
                   "감독: " + ${movie}.items[field].director + "<br>" +
                   "평점: " + ${movie}.items[field].userRating + "<br>" +
                   "<a href="+${movie}.items[field].link+">자세히보기</a>"+
        		   '</p>');
           title.append('</h3>' + ${movie}.items[field].title+ ${movie}.items[field].subtitle+'</h3>');
           third.append(title, content);
           image.append("<img src='"+${movie}.items[field].image+"'/>", third);
           second.append(image);
           first.append(second);
           list.append(first);
    	   }
    	   
    });
   
    </script>
    <!-- loader -->
   
  <script src="resources/js/jquery.min.js"></script>
  <script src="resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="resources/js/popper.min.js"></script>
  <script src="resources/js/bootstrap.min.js"></script>
  <script src="resources/js/jquery.easing.1.3.js"></script>
  <script src="resources/js/jquery.waypoints.min.js"></script>
  <script src="resources/js/jquery.stellar.min.js"></script>
  <script src="resources/js/owl.carousel.min.js"></script>
  <script src="resources/js/jquery.magnific-popup.min.js"></script>
  <script src="resources/js/aos.js"></script>
  <script src="resources/js/jquery.animateNumber.min.js"></script>
  <script src="resources/js/bootstrap-datepicker.js"></script>
  <script src="resources/js/jquery.timepicker.min.js"></script>
  <script src="resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="resources/js/google-map.js"></script>
  <script src="resources/js/main.js"></script>
    
  </body>
</html>

