<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<label>ID</label><br> <input type="text" name="username"
							class="form-control" value="${memberinfo.member_Id }"
							readonly="readonly"><br>
					</div>

					<div class="form-group">
						<label>비밀번호</label><br> <input type="password"
							class="form-control" name="password"
							value="${memberinfo.member_Pw }"><br>
					</div>

					<div class="form-group">
						<label>이름</label><br> <input type="text" class="form-control"
							name="name" value="${memberinfo.member_Name }"><br>
					</div>

					<div class="form-group">
						<label>나이</label><br> <input type="text" class="form-control"
							name="age" value="${memberinfo.member_Age }"><br>
					</div>



					<div class="form-group">
						<c:if test="${memberinfo.member_Tel == null}">
							<label>전화번호</label>
							<br>
							<input type="text" class="form-control" name="tel">
							<br>
						</c:if>
					</div>




					<div class="form-group">
						<c:if test="${memberinfo.member_Tel != null}">
							<label>전화번호</label>
							<br>
							<input type="text" class="form-control" name="tel"
								value="${memberinfo.member_Tel }">
							<br>
						</c:if>
					</div>




					<div class="form-group">
						<c:if test="${memberinfo.member_Addr ==null }">
							<label>주소</label>
							<br>
							<input type="text" class="form-control" name="addr">
							<br>
						</c:if>
					</div>

					<div class="form-group">
						<c:if test="${memberinfo.member_Addr !=null }">
							<label>주소</label>
							<br>
							<input type="text" class="form-control" name="addr"
								value="${memberinfo.member_Addr }">
							<br>
						</c:if>
					</div>

					<div class="form-group">
						<label>권한</label><br> <input type="text" class="form-control"
							name="author" value="${memberinfo.member_Author }" readonly="readonly"><br>
					</div>


					<c:if test="${memberinfo.member_Author eq P }">
						<div class="form-group">
							<label>회사</label><br> <input type="text"
								class="form-control" name="company"
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