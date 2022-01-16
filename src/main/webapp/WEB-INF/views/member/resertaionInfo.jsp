<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">

		<div class="row block-9 justify-content-center mb-5">
			<div class="col-md-8 mb-md-5">
				<div class="bg-light p-5 contact-form" id="showlist">
			</div>
		</div>
	</div>
	</div>
</body>

<script type="text/javascript">
//예매 현황과 상영관 db 다 가져와야함.
$(document).ready(function () {
	$.ajax({
		type: "get",
		url: "getresertaion.do",
		success: function (result) {
			for (var fields of result) {
				$('#showlist').append($('<div>').css('display', 'inline-block')
					.append($('<button>').attr({
						'class': 'btn btn-primary',
						'onclick': "location.href='https://" + fields.urlMark +
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

}) 

</script>
</html>