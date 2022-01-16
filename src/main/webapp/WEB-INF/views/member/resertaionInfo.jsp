<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<div class="text text-center" style="margin-top: 100px">
		<h1 class="mb-4" id="header">
			<br>&lt;예매 현황&gt;
		</h1>
	</div>
	<div class="container">

		<div class="row block-9 justify-content-center mb-5">
			<div class="col-md-8 mb-md-5">
				<div class="bg-light p-5 contact-form" id="showlist">
					<table id="tbl">
						<thead>
							<tr>
								<th>예매 번호</th>
								<th>영화 제목</th>
								<th>상영 날짜</th>
								<th>예약 날짜</th>
								<th>극장 좌석</th>
								<th>극장 이름</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function () {
		var tbd = $('#tbl > tbody');
		$.ajax({
			type: "get",
			url: "getresertaionMember.do",
			success: function (result) {
				console.log(result);
				for (var fields of result) {
					tbd.append(
						$('<td>').text(fields.reservation_no),
						$('<td>').text(fields.movie_id),
						$('<td>').text(fields.movie_date),
						$('<td>').text(fields.reservation_date),
						$('<td>').text(fields.reservation_seat+"열"),
						$('<td>').text(fields.theater_no),
					)
				}
			},
			error: function (error) {
				console.log(error);
			}
		})

	})
</script>

</html>