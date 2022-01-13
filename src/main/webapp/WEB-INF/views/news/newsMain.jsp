<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>NMT test</title>

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
<div class="row justify-content-center mb-5" style="margin-top:80px;">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">양택조가 실시간으로 알려주는</span>
            <h2 class="mb-3">양택조 뉴스</h2>
          </div>
        </div>
<section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row" style="background-color:ghostwhite; height:120px;">
          <div class="col-md-4 justify-content-center counter-wrap ftco-animate">
            <div class="block-36 py-3 mb-3">
              <div class="text text-border d-flex align-items-center">
                <strong class="number" style="font-size:1.4vw">코로나<br>현황</strong>
                <span id="updateDay">기준</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-4 justify-content-center counter-wrap ftco-animate">
            <div class="block-36 py-3 mb-3">
              <div class="text text-border d-flex align-items-center">
                <strong class="number" id="decideCnt">0</strong>
                <span>누적 <br>확진자수</span>
              </div>
            </div>
          </div>
          
          <div class="col-md-4 justify-content-center counter-wrap ftco-animate">
            <div class="block-36 py-3 mb-3">
              <div class="text text-border d-flex align-items-center">
                <strong class="number" id="deathCnt">0</strong>
                <span>국내 <br>사망자수</span>
              </div>
            </div>
          </div>
        </div>
    	</div>
    </section>
    
    
 <section class="ftco-section ftco-agent ftco-no-pt" style="margin-top:30px">
    	<div class="container">
    		<div class="row justify-content-center pb-5">
          <div class="col-md-12 heading-section text-center ftco-animate">
          	<span class="subheading">실시간</span>
            <h2 class="mb-4">핫 이슈</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-3 ftco-animate">
        		<div class="agent">
    					<div class="img">
		    				<img src="resources/images/team-1.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="desc">
	    					<h3><a href="properties.html">James Stallon</a></h3>
								<p class="h-info"><span class="location">Listing</span> <span class="details">&mdash; 10 Properties</span></p>
	    				</div>
    				</div>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<div class="agent">
    					<div class="img">
		    				<img src="resources/images/team-2.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="desc">
	    					<h3><a href="properties.html">James Stallon</a></h3>
								<p class="h-info"><span class="location">Listing</span> <span class="details">&mdash; 10 Properties</span></p>
	    				</div>
    				</div>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<div class="agent">
    					<div class="img">
		    				<img src="resources/images/team-3.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="desc">
	    					<h3><a href="properties.html">James Stallon</a></h3>
								<p class="h-info"><span class="location">Listing</span> <span class="details">&mdash; 10 Properties</span></p>
	    				</div>
    				</div>
        	</div>
        	<div class="col-md-3 ftco-animate">
        		<div class="agent">
    					<div class="img">
		    				<img src="resources/images/team-4.jpg" class="img-fluid" alt="Colorlib Template">
	    				</div>
	    				<div class="desc">
	    					<h3><a href="properties.html">James Stallon</a></h3>
								<p class="h-info"><span class="position">Listing</span> <span class="details">&mdash; 10 Properties</span></p>
	    				</div>
    				</div>
        	</div>
        </div>
    	</div>
    </section>
        
        
	<script>
		$(document).ready(function() {
			var covid = '${covid }';

			let parser, xmlDoc;
			parser = new DOMParser();
			xmlDoc = parser.parseFromString(covid, "text/html");
			console.log(xmlDoc);
			console.log(xmlDoc.getElementsByTagName('item')[0].childNodes[0].childNodes[0].nodeValue);

			
			document.getElementById('updateDay').innerHTML = xmlDoc.getElementsByTagName('item')[0].childNodes[1].childNodes[0].nodeValue + " 기준";
			
			document.getElementById('deathCnt').dataset.number = xmlDoc.getElementsByTagName('item')[0].childNodes[2].childNodes[0].nodeValue;
			document.getElementById('decideCnt').dataset.number = xmlDoc.getElementsByTagName('item')[0].childNodes[3].childNodes[0].nodeValue;
			
			//document.getElementById('deathCnt').innerHTML 
			//= xmlDoc.getElementsByTagName('item')[0].childNodes[0].childNodes[0].nodeValue;
			

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
	<script src="resources/js/main.js"></script>
</body>
</html>