<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
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
<style>
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: 50;
	font-style: normal;
}
</style>
   
<body>

      <div class="container" style="margin-top: 100px;">
      	<div class="row justify-content-center">
          <div class="col-md-12 heading-section text-center ftco-animate mb-5">
          	<span class="subheading">양택조의 모든지 알려줍니다</span>
            <h2 class="mb-2">${keyword }의 결과입니다.</h2>
          </div>
        </div>
      </div>
      
      
      <section class="ftco-section ftco-no-pb bg-dark">
			<div class="container">
				<div class="row no-gutters"> 
				<c:forEach items="${results.items }" var="item">
				  <a href="${item.link }">
				<c:if test="${!empty item.pagemap.cse_thumbnail[0].src}">
            	<div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(${item.pagemap.cse_thumbnail[0].src}); width:${item.pagemap.cse_thumbnail[0].width}px; height:${item.pagemap.cse_thumbnail[0].height}px">
					</div>
            	</c:if>
            	<c:if test="${empty item.pagemap.cse_thumbnail[0].src}">
            	<div class="col-md-auto p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url(resources/img/양택조Header.png); width:300px; height:300px">
					</div>
				</c:if>
				<br>
			<div class="col-md-12 bg-light py-md-auto ftco-animate fadeInUp ftco-animated">
	          <div class="heading-section p-md-5">
	          
	            <h2 class="mb-4" style="font-size: 20px;">${item.title }</h2>
	            <p style="font-size: 15px;">${item.snippet }</p>
	        
	          </div>
				</div>
				</a>
				 <br>
					   
				
					   </c:forEach>
					  
	
				</div>
			</div>
		</section>
    

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