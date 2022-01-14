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


	<section class="ftco-section goto-here">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">양택조와 함께하는</span>
					<h2 class="mb-2">프리미엄 번역기</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-2">
				</div>
				<div class="col-md-3" style="height: 300px">
					<select name="language" id="language">
						<optgroup label="언어">
							<option value="ko">한국어</option>
							<option value="en">영어</option>
						</optgroup>
					</select>
					<textarea id="send_text" class="form-control" name="content"
						cols="1" rows="1" placeholder="보낼값"></textarea>
				</div>
				<div class="col-md-2">
					<div class="mouse" style="padding-bottom: 150px;">
						<div class="mouse-icon" id="jsonConvertStringSend">
							<div class="mouse-wheel" >
								<span class="icon-long-arrow-right mr-2"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-3" style="height: 300px">
					<textarea id="result_text" class="form-control" name="content"
						cols="1" rows="1" placeholder="결과값" readonly
						style="margin-top: 30px;"></textarea>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</section>
	<script>
		//번역을 위해서 button 이벤트를 위해서 사용하는 것
		$('#jsonConvertStringSend').click(function() {
			//번역할 object를 생성
			var word = $("#send_text").val();
			//console.log($("#send_text").val());
			//console.log($("#language").val());
			jsonSend(word);
		});
		function jsonSend(word) {
			var language = $("#language").val();
			$.ajax({
				type : "POST",
				url : "papagoTranslation.do",
				data : {
					"word" : word ,
					"language" : language
				},
				success : function(data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
					//console.log(data);
					//alert(data);

					//string의 값을 object 형식으로 변환합니다.
					var result_obj = JSON.parse(data);
					//결과값을 textarea에 넣기 위해서
					$("#result_text").val(
							result_obj.message.result.translatedText);
				},
				error : function(e) {
					console.log(e);
					alert('실패했습니다.');
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
	<script src="resources/js/google-map.js"></script>
	<script src="resources/js/main.js"></script>
</body>
</html>