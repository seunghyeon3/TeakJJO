<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="container" >
			<div class="row" id="movieList">
			</div>
		</div>
	</section>
	<script type="text/javascript">
   
    $(document).ready(function(){
		if(${movie}.display == 0 || ${movie}.errorCode == "SE01"){
			alert("검색결과가 없습니다.");
			history.go(-1);
		}else{
       console.log(${movie});
 	   console.log(${movie}.items);
 	   for(var field in ${movie}.items){
 	       var movieImg = ${movie}.items[field].image;
    	   var list = $('#movieList');
 		   
           var first = $('<div>').attr('class','col-md-4');
           var second = $('<div>').attr('class', 'property-wrap ftco-animate fadeInUp ftco-animated');
           var third = $('<div>').attr('class', 'text').css('width', '370px');
           var title = $('<div>').attr('class','heading').css('text-align','center');
           var image = $('<div>').attr('class', 'block-20 img').css('text-align','center');;
           var content = $('<p>');
           content.append('<p>' + 
        		   "배우: " + ${movie}.items[field].actor + "<br>" +
                   "감독: " + ${movie}.items[field].director + "<br>" +
                   "평점: " + ${movie}.items[field].userRating + "<br>" +
                   "<a href="+${movie}.items[field].link+">자세히보기</a>"+
        		   '</p>');
           image.append($('<img>').attr({
        	   'src' : movieImg,
         	   'width' : '200px'}));
           title.append('<h5>' + ${movie}.items[field].title+'<br>'+ ${movie}.items[field].subtitle+'</h5>');
           third.append(title, image, content);       
           second.append(third);
           first.append(second);
           list.append(first);
    	   }
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="resources/js/google-map.js"></script>
	<script src="resources/js/main.js"></script>

</body>
</html>

