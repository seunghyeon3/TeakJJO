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
</head>

<body>
	<div style="float: right; margin-top: 50px;">
		<!-- Topbar Search -->
		<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" class="form-control bg-light border-0 small" placeholder="Serach for..."
					aria-label="Search" aria-describedby="basic-addon2" id="token" name="token" autofocus="autofocus">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button" onclick="getYoutube()">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
	</div>

	<div style="display: none; margin-top: 100px;" id="showList"></div>
	<!-- 검색 결과없을때 택조형 얼굴 출현 -->
	<div class="text text-center" style="margin-top: 300px" id="banner">
		<input type="hidden" value="NO" id="flag">
		<div class="mb-4">
			<img src="resources/img/양택조Header.png">
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>
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
					if ($('#flag').val() == 'NO') {
						$('#flag').val('YES');
					} else if ($('#flag').val() == 'YES') {
						$('#showList').empty();
					}
					$('#banner').css('display', 'none');
					let youtubeBoard = $('#showList').css('display', 'block');
					for (let count in result.items) {

						youtubeBoard.append($('<div>').append(
							$('<a>').attr('href', 'https://www.youtube.com/watch?v=' + result.items[count]
								.id.videoId).append(
								$('<img>').attr('src', result.items[count].snippet.thumbnails.default
									.url).css('width', '250px'), $('<p>').text(result.items[count].snippet.title)
							)))
					}
				},
				error: function (error) {
					window.alert(error);
				}
			});
		}
	</script>
</body>

</html>