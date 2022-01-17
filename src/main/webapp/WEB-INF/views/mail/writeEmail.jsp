<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<link rel="stylesheet" href="resources/css/style.css">
<body>
<br><br>
   <div class="container">
      
        <div class="row block-9 justify-content-center mb-5">
          <div class="col-md-8 mb-md-5">
          <br>
          	<h2 class="text-center">메일 쓰기</h2>
            <form action="email.do" class="bg-light p-5 contact-form" method="post">
              <div class="form-group">
                <label>발송자</label><br>
				<input type="text" name="username" class="form-control" value="${memberinfo.member_Id }"><br>
				<input type="hidden" name="password" value="${param.pswd }">
              </div>
              <div class="form-group">
               <label>제목</label><br>
			   <input type="text" class="form-control" name="subject"><br>
              </div>
              <div class="form-group">
                <label>수신자</label><br>
		 	    <input type="text" class="form-control" name="recipient"><br>
              </div>
              <div class="form-group">
                <label>내용</label><br>
				<textarea rows="7" class="form-control" cols="30" name="body"></textarea>
              </div>
              <div class="form-group">
              <input type="hidden" name="password" class="form-control" value="${param.pswd }">
                <input type="submit" value="Send mail" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>
        </div>
        </div>
<%-- <div class= "container">
<div class="row block-3 justify-content-center mb-5">
<form action="email.do" class="bg-light p-5 contact-form" method="post">
<h2>메일쓰기</h2>
<label>발송자</label><br>
<input type="text" name="username" class="form-control" value="${memberinfo.member_Id }"><br>
<label>제목</label><br>
<input type="text" class="form-control" name="subject"><br>
<label>수신자</label><br>
<input type="text" class="form-control" name="recipient"><br>
<label>내용</label><br>
<textarea rows="7" class="form-control" cols="30" name="body">
</textarea><br>

<button type="submit" class="btn btn-primary py-3 px-5">전송</button>
</form>
</div>
</div> --%>
</body>
</html>
