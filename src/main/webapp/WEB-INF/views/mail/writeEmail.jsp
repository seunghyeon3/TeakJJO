<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<form action="email.do" method="post">
<label>발송자</label>
<input type="text" name="username" value="${memberinfo.member_Id }">
<input type="password" name="password" value="${param.pswd }"> 
<label>제목</label>
<input type="text" name="subject">
<label>수신자</label>
<input type="text" name="recipient">
<label>내용</label>
<textarea rows="10" cols="10" name="body">
</textarea>
<button type="submit">전송</button>
</form>
</body>
</html>
