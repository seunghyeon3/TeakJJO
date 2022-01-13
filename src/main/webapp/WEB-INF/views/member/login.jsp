<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width,initial-scale=1">
</head>
<body>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	<ul>
		<li onclick="kakaoLogin();"><a href="javascript:void(0)"> <span>카카오
					로그인</span>
		</a></li>
	</ul>

	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
		//카카오로그인
		function kakaoLogin() {

			$.ajax({
				url : 'geturi.do',
				type : 'get',
				async : false,
				dataType : 'text',
				success : function(res) {
					location.href = res;
				}
			});

		}
		function kakaoLogout() {
		    if (Kakao.Auth.getAccessToken()) {
		      Kakao.API.request({
		        url: '/v1/user/unlink',
		        success: function (response) {
		        	console.log(response)
		        },
		        fail: function (error) {
		          console.log(error)
		        },
		      })
		      Kakao.Auth.setAccessToken(undefined)
		    }
		  }  

		$(document).ready(
				function() {

					var kakaoInfo = '${kakaoInfo}';

					if (kakaoInfo != "") {
						var data = JSON.parse(kakaoInfo);

						alert("카카오로그인 성공 \n accessToken : "
								+ data['accessToken']);
						alert("user : \n" + "email : " + data['email']
								+ "\n nickname : " + data['nickname']);
					}
				});
	</script>
</body>
</html>