<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="d-flex justify-content-center">
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
			
			<li class="nav-item"><a class="nav-link active"
				id="pills-description-tab" href="newsGenre.do?genre=전체">전체</a></li>
			<li class="nav-item"><a class="nav-link active"
				id="pills-manufacturer-tab"  href="newsGenre.do?genre=영화">영화</a></li>
				<li class="nav-item"><a class="nav-link active"
				id="pills-manufacturer-tab"  href="newsGenre.do?genre=부동산">부동산</a></li>
			<li class="nav-item"><a class="nav-link active"
				id="pills-review-tab" href="newsGenre.do?genre=유튜브">유튜브</a></li>
			<li class="nav-item"><a class="nav-link active"
				id="pills-review-tab" href="newsGenre.do?genre=푸드트럭">푸드트럭</a></li>
			<li class="nav-item"><a class="nav-link active"
				id="pills-review-tab" href="#">시민 제보 게시판</a></li>
		</ul>
	</div>
	
	<script>
			function newsGenre(val){
        	console.log(val);
				 $.ajax({
					type : "POST",
					url : "newsGenre.do",
					data : {
						"genre" : val
					}
				}); 
			}
	</script>
	
</body>
</html>