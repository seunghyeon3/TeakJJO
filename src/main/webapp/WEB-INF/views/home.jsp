<%@page import="co.teakjjo.prj.member.service.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>양택조</title>
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
</head>
</head>
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
	filter: alpha(opacity = 80);
}

.white_content {
	display: none;
	position: absolute;
	top: 25%;
	left: 25%;
	width: 50%;
	height: 50%;
	padding: 16px;
	border: 16px solid orange;
	background-color: white;
	z-index: 1002;
	overflow: auto;
}
</style>
</head>

<body>
	<!-- 양택조 color=pink (#e86ed0) -->
	<nav
		class="navbar navbar-expand navbar-light bg-white topbar static-top shadow">

		<!-- Sidebar Toggle (Topbar) -->
		<button id="sidebarToggleTop"
			class="btn btn-link d-md-none rounded-circle mr-3">
			<i class="fa fa-bars"></i>
		</button>
		<a
			class="sidebar-brand d-flex align-items-center justify-content-center"
			href="home.do">
			<div class="sidebar-brand-icon rotate-n-15">
				<img src="resources/img/양택조Header.png" width="70">
			</div>
			<div class="sidebar-brand-text mx-3">
				양택조 <sup>site</sup>
			</div>
		</a>
		<!-- Topbar Search -->
		<form
			class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
			<div class="input-group">
				<input type="text" id="keyword"
					class="form-control bg-light border-0 small"
					placeholder="Search for..." aria-label="Search"
					aria-describedby="basic-addon2">
				<div class="input-group-append">
					<button class="btn btn-primary" type="button"
						onclick="searchPage()">
						<i class="fas fa-search fa-sm"></i>
					</button>
				</div>
			</div>
		</form>
		
		<c:if test="${memberinfo ne null }">
			
			<a class="nav-link" href="emailForm.do" id="messagesDropdown" style="display: inline-block;"> <i class="fas fa-envelope fa-fw"></i>
			</a> <!-- Dropdown - Messages -->
			
		</c:if>

		<!-- Topbar Navbar -->
		<ul class="navbar-nav">
			<!-- Nav Item - User Information -->

			<c:if test="${memberinfo ne null }">
				<!-- Nav Item - Search Dropdown (Visible Only XS) -->
				<li class="nav-item dropdown no-arrow d-sm-none"><a
					class="nav-link dropdown-toggle" href="#" id="searchDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
				</a> <!-- Dropdown - Messages --></li>
				<li class="nav-item dropdown no-arrow"><a
					class="nav-link dropdown-toggle" href="#" id="userDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> <span
						class="mr-2 d-none d-lg-inline text-gray-600 small">
							${memberinfo.member_Name }님 </span> <img
						class="img-profile rounded-circle"
						src="resources/img/undraw_profile.svg">
				</a> <!-- Dropdown - User Information -->
					<div
						class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
						aria-labelledby="userDropdown">
						<a class="dropdown-item" href="updateInfo.do"> <i
							class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> 개인정보수정
						</a> <a class="dropdown-item" href="resertaionInfo.do"> <i
							class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 예매 현황
						</a> <a class="dropdown-item" href="#" id="check_module"> <i
							class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 결제
						</a> <a class="dropdown-item" href="acckeyword.do"> <i
							class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i> 누적키워드수
						</a> <a class="dropdown-item"
							href="https://kauth.kakao.com/oauth/logout?client_id=80fd8a8ab79372ef8a66ba99b5dc4ed0&logout_redirect_uri=http://localhost/prj/logout.do">
							<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
							로그아웃
						</a>
					</div></li>
			</c:if>
			<c:if test="${memberinfo eq null }">
				<button class="btn btn-primary" type="button" onclick="login()">로그인</button>
			</c:if>

		</ul>

	</nav>
	<div class="text text-center">
		<div class="mb-4">
			<br> <br> <img src="resources/img/양택조Header.png"
				width="300">


		</div>
		<form action="/portalSearch.do" class="search-location m-lg-4">
			<div class="row justify-content-center">
				<div class="col-lg-10 align-items-end">
					<div class="form-group">
						<div class="form-field">
							<script async
								src="https://cse.google.com/cse.js?cx=8e2ffa22a72c27063"></script>
							<div class="gcse-search"></div>
							<!-- <input type="text" class="form-control bg-light"
								placeholder="Search location">
							<button>
								<span class="ion-ios-search"></span>
							</button> -->
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

	<!-- 완성후 주석 해제 예정 -->
	<c:if test="${memberinfo ne null }">
		<div class="text text-center" id="urlMark">


			<!-- url 즐겨찾기 추가하는 부분... 팝업창 뜨게 되면 데이터 적어주고, 거기에 input tag로 데이터 받기. -->
			<!-- session 값 받아와서 화면에 뿌려 주는거 해야함. -->
			<!-- 문제는 컨테이너 크기 잡아와서 4개면 4개씩 뿌려주는거 해야함. -->
			<!-- 여기부분 해결 되면 나머지 예매 현황, 누적 키워드수 등등 해당 부분으로 해결 할 예정 -->
			<!-- script 부분은 다 만든 후 js 파일 따로 만들어서 넣어주든 정리 필요함. -->

			<div id="urlDiv">
				<div style="display: inline-block;">
					<button class="btn btn-primary" style="border-radius: 50%;"
						onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
						+</button>
					<br> <br>바로가기 추가
				</div>

				<div id="light" class="white_content text-left">
					<label>바로가기 추가</label><br> <label>이름</label><br> <input
						type="text" id="urls" name="urlMark"><br> <label>URL</label><br>
					<input type="text" id="urlMarkName" name="urlMarkName"> <br>
					<br>
					<button type="button" onclick="insertUrl()" class="btn btn-primary">확인</button>
					<button class="btn btn-primary"
						onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">취소</button>
				</div>
				<div id="fade" class="black_overlay"></div>
			</div>
		</div>
	</c:if>
	<script src="resources/vendor/jquery/jquery.min.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="resources/js/sb-admin-2.min.js"></script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		function searchPage() {
			var keyword = $('#keyword').val();
			if (keyword == '유튜브') {
				window.location = "youtube.do";
			} else if (keyword == '영화') {
				window.location = "movieMain.do"

			}else if (keyword == '푸드트럭') {

			} else if (keyword == '사전') {
				window.location = "dictionaryMain.do";

			} else if (keyword == '번역') {
				window.location = "papagoMain.do"
			} else if (keyword == '푸드트럭') {

			} else if (keyword == '부동산') {

			} else {
				window.alert('유튜브, 영화, 사전, 번역, 푸드트럭, 부동산 중 하나 검색 해주세요.');
				$('#keyword').val('').focus();
			}
			return;
		}

		function login() {
			$.ajax({
				url: 'geturi.do',
				type: 'get',
				async: false,
				dataType: 'text',
				success: function (res) {
					location.href = res;
				}
			});

		}

		function insertUrl() {
			var urls = $('#urls').val();
			var urlname = $('#urlMarkName').val();
			console.log(urls);
			$
				.ajax({
					type: "get",
					url: "insertUrl.do",
					data: {
						url: urls,
						urlname: urlname
					},
					success: function () {
						window.location.reload();
					},
					error: function (error) {
						console.log(error);
					}
				});
		}
		//url 삭제 추가
		function deleteUrl() {
			console.log(this.event);
		}
		


		<%MemberVO vo = (MemberVO) session.getAttribute("memberinfo");
if (vo == null) {

} else if (vo.getMember_Id() != null) {%>
			$(document).ready(function () {
					$.ajax({
						type: "get",
						url: "getUrl.do",
						success: function (result) {
							console.log(typeof result);
							for(var fields of result){	
								$('#urlDiv').append($('<div>').css('display', 'inline-block')
									.append($('<button>').attr({'class': 'btn btn-primary','onclick': "location.href='https://" + fields.urlMark +
												"'",
											'id': fields.urlMarkName
										}).text(
											fields.urlMarkName)));
							//view는 확인,, 최종 정리해야함.$('#urlDiv').prepend($('<a>').attr('onclick', 'deleteUrl()').text('삭제'));
							$('#light').css('display', 'none');
							$('#fade').css('display', 'none');
							$('#urls').text('');
							$('#urlMarkName').text('');
							}
						},
						error: function (error) {
							console.log(error);
						}
					})

				}) <%}%>
	</script>
	<script type="text/javascript">
	$("#check_module").click(function () {
		console.log("여기요");
		var IMP = window.IMP; // 생략가능
		IMP.init('imp44063807');
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'kakao',
			pay_method: 'card',
			merchant_uid: 'merchant_' + new Date().getTime(),
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '주문명 : 아메리카노',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: 2000,
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: '이름',
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			buyer_postcode: '123-456',
		}, function (rsp) {
			console.log(rsp);
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '결제 금액 : ' + rsp.paid_amount;
				// success.submit();
				location.href = "changeAuthor.do";
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
		});
	});
	</script>
</body>

</html>