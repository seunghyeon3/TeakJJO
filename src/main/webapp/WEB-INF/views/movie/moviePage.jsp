<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/myPage.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel='stylesheet' href='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css' />
<script src='//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js'></script>
<link rel="stylesheet" href="resources/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
</head>
<body>
	<div>
		<div class="my-page-container">
			<div class="my-page-wrapper">
				<div class="my-page-header">예약한 영화 목록</div>
				<div class="movie-reserve-list">
					<div class="movie-reserve">
						<div class="movie-reserve-age">등급</div>
						<div class="movie-reserve-title">제목이다다다</div>
						<div class="movie-reserve-theater-wrapper">
							<div>영화관으능</div>
							&nbsp;/&nbsp;
							<div class="ticket-numeber">티켓넘버
							</div>
						</div>
						<div class="movie-reserve-seats">좌석</div>
						<div class="movie-reserve-date-wrapper">
							<div class="movie-reserve-date">관람이이일</div>
							<div class="movie-reserve-runningTime">상영시가아아안</div>
						</div>
						<div class="movie"></div>

						<div class="pay-information-wrapper">
							<div class="pay-information-date-wrapper">
								<div class="pay-information-date-title">결제한 날</div>
								<div class="pay-information-date">예약한날아아아</div>
							</div>

							<div class="pay-information-money-wrapper">
								<div class="pay-information-money-title">결제한 비용</div>
								<div class="pay-information-money">10000000원
								</div>
							</div>

							<div class="barcode-wrapper">
								<div>CGV</div>
								<img src="resources/img/barcode.png">
							</div>

						</div>
					</div>
					<!-- <div class="movie-reserve">
						<div class="movie-reserve-age">15세이상 관람가</div>
						<div class="movie-reserve-title">겨울왕국2</div>
						<div class="movie-reserve-theater-wrapper">
							<div>CGV 강남 1관 3층</div>
							&nbsp;/&nbsp;
							<div class="ticket-numeber">1명</div>
						</div>
						<div class="movie-reserve-seats">A01, A02</div>
						<div class="movie-reserve-date-wrapper">
							<div class="movie-reserve-date">2019.11.22 (금)</div>
							<div class="movie-reserve-runningTime">24:10 ~ 26:03</div>
						</div>
						<div class="movie"></div>

						<div class="pay-information-wrapper">
							<div class="pay-information-date-wrapper">
								<div class="pay-information-date-title">결제한 날</div>
								<div class="pay-information-date">2020-03-07-00시</div>
							</div>

							<div class="pay-information-money-wrapper">
								<div class="pay-information-money-title">결제한 비용</div>
								<div class="pay-information-money">60000원</div>
							</div>

							<div class="barcode-wrapper">
								<div>CGV</div>
								<img src="images/barcode.png">
							</div>

						</div>
					</div> -->
				</div>

			</div>
		</div>
	</div>
</body>
</html>