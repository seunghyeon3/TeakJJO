<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<br>
	<br>
	<div class="container">

		<div class="row block-9 justify-content-center mb-5">
			<div class="col-md-8 mb-md-5">
				<br>
				<h2 class="text-center">개인 정보 수정</h2>
				<form action="updateInfo.do" class="bg-light p-5 contact-form"
					method="post">

					<div class="form-group">
						<label>ID</label><br> <input type="text" name="member_Id"
							class="form-control" value="${memberinfo.member_Id }"
							readonly="readonly"><br>
					</div>

					<div class="form-group">
						<label>비밀번호</label><br> <input type="password"
							class="form-control" name="member_Pw"
							value="${memberinfo.member_Pw }"><br>
					</div>

					<div class="form-group">
						<label>이름</label><br> <input type="text" class="form-control"
							name="member_Name" value="${memberinfo.member_Name }"><br>
					</div>

					<div class="form-group">
						<label>나이</label><br> <input type="text" class="form-control"
							name="member_Age" value="${memberinfo.member_Age }"><br>
					</div>



					<div class="form-group">
						<c:if test="${memberinfo.member_Tel == null}">
							<label>전화번호</label>
							<br>
							<input type="text" class="form-control" name="member_Tel">
							<br>
						</c:if>
					</div>




					<div class="form-group">
						<c:if test="${memberinfo.member_Tel != null}">
							<label>전화번호</label>
							<br>
							<input type="text" class="form-control" name="member_Tel"
								value="${memberinfo.member_Tel }">
							<br>
						</c:if>
					</div>




					<div class="form-group">
						<c:if test="${memberinfo.member_Addr ==null }">
							<label>주소</label>
							<br>
							<input type="text" class="form-control" name="member_Addr">
							<br>
						</c:if>
					</div>

					<div class="form-group">
						<c:if test="${memberinfo.member_Addr !=null }">
							<label>주소</label>
							<br>
							<input type="text" class="form-control" name="member_Addr"
								value="${memberinfo.member_Addr }">
							<br>
						</c:if>
					</div>

					<div class="form-group">
						<label>권한</label><br> <input type="text" class="form-control"
							name="member_Author" value="${memberinfo.member_Author }" readonly="readonly"><br>
					</div>


					<c:if test="${fn:contains(memberinfo.member_Author , 'P')}">
						<div class="form-group">
							<label>회사</label><br> <input type="text"
								class="form-control" name="member_Company"
								value="${memberinfo.member_Company }"><br>
						</div>
					</c:if>
					<input type="submit" value="수정" 	class="btn btn-primary py-3 px-5">
					<input type="button" value="취소"		class="btn btn-primary py-3 px-5" onclick="location.href='home.do'">
				</form>
			</div>


		</div>
	</div>
</body>
</html>