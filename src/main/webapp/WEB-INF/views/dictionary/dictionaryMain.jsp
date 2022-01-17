<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="resources/css/sb-admin-2.min.css" rel="stylesheet">
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


	<div class="text text-center" style="margin-top: 100px">
		<div class="row justify-content-center">
				<div class="col-md-12 heading-section text-center ftco-animate mb-5">
					<span class="subheading">양택조와 함께하는</span>
					<h2 class="mb-2">프리미엄 사전</h2>
				</div>
			</div>
		<div class="search-location mt-md-2">
			<div class="row justify-content-center">
				<div class="col-lg-5 align-items-end ">
					<div class="form-group">
						<div class="form-field">

							<input type="text" class="form-control bg-light" id="search_text"
								placeholder="Search Keyword" style="border: 2px solid black">

							<button id="dictionarySearch">
								<span class="ion-ios-search"></span>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<p>
		<c:if test="${!empty memberinfo.member_Id }">
			<a
				href="javascript:void(0)" onclick="dictionaryRecord()" style="font-size : 1.5rem;">최근 검색 기록</a>
				</c:if>
		</p>
		<div id="light" class="col-md-4 white_content" style="margin-left: 190px;">
			최근 검색 기록 
			<a href="javascript:void(0)"
				onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close
			</a> <br> <br>
			<ul id="dictionaryRecord">

			</ul>
		</div>
		<div id="fade" class="black_overlay"></div>
	</div>
	<br>
	<div class="col-md-4" style="height: 300px; margin-left: 35vw;  padding-top:10px; ">
		<ul id="result_text" style="padding: 0px 20px; border: 2px solid black;"><li style="list-style:none;"><h1 style="text-align:center">검색결과</h1></li></ul>
	</div>

	<script>
		
		$('#dictionarySearch').click(function() {
			if ($("#search_text").val() == "") {
				alert("검색어를 입력하세요");
			} else {
				$("#result_text").children().remove();
				//번역할 object를 생성
				var word = $("#search_text").val();
				dictionarySend(word);
			}
		});
		
		function dictionaryDelete(dictionary_no) {
			//console.log($("#"+dictionary_no).children());
			$("#"+dictionary_no).parent().remove();
			$.ajax({
				type : "POST",
				url : "dictionaryDelete.do",
				data : {
					"dictionary_no" : dictionary_no
				},
				success : function(data){
					alert("삭제가 정상적으로 이루어 졌습니다.");
					
					}
			
				}); 
			
		}
		
		function dictionaryRecord() {
			document.getElementById('light').style.display='block';
			document.getElementById('fade').style.display='block';
			$.ajax({
				type : "POST",
				url : "dictionaryRecord.do",
				success : function(data){
					
					if(data == ""){
						alert("검색기록이 없습니다.");
						document.getElementById('light').style.display='none';
						document.getElementById('fade').style.display='none';
						
					}else{
					$('#dictionaryRecord').children().remove();
					
					var list = $('#dictionaryRecord');
					var count = "0";
					for(var i of data){
						
						if(count==5){
							break;
						}
						console.log(i);
						var data = $('<li>');
						var dataSearch = $('<a>');
						dataSearch.attr('href','javascript:void(0)');
						dataSearch.attr("val", i.dictionary_data);
						dataSearch.attr("onclick", "dictionaryRecordSend(this.text)");
						dataSearch.text(i.dictionary_data);
						data.attr("style", "list-style:none; border-bottom:2px solid black; width:500px");
						data.append(dataSearch);
						
						
						var deleteRecord = $('<a>');
						deleteRecord.attr("type", 'button');
						deleteRecord.text("삭제");
						deleteRecord.attr('href','javascript:void(0)');
						deleteRecord.attr('style','margin-left:50px');
						deleteRecord.attr('id', i.dictionary_no);
						deleteRecord.attr("onclick", "dictionaryDelete("+i.dictionary_no+")");
						data.append(deleteRecord);
						//console.log(i.dictionary_data);
						list.append(data);
						count++;
					}
				}
				}
				});
			}
		
		function dictionaryRecordSend(word) {
			document.getElementById('light').style.display='none';
			document.getElementById('fade').style.display='none';
			$("#result_text").children().remove();
			console.log(word);
			
			$.ajax({
				type : "POST",
				url : "dictionarySearch.do",
				data : {
					"word" : word
				},
				success : function(data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
					console.log(data);
					//alert(data);
					if (data == "") {
						alert("검색된 결과가 없습니다.");
					} else {
						//string의 값을 object 형식으로 변환합니다.
						var result_obj = JSON.parse(data);
						console.log(result_obj);
						//결과값을 textarea에 넣기 위해서
						var res = result_obj.channel.item;
						for (i = 0; i < res.length; i++) {
							var item = res[i].sense.definition;
							$("#result_text").append(
									"<li>" + item + "</li><br>");
						}
					}
				},
				error : function(e) {
					console.log(e);
					alert('실패했습니다.');
				}
			});
		}
		
		
		function dictionarySend(word) {
			$.ajax({
				type : "POST",
				url : "dictionarySearch.do",
				data : {
					"word" : word
				},
				success : function(data) { //서블렛을 통한 결과 값을 받을 수 있습니다.
					console.log(data);
					//alert(data);
					if (data == "") {
						alert("검색된 결과가 없습니다.");
					} else {
						//string의 값을 object 형식으로 변환합니다.
						var result_obj = JSON.parse(data);
						console.log(result_obj);
						//결과값을 textarea에 넣기 위해서
						var res = result_obj.channel.item;
						for (i = 0; i < res.length; i++) {
							var item = res[i].sense.definition;
							$("#result_text").append(
									"<li>" + item + "</li><br>");
						}
					}
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