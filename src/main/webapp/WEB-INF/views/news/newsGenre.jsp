<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<section class="ftco-section ftco-no-pt" style="margin-top:80px;">
      <div class="container">
        <div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">${genre }</span>
          	
            <h2 type="button" onclick="location.href='newsMain.do'">뉴스</h2>
         
          </div>
        </div>
        <%@include file="newsMenu.jsp" %>
        <br>
        <div class="row d-flex" id="newsAll">

          <c:forEach items="${newsList }" var="news">
	   				<div class="col-md-3 d-flex ftco-animate">
          			<div class="blog-entry justify-content-end">
              		<div class="text">
                		<h3 class="heading"><a href="newsDetail.do?no=${news.newsboard_title }&newsboard_id=${news.newsboard_id}" onclick="hitUpdate(`${news.newsboard_title }`)" id="newsboard_title">${news.newsboard_title }</a></h3>
                		<div class="meta mb-3">
                		   <h6>${news.newsboard_date }</h6>

                 		 <h6>${news.member_name } 기자</h6>
                 		 <h6>조회수 ${news.newsboard_hit }</h6>
                		</div>
                <a href="newsDetail.do?no=${news.newsboard_title }&newsboard_id=${news.newsboard_id}" onclick="hitUpdate(`${news.newsboard_title }`)" id="newsboard_title" class="block-20 img" style="background-image: url('resources/img/${news.newsboard_pfile }');">
	              </a>
					</div>
      				</div>
     				</div>
				</c:forEach>  
          
        </div>
      </div>
    </section>	
      <script>
    	function hitUpdate(title){
    		console.log(title);
    		var newsboard_title = title;
    			 $.ajax({
 					type : "POST",
 					url : "newsHitUpdate.do",	
 					data : {
 						"title" : title
 					},
 					success : function(data){
 						console.log(data);
 					}
 					
 				}); 
    	}
    </script>
    <!-- <script>
   		 $(document).ready(function(){
    		});
    </script> -->
    
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
	<script src="resources/js/main.js"></script>
</body>
</html>