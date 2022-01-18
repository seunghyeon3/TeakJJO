<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<div class="container" style="margin-top: 30px;">
		<div class="row justify-content-center">
			<div class="col-md-12 heading-section text-center ftco-animate mb-5">
				<span class="subheading">관리자</span>
				<h2 class="mb-2">관리자</h2>
			</div>
		</div>
	</div>
	
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco-navbar-light"id="ftco-navbar" style="margin-top :150px">
		<div class="container">
		
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="">
				<ul class="navbar-nav" style="padding-left:240px;">
					<li class="nav-item active"><a href="showTotalMember.do" class="nav-link">회원 조회</a></li>
					<li class="nav-item"><a href="showAccKeyWord.do" class="nav-link">누적 키워드</a></li>
					<li class="nav-item"><a href="agent.html" class="nav-link">영화 정보</a></li>
					<li class="nav-item"><a href="services.html" class="nav-link">뉴스</a></li>
					<li class="nav-item"><a href="properties.html" class="nav-link">푸드트럭</a></li>
					<li class="nav-item"><a href="blog.html" class="nav-link">사전</a></li>
					<li class="nav-item"><a href="contact.html" class="nav-link">번역</a></li>
					<li class="nav-item"><a href="home.do" class="nav-link">메인으로</a></li>
				</ul>
			</div>
		</div>
	</nav>
	</nav>
	
	${keyword }
	
</body>
</html>