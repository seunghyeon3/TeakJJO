<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<style>
input{
	width: 400px;
}

</style>
<body>
	<br>
	<br>
	<br>
	<div class="text text-center" style="border: 1px dotted pink;">

	<form action="memberRegister.do" onsubmit="return FormCheck()" method="post" accept-charset="utf-8">
		<label> ID </label><br>
		<input type="text" id="member_Id" name="member_Id" value="${userInfo.email }" readonly="readonly"><br>
		<label> 비밀번호 </label><br>
		<input type="password" id="member_Pw" name="member_Pw" required="required"><br>
		<label> 이름 </label><br>
		<input type="text" id="member_Name" name="member_Name" value="${userInfo.nickname } " readonly="readonly"><br>
		<label> 나이 </label><br>
		<input type="text" id="member_Age" name="member_Age" required="required" placeholder="ex) 살제나이입력"><br>
		<label> 전화번호 </label><br>
		<input type="text" id="member_Tel" name="member_Tel" placeholder="전화번호"><br>
		<label> 주소 </label><br>
		<input type="text" id="member_Addr"	name="member_Addr" placeholder="주소"><br>
		<label> 권한 </label><br>
		<input type="text" id="author" placeholder="인증키 입력 후 확인">
		<input type="hidden" id="member_Author" name ="member_Author">
		<button type="button" id="authorBtn" onclick="authorComfirm()" value="NO">확인</button>
		<br>
		<label> 회사 </label><br>
		<input type="hidden" id="member_Company" name="member_Company" placeholder="회사입력" value="NO"><br>
		
		<button type="submit">가입</button>
		<button type="reset" onclick="cancel()">취소</button>
	</form>
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
				
			}else if(judge == 'press'){
				window.alert('기자로 확인 되었습니다.');
				$('#member_Author').val('P');
				$('#authorBtn').attr("disabled", true);
				$('#member_Company').attr({
					'type':'text',
					'value' : 'YES'
				}).val('');
				
			}else{
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