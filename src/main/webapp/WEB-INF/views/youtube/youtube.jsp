<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<!-- Custom fonts for this template-->
	<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
		rel="stylesheet">

	<!-- Custom styles for this template-->
	<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
	<link rel="stylesheet" href="resources/css/style.css">
	<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
	<link rel="stylesheet" href="resources/css/animate.css">
	<link rel="stylesheet" href="resources/css/ionicons.min.css">
</head>
<style>
	@font-face {
		font-family: 'yg-jalnan';
		src:
			url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff') format('woff');
		font-weight: normal;
		font-style: normal;
	}
</style>

<body>
<div class="container" style="margin-top: 100px;">
		<div class="row justify-content-center">
			<div class="col-md-12 heading-section text-center ftco-animate mb-5">
				<span class="subheading">양택조의 모든 보여줘</span>
				<h2 class="mb-2">택튜브</h2>
			</div>
		</div>
	</div>
	<div style="float: right; margin-top: 10px; margin-right: 50px;">
		<!-- Topbar Search -->
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Serach for..." aria-label="Search"
					aria-describedby="basic-addon2" id="token" name="token" autofocus="autofocus">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button" onclick="getYoutube()">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
	</div>

	<div style="display: none; margin-top: 100px;" id="showList" class="ftco-section ftco-agent bg-dark">
		<div class="container">
			<div class="row" id="attach">
			</div>
		</div>
	</div>
	
	<input type="hidden" value="NO" id="flag">
	<div style="display: block; margin-top: 100px;" id="showList2" class="ftco-section ftco-agent bg-dark">
		<div class="container">
			<div class="row" id="attach2">
			</div>
		</div>
	</div>
	
	
<!-- 	
	<div class="text text-center" style="margin-top: 300px" id="banner">
		<input type="hidden" value="NO" id="flag">
		<div class="mb-4">
			<img src="resources/img/양택조Header.png">
		</div>
	</div>
	 -->

	<!-- Bootstrap core JavaScript-->
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
	<script src="resources/js/main.js"></script>
	<script>
		function getYoutube() {
			let token = $('#token').val();
			$.ajax({
				url: "getYoutube.do",
				method: "get",
				data: {
					token: token
				},
				success: function (result) {
					console.log(result);
					if ($('#flag').val() == 'NO') {
						$('#flag').val('YES');
					} else if ($('#flag').val() == 'YES') {
						$('#attach2').empty();
						$('#title').remove();
					}
					$('#showList2').css('display', 'none');
					$('#showList').css('display', 'block')
					$('#attach').empty();
					$('#header').append($('<h2>').text("- " + token + "의 검색 결과 -").css('color', 'red').attr('id', 'title'));
					for (let count in result.items) {
						$('#attach').append(
							$('<div>').attr('class', 'col-md-3').append(
								$('<div>').attr('class', 'agent').append(
									$('<div>').attr('class', 'img').append(
										$('<a>').attr('href', 'https://www.youtube.com/watch?v=' + result.items[count].id.videoId).append(
											$('<img>').attr('src', result.items[count].snippet.thumbnails.default.url).css('width', '250px'),)),
											$('<div>').attr('class', 'desc').append($('<p>').text(result.items[count].snippet.title))
							)
						))
					}
				},
				error: function (error) {
					window.alert(error);
				}
			});
		}
	</script>
	<script>
	$(document).ready(function () {
				$.ajax({
					method : 'get',
					url:"getYoutube.do",
					data : {
						token: "양택조"
					},
					success : function(result){
					for (let count in result.items) {
						$('#attach2').append(
							$('<div>').attr('class', 'col-md-3').append(
								$('<div>').attr('class', 'agent').append(
									$('<div>').attr('class', 'img').append(
										$('<a>').attr('href', 'https://www.youtube.com/watch?v=' + result.items[count].id.videoId).append(
											$('<img>').attr('src', result.items[count].snippet.thumbnails.default.url).css('width', '250px'),)),
											$('<div>').attr('class', 'desc').append($('<p>').text(result.items[count].snippet.title))
							)
						))
					}
					},
					error:function(error){
						console.log(error);
					}
				});
			});
	</script>
</body>

</html>