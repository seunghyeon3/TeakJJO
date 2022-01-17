<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>NMT test</title>


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
<style>
	@font-face {
    font-family: 'HSYuji-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/HSYuji-Regular.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>

<body>
<div class="row justify-content-center mb-5" style="margin-top:80px;">
          <div class="col-md-7 text-center heading-section ftco-animate">
          	<span class="subheading">양택조가 실시간으로 알려주는</span>
            <h2 class="mb-3">양택조 뉴스</h2>  <c:if test="${fn:contains(memberinfo.member_Author, 'P')}"><a class= "btn btn-primary py-3 px-5" href="newsInsertForm.do" style="float:right">뉴스 기사 등록</a></c:if>
          </div>
        </div>
         
        <%@include file="newsMenu.jsp" %>
        <br>
<section class="ftco-counter img" id="section-counter">
    	<div class="container">
    		<div class="row" style="background-color:ghostwhite; height:120px;">
          <div class="col-md-4 justify-content-center counter-wrap ftco-animate">
            <div class="block-36 py-3 mb-3">
              <div class="text text-border d-flex align-items-center" style="margin-top: 12px;">
                <strong class="number" style="font-size:1.8vw">코로나 현황</strong>
                <span id="updateDay"></span>
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
        	<c:forEach items="${newsList }" var="news" begin="0" end="3">
        	
        	<div class="col-md-3 ftco-animate">
        		<div class="agent">
    					<div class="img">
		    				<img src="resources/img/${news.newsboard_pfile }" class="img-fluid" alt="Colorlib Template" style="width:240px; height:350px;">
	    				</div>
	    				<div class="desc" style="padding:5px">
	    					<p style="font-size:1.8vw"><a href="newsDetail.do?newsboard_id=${news.newsboard_id}" onclick="hitUpdate(`${news.newsboard_id }`)" id="newsboard_title">조회수 ${news.newsboard_hit } 돌파!!</a></p>
								<p class="h-info"><span class="details">장르 : ${news.newsboard_genre }</span></p>
	    				</div>
    				</div>
        	</div>
        	</c:forEach>
        </div>
    	</div>
    </section>
        
	<script>
		$(document).ready(function() {
			
			  /*   //Check if the current URL contains '#'
			    if(document.URL.indexOf("#")==-1){
			        // Set the URL to whatever it was plus "#".
			        url = document.URL+"#";
			        location = "#";

			        //Reload the page
			        location.reload(true);
			    } */
			
			
			var covid = '${covid }';

			let parser, xmlDoc;
			parser = new DOMParser();
			xmlDoc = parser.parseFromString(covid, "text/html");
			console.log(xmlDoc);
			console.log(xmlDoc.getElementsByTagName('item')[0].childNodes[0].childNodes[0].nodeValue);

			var updateDay = xmlDoc.getElementsByTagName('item')[0].childNodes[1].childNodes[0].nodeValue;
			updateDay = updateDay.substr(0,10);
			
			document.getElementById('updateDay').innerHTML = updateDay + " 기준";
			
			document.getElementById('deathCnt').innerHTML = xmlDoc.getElementsByTagName('item')[0].childNodes[2].childNodes[0].nodeValue;
			document.getElementById('decideCnt').innerHTML = xmlDoc.getElementsByTagName('item')[0].childNodes[3].childNodes[0].nodeValue;
			
			//data.number
			//document.getElementById('deathCnt').innerHTML 
			//= xmlDoc.getElementsByTagName('item')[0].childNodes[0].childNodes[0].nodeValue;
			
		
		});
		
		
	</script>
      <script>
    	function hitUpdate(newsboard_id){
    		console.log(newsboard_id);
    		var newsboard_id = newsboard_id;
    			 $.ajax({
 					type : "POST",
 					url : "newsHitUpdate.do",	
 					data : {
 						"newsboard_id" : newsboard_id
 					},
 					success : function(data){
 						console.log(data);
 					}
 					
 				}); 
    	}
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