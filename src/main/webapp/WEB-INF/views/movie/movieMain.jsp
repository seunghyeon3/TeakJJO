<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

	<link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
		rel="stylesheet">

	<link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
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
		.black_overlay {
			display: none;
			position: absolute;
			top: 0%;
			left: 0%;
			width: 100%;
			height: 100%;
			background-color: black;
			z-index: 1001;
			-moz-opacity: 0.8;
			opacity: .80;
			filter: alpha(opacity=80);
		}

		.white_content {
			display: none;
			position: absolute;
			top: -3px;
			left: 25%;
			width: 60%;
			height: 50%;
			padding: 16px;
			border: 16px solid #78b5fb;
			background-color: white;
			z-index: 1002;
			overflow: auto;
		}

		.buttonGroup {
			height: 100%;
			position: relative;
			top: 5vw;
			left: 42vw;
			align-items: center;
			justify-content: center;
		}

		.movieGO {
			
			width: 140px;
			height: 45px;
			font-family: 'Roboto', sans-serif;
			font-size: 1rem;
			text-transform: uppercase;
			letter-spacing: 2.5px;
			font-weight: bold;
			color: #000;
			background-color: #fff;
			border: none;
			border-radius: 45px;
			box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
			transition: all 0.3s ease 0s;
			cursor: pointer;
			outline: none;
		}

		.movieGO:hover {
			background-color: #ff0037;
			box-shadow: 0px 15px 20px rgba(86, 154, 243, 0.4);
			color: #fff;
			transform: translateY(-7px);
		}

		#section {
			position: relative;
			top: 5vw;
		}

		.tit_section {
			font-size: 24px;
			line-height: 28px;
			color: #000;
		}
	</style>

</head>

<body>
		<div class="col-md-12 heading-section text-center ftco-animate mb-5" style="margin-top: 80px; margin-bottom: 0px;">
			<span class="subheading">양택조가 추천하는</span>
			<h2 class="mb-2">프리미엄 영화</h2>
		</div>
<div style="position: relative; top : -75px;">
	<div class="buttonGroup">
		<button type="button" class="movieGO" onclick="location.href='movieMain.do'">홈</button>
		&nbsp&nbsp
		<button type="button" class="movieGO" onclick="location.href='reserve.do'">영화예약</button>
	</div>
	
	<section class="ftco-section ftco-agent" id="section" style="padding-top: 30px;">
		<div class="container">
			<h3 class="tit_section">박스오피스</h3>
			<div class="row" id="mainBox"></div>
			<div id="light" class="white_content">
				<a href="javascript:void(0)"
					onclick="document.getElementById('light').style.display='none'; document.getElementById('fade').style.display='none'">Close
				</a> <br> <br>
				<div id="detail"></div>
				<div class="ftco-counter img">
					<div class="container">
						<div class="row">
							<div>
								<div class="text text-border">
									<h3 style="cursor: pointer; text-align: center; width: 210px;" id="comment"
										onclick="listComment()">리뷰</h3>
								</div>
								<div id="insertComment" style="display: none;">
									<textarea cols="80" rows="2" name="mc_content" id="mc_content"
										placeholder="댓글을 입력하세요"></textarea>
									<input type="button" value="댓글등록" onclick="insertComment()">
									<div id="addMc">
									</div>
								</div>
							</div>
							<div style="padding-left: 30px;">
								<div class="text text-border">
									<h3 style="cursor: pointer; width: 210px; " id="time"
										onclick="window.open('http://section.cgv.co.kr/theater/timetable/Default.aspx')">
										상영시간표</h3>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="fade" class="black_overlay"></div>
			<div class="col-lg-8 col-md-6" style="margin-left: 15vw;">
				<div class="text text-center">
					<form action="searchMovie.do" class="search-location mt-md" onsubmit = "return searchMovie()">
						<div class="col-lg-10 align-items-end">
							<div class="form-group">
								<div class="form-field">
									<input type="text" class="form-control bg-light" placeholder="Search movie..."
										id="movie" name="movie" style="border: 2px solid black">
									<button type="submit">
										<span class="ion-ios-search"></span>
									</button>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
					<div class="col-md-12 heading-section text-center ftco-animate mb-5" style="margin-top: 30px;">
						<h2 class="mb-2">프리미엄 영화신작</h2>
					</div>
			<div class="row" id="upcoming"></div>
		</div>
	</section>
</div>
	<script>
		document.addEventListener('DOMContentLoaded', () => {
			list();
		});

		function list() {
			$.ajax({
				type: 'get', // 통신방식 (GET/POST)
				dataType: 'xml', // 서버로부터 응답 받을 데이터 형식
				url: "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=99d306caf67df13317be3e4ab8240af3&targetDt=20220110&weekGb=0", // 통신할 대상 페이지가 있는 url 주소
				success: function (data) {
					console.log(data);
					var mainBox = $('#mainBox');
					for (var i = 0; i < 8; i++) {
						
						var movieName = $(data).find('weeklyBoxOffice').eq(i).find('movieNm').text();
						var movieDate = $(data).find('weeklyBoxOffice').eq(i).find('openDt').text();
						var detail = $(data).find('weeklyBoxOffice').eq(i).find('movieCd').text();
						var one = $('<div>').attr('class',
							'col-md-3 d-flex ftco-animate fadeInUp ftco-animated');
						var two = $('<div>').attr('class', 'member');
						var three = $('<div>').attr('class',
							'blog-entry justify-content-end'); //이미지
						var four = $('<div>').attr('class', 'text').css('text-align', 'center');
						var title = $('<div>').attr('class', 'heading');
						var date = $('<p>');
						date.append(movieDate);
						title.append($('<a>').attr({
							'href': 'javascript:void(0)',
							'text-align': 'center',
							'onclick': "movieDetail(" + detail + ")"
						}).text(movieName));
						four.append(title, date);
						three.append($('<img>').attr({
							'src': boxOffice[i].img,
							'class': 'img-fluid',
							'width': '300px',
							'height': '200px'
						}), four);
						two.append(three);
						one.append(two);
						mainBox.append(one);
					}

				}, // 통신이 성공했을 때 수행될 콜백 함수
				error: function (req) {
					alert('통신을 실패하였습니다. 상태 : ' + req.status + ', ' + req.requestText + ', ' + req
						.error);
				} // 통신이 실패했을 때 수행될 콜백 함수     
			});

		};
		//  천 단위 ,(콤마) 찍기
		function numberToString(audiAcc) {
			return audiAcc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}

		function movieDetail(detail) {
			document.getElementById('light').style.display = 'block';
			document.getElementById('fade').style.display = 'block';
			$.ajax({
				type: 'get',
				dataType: 'json', // 서버로부터 응답 받을 데이터 형식
				url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=99d306caf67df13317be3e4ab8240af3&movieCd=' +
					detail,
				success: function (data) {
					$('#detail').children().remove();

					var list = $('#detail');
					var main = $('<div>').attr('class', 'col-md-12 mb-md-5');
					var title = $('<div>').attr('class', 'testimony-wrap py-4');
					var content = $('<div>');
					var info = $('<div>');
					content.append(info);
					title.append('<h2 style="text-align:center" id="movieDetail">' +
						data.movieInfoResult.movieInfo.movieNm + '<br>' +
						data.movieInfoResult.movieInfo.movieNmEn +
						'<h2/>', content);
					main.append(title);
					list.append(main);

					for (var field in data.movieInfoResult.movieInfo) {
						if (field == 'nations') {
							for (var object in data.movieInfoResult.movieInfo[field])
								info.append('<p>' +
									data.movieInfoResult.movieInfo[field][object].nationNm +
									" | " + data.movieInfoResult.movieInfo.showTm +
									" | " + data.movieInfoResult.movieInfo.openDt +
									'</p>');

						} else if (field == 'audits') {
							for (var object in data.movieInfoResult.movieInfo[field])
								info.append('<p>' +
									"관람등급 | " + data.movieInfoResult.movieInfo[field][object].watchGradeNm +
									'</p>');
						} else if (field == 'genres') {
							for (var object in data.movieInfoResult.movieInfo[field])
								info.append('<span>' +
									data.movieInfoResult.movieInfo[field][object].genreNm + " | " +
									'</span>');
						} else if (field == 'actors') {
							for (var object in data.movieInfoResult.movieInfo[field])
								info.append('<span>' +
									data.movieInfoResult.movieInfo[field][object].peopleNm + " | " +
									'</span>');
						} else if (field == 'directors') {
							for (var object in data.movieInfoResult.movieInfo[field])
								info.append('<p>' +
									"감독 |  " + data.movieInfoResult.movieInfo[field][object].peopleNm +
									'</p>');
						} else if (field == 'companys') {
							for (var i = 0; i < 1; i++) {
								info.append('<p>' +
									"배급사 |  " + data.movieInfoResult.movieInfo[field][i].companyNm +
									'</p>');
							}
						}
					}
				},
				error: function (req) {
					alert('통신을 실패하였습니다. 상태 : ' + req.status + ', ' + req.requestText + ', ' + req.error);
				}
			});
		}
		$(function () {
			$('#comment').click(function () {
				$('#insertComment').show();

			});
			$('#time').click(function () {
				$('#insertComment').hide();
			})
		});
	</script>
	<script>
		function insertComment() {
			var movieName = $('#movieDetail').text();
			$.ajax({
				url: 'insertComment.do',
				type: 'post',
				data: {
					comment: $('#mc_content').val(),
					movieName: movieName.toString()
				},
				success: function (data) {
					$('#addMc').empty();
					$('#mc_content').val('');
					for (var field of data) {						
						$('#addMc').append(
							$('<p>').text(field.mc_id).attr('id', 'movieNm'),
							$('<span>').text(field.mc_content),
							$('<span>').text(field.member_id),
							$('<button>').text('수정').click(modifyCommFnc()),
							$('<button>').text('삭제').click(deleteCommFnc())
						)
					}
				}
			});
		}

		function listComment() {
			var movieName = $('#movieDetail').text();
			$.ajax({
				url: 'listComment.do',
				type: 'post',
				data: {
					movieName: movieName.toString()
				},
				success: function (data) {
					for (var field of data) {						
						$('#addMc').append(
							$('<p>').text(field.mc_id).attr('id', 'movieNm'),
							$('<span>').text(field.mc_content),
							$('<span>').text(field.movid_id),
							$('<button>').text('수정').click(modifyCommFnc()),
							$('<button>').text('삭제').click(deleteCommFnc())
						)
					}
				}
			});
		}

		function modifyCommFnc() {
			/* var movieName = $('#movieDetail').text();
			$.ajax({
				url: 'deleteComment.do',
				type: 'post',
				data: {
					movieNm: parseInt($('#movieNm').text()),
					movieName: movieName.toString()
				},
				success: function (data) {
					
				}

		} */
		}
		function deleteCommFnc() {
			var movieName = $('#movieDetail').text();
			$.ajax({
				url: 'deleteComment.do',
				type: 'post',
				data: {
					movieNm: parseInt($('#movieNm').text()),
					movieName: movieName.toString()
				},
				success: function (data) {
					for (var field of data) {
						$('#addMc').append(
							$('<p>').text(field.mc_id).attr('id', 'movieNm'),
							$('<span>').text(field.mc_content),
							$('<span>').text(field.movid_id),
							$('<button>').text('수정').click(modifyCommFnc()),
							$('<button>').text('삭제').click(deleteCommFnc())
						)
					}
				}
			});
		}
	</script>

	<script>
		var boxOffice; //전역선언
		$.ajax({
			url: 'boxOffice.do',
			type: 'get',
			async: false,
			success: function (data) {
				data = JSON.parse(data);
				boxOffice = data;
			}
		});
	</script>
	<script>
		$.ajax({
			method: "GET",
			url: "https://api.themoviedb.org/3/movie/upcoming?api_key=3b107430820d0cf4938ce577256667d7&language=ko-KR",
			headers: {
				Authorization: "Bearer 3b107430820d0cf4938ce577256667d7"
			}
		}).done(function (msg) {

			var img = "https://image.tmdb.org/t/p/w300/";
			var upComing = $('#upcoming');

			for (var i = 0; i < 4; i++) {

				var first = $('<div>').attr('class', 'col-md-3 ftco-animate fadeInUp ftco-animated');
				var second = $('<div>').attr('class', 'agent');
				var image = $('<div>').attr('class', 'img');
				var third = $('<div>').attr('class', 'desc').css({
					'width': '260px',
					'margin-left': '10px'
				});
				var title = $('<h3>');
				var content = $('<p>').attr('class', 'h-info');
				content.append(msg.results[i].overview);
				title.append('<h3>' + msg.results[i].title + '</h3>');
				third.append(title, content);
				image.append($('<img>').attr({
					'src': img + msg.results[i].poster_path,
					'class': 'img-fluid'
				}), third);
				second.append(image);
				first.append(second);
				upComing.append(first);

			}
		});
		
		function searchMovie(){
			if($("#movie").val() == ""){
				alert("검색어를 입력하세요.");
				return false
			}else {
				return true;
			}
				
		}
		
	</script>

	<!-- loader -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
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
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false">
	</script>
	<script src="resources/js/google-map.js"></script>
	<script src="resources/js/main.js"></script>

</body>

</html>