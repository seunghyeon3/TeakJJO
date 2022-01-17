<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<link href="resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style.css">
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="resources/css/animate.css">
<link rel="stylesheet" href="resources/css/ionicons.min.css">
</head>

<body>

<!-- 데이터 로딩 후 맵에 뿌려주면 끝. -->
<div class="text text-center" style="margin-top: 100px">
		<h1 class="mb-4" id="header">
			양택조와 함께하는<br>&lt;부동산&gt;
		</h1>
	</div>
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b98d90a6460baca25acca436d31ef5c&libraries=services,clusterer">
	</script>

	<script>
		//아작스 호출로 데이터 넣으면 끘!
		$(document).ready(function () {
			$.ajax({
				method: 'get',
				url: 'getRealty.do',
				success: function (result) {

					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
							level: 3
							// 지도의 확대 레벨
						};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);

					var imageSrc = 'resources/img/양택조Header.png',
						imageSize = new kakao.maps.Size(
							30, 30), // 마커이미지의 크기입니다
						imageOption = {
							offset: new kakao.maps.Point(27, 69)
						}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

					var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
							imageOption),
						markerPosition = new kakao.maps.LatLng(37.54699,
							127.09598); // 마커가 표시될 위치입니다

					//마커가 표시될 위치입니다 
					var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position: markerPosition,
						image: markerImage,
						clickable: true
					});

					// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
					// marker.setMap(null);

					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new kakao.maps.MapTypeControl();

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
					marker.setMap(map);

					var iwContent =
						'<div style="padding:3px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue; font-size:5px;" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue; font-size:5px;" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다
					// 마커가 지도 위에 표시되도록 설정합니다
					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
						position: iwPosition,
						content: iwContent
					});
					// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
					// 마커에 마우스오버 이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'mouseover', function () {
						// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
						infowindow.open(map, marker);
					});

					// 마커에 마우스아웃 이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'mouseout', function () {
						// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
						infowindow.close();
					});
				},error:function(error){
					console.log(error);
				}


			})
		})
	</script>
</body>

	<!-- 데이터 로딩 후 맵에 뿌려주면 끝. -->
	<div class="container" style="margin-top: 100px;">
		<div class="row justify-content-center">
			<div class="col-md-12 heading-section text-center ftco-animate mb-5">
				<span class="subheading">양택조의 부동산</span>
				<h2 class="mb-2">택동산</h2>
			</div>
		</div>
	</div>

	<section class="ftco-section ftco-no-pb">
		<div class="container">
			<div class="row no-gutters">
				<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
		</div>
	</section>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b98d90a6460baca25acca436d31ef5c&libraries=services,clusterer">
		
	</script>


	<script>
		//아작스 호출로 데이터 넣으면 끘!
		$(document)
				.ready(
						function() {
							$
									.ajax({
										method : 'get',
										url : 'getRealty.do',
										success : function(result) {

											var mapContainer = document
													.getElementById('map'), // 지도를 표시할 div 
											mapOption = {
												center : new kakao.maps.LatLng(
														33.450701, 126.570667), // 지도의 중심좌표
												level : 3
											// 지도의 확대 레벨
											};

											// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
											var map = new kakao.maps.Map(
													mapContainer, mapOption);

											var imageSrc = 'resources/img/양택조Header.png', imageSize = new kakao.maps.Size(
													30, 30), // 마커이미지의 크기입니다
											imageOption = {
												offset : new kakao.maps.Point(
														27, 69)
											}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

											var markerImage = new kakao.maps.MarkerImage(
													imageSrc, imageSize,
													imageOption), markerPosition = new kakao.maps.LatLng(
													37.54699, 127.09598); // 마커가 표시될 위치입니다

											//마커가 표시될 위치입니다 
											var markerPosition = new kakao.maps.LatLng(
													33.450701, 126.570667);

											// 마커를 생성합니다
											var marker = new kakao.maps.Marker(
													{
														position : markerPosition,
														image : markerImage,
														clickable : true
													});

											// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
											// marker.setMap(null);

											// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
											var mapTypeControl = new kakao.maps.MapTypeControl();

											// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
											// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
											map
													.addControl(
															mapTypeControl,
															kakao.maps.ControlPosition.TOPRIGHT);

											// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
											var zoomControl = new kakao.maps.ZoomControl();
											map
													.addControl(
															zoomControl,
															kakao.maps.ControlPosition.RIGHT);
											marker.setMap(map);

											var iwContent = '<div style="padding:3px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue; font-size:5px;" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue; font-size:5px;" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
											iwPosition = new kakao.maps.LatLng(
													33.450701, 126.570667); //인포윈도우 표시 위치입니다
											// 마커가 지도 위에 표시되도록 설정합니다
											// 인포윈도우를 생성합니다
											var infowindow = new kakao.maps.InfoWindow(
													{
														position : iwPosition,
														content : iwContent
													});
											// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
											// 마커에 마우스오버 이벤트를 등록합니다
											kakao.maps.event.addListener(
													marker, 'mouseover',
													function() {
														// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
														infowindow.open(map,
																marker);
													});

											// 마커에 마우스아웃 이벤트를 등록합니다
											kakao.maps.event.addListener(
													marker, 'mouseout',
													function() {
														// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
														infowindow.close();
													});
										},
										error : function(error) {
											console.log(error);
										}

									})
						})
	</script>
</body>
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
>>>>>>> master
</html>