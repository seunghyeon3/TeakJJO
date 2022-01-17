<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>

<body>
	<br>
	<br>
	<br>
	<div class="container">
	<div class="row block-9 justify-content-center mb-5">
			<div class="col-md-8 mb-md-5">
				<br>
		<form action="memberRegister.do" class="bg-light p-5 contact-form" onsubmit="return FormCheck()" method="post" accept-charset="utf-8">
		<div class="form-group">
		<label> ID </label><br>
		<input type="text" class="form-control" id="member_Id" name="member_Id" value="${userInfo.email }" readonly="readonly"><br>
		</div>
			<div class="form-group">
		<label> 비밀번호 </label><br>
		<input type="password" class="form-control" id="member_Pw" name="member_Pw" required="required"><br>
		</div>
		<div class="form-group">
		<label> 이름 </label><br>
		<input type="text" class="form-control" id="member_Name" name="member_Name" value="${userInfo.nickname } " readonly="readonly"><br>
		</div>
			<div class="form-group">
		<label> 나이 </label><br>
		<input type="text" class="form-control" id="member_Age" name="member_Age" required="required" placeholder="ex) 실제나이입력"><br>
		</div>
				<div class="form-group">
		<label> 전화번호 </label><br>
		<input type="text" class="form-control" id="member_Tel" name="member_Tel" placeholder="전화번호"><br>
		</div>
		
		<div class="form-group">
		<label> 주소 </label><br>
		<input type="text"   class="form-control" id="member_Addr"	name="member_Addr" placeholder="주소"><br>
		</div>
		<div class="form-group">
		<label> 권한 </label><br>
		<input type="text"  class="form-control" id="author" placeholder="인증키 입력 후 확인"><br>
		<input type="hidden" id="member_Author" name ="member_Author">
		<button type="button" class="btn btn-primary py-3 px-5" id="authorBtn" onclick="authorComfirm()" value="NO">확인</button><br>
		</div>
		<div class="form-group">
		<input type="hidden" class="form-control" id="member_Company" name="member_Company" placeholder="소속입력" value="NO"><br>
		</div>
		<button class="btn btn-primary py-3 px-5" type="submit">가입</button>
		<button class="btn btn-primary py-3 px-5" type="reset" onclick="cancel()">취소</button>
	</form>
			</div>


		</div>
	</div>

	<script>
	
		$(document).ready(function () {

			$("#member_authorP").click(function () {
				if (this.checked) {
					$("#member_company").prop("disabled", false);
				}
			});
			$("#member_authorU").click(function () {
				if (this.checked) {
					$("#member_company").prop("disabled", true);
				}
			});

		});
		function authorComfirm() {
			let judge = $('#author').val();
			console.log(judge);
			if(judge == 'teakjjo'){
				window.alert('관리자로 확인 되었습니다.');
				$('#member_Author').val('A');
				$('#authorBtn').attr("disabled", true);
				$('#author').val('관리자');
				
			}else if(judge == 'press'){
				window.alert('기자로 확인 되었습니다.');
				$('#member_Author').val('P');
				$('#authorBtn').attr("disabled", true);
				$('#member_Company').attr({
					'type':'text',
					'value' : 'YES'
				}).val('');
				$('#author').val('기자');
				
			}else{
				$('#author').val('일반회원');
				$('#authorBtn').attr("disabled", true);
				window.alert('일반회원입니다.');
				$('#member_Author').val('N');
			}
			$('#authorBtn').val('YES');
		}
		
		function FormCheck() {
			let btn = $('#authorBtn').val();
			let company = $('#member_Company');
			if(btn == 'NO'){
				window.alert('인증키 확인버튼 눌러주세요');
				return false;	
			}
			if(company.val() == 'NO'){
				company.val('없음');
			}
			else if(btn == 'YES')
				return true;
		}
	</script>
</body>

</html>