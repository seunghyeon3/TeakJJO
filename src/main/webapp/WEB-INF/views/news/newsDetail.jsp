<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</head>

<body>

<section class="ftco-section ftco-no-pb" style="margin-top:80px">
			<div class="container">
			
			<div class="row justify-content-center mb-5">
          <div class="col-md-7 heading-section text-center ftco-animate">
          	<span class="subheading">양택조가 실시간으로 알려주는</span>
            <h2 type="button" onclick="location.href='newsMain.do'">양택조 뉴스</h2>
          </div>
        </div>
			
				<div class="row no-gutters">
					<div class="col-md-6 p-md-5 img img-2 d-flex justify-content-center align-items-center" style="background-image: url('resources/img/${detail.newsboard_pfile }');">
					</div>
					<div class="col-md-6 wrap-about py-md-5 ftco-animate">
	          <div class="heading-section p-md-5">
	          <h3 class="mb-6" style="display: inline">${detail.newsboard_title }</h3>
	          
<br><br>
	            <p>${detail.newsboard_content }</p>
	            
	            <br>
	            <p>${detail.member_company }</p>
	            <p style="display: inline; margin-right:150px;">${detail.member_name }&nbsp;기자</p> <p style="display: inline; margin-right:150px;">${detail.newsboard_date }&nbsp;작성</p><p style="display: inline">조회수&nbsp;${detail.newsboard_hit }</p>
	          <br><br>
	          <div>
	          <span><a href="recommand.do?newsboard_id=${detail.newsboard_id }&recommand_no=${recommand}"><img width="150" src="resources/img/택조형추천.png"></a><span style="font-size:25px">&nbsp;추천 <c:choose ><c:when test="${empty recommand}">0</c:when><c:otherwise>${recommand }</c:otherwise></c:choose></span></span>
	          </div>
	          <br><br>
	            <a class= "btn btn-primary py-3 px-5" href="newsDelete.do?newsboard_id=${detail.newsboard_id}" style="float:right;">삭제</a>
	          <a class= "btn btn-primary py-3 px-5" href="newsUpdateForm.do?newsboard_id=${detail.newsboard_id}" style="float:right; margin-right:10px;">수정</a>
	          </div>
					</div>
				</div>
			</div>
		</section>
		
		<div class="row block-9 justify-content-center mb-5" style="margin-top:60px">
          <div class="col-md-8 mb-md-5">
            <form action="boardCommentInsert.do" method ="POST" class="bg-light p-5 contact-form" enctype="application/x-www-form-urlencoded">
              <div class="form-group">
                <input type="text" class="form-control" name="comment" id="comment" placeholder="댓글을 입력하세요...">
                <input type="hidden" name="newsboard_id" id="newsboard_id" value= '${detail.newsboard_id }' >
                <input type="hidden" name="newsboard_title" id="newsboard_title" value= '${detail.newsboard_title}' >
              </div>
             
              <div class="form-group">
                <input type="submit" value="등록" class="btn btn-primary py-3 px-5">
                
              </div>
            </form>
            <c:forEach items="${comment }" var="comment">
            
          <ul class="comment-list " style="margin-top:30px">
         
                <li class="comment" style="border-bottom:1px solid black;padding-bottom: 10px;">
                  <div>
                    <h3>${comment.member_name }</h3>
                    <div class="meta">${comment.boardcomment_date } 작성</div>
                    <p>${comment.boardcomment_content }</p>
                  </div>
                  <a class= "btn btn-primary py-3 px-5" href="boardCommentDelete.do?boardComment_id=${comment.boardcomment_id}" style="float:right;">삭제</a>
	          <a class= "btn btn-primary py-3 px-5" onclick="boardCommentUpdate(this,${comment.boardcomment_id })" style="float:right; margin-right:10px;">수정</a>
                </li>
                
                
                <li id="${comment.boardcomment_id }" style="display:none">
                
                <h3>${comment.member_name }</h3>
                <form action="boardCommentUpdate.do" method ="POST" class="bg-light p-5 contact-form" enctype="application/x-www-form-urlencoded">
              <div class="form-group">
	            <input type="text" class="form-control" name="boardcomment_content" id="boardcomment_content" value="${comment.boardcomment_content }" >
	            <input type="hidden" name="newsboard_id" id="newsboard_id" value= '${detail.newsboard_id }'>
                </div>
                <div class="form-group">
                <span><input type="button" value="취소" class="btn btn-primary py-3 px-5" style="float:right;" onclick="boardCommentCancel(this,${comment.boardcomment_id })"></span>
                <span><input type="submit" value="재등록" class="btn btn-primary py-3 px-5" style="float:right; margin-right:10px;"></span>
                
              </div>
            </form>
               </li>

              </ul>
              
              </c:forEach>
          </div>
        </div>
        <script>
       
        function boardCommentUpdate(e, id){
        	console.log(id);
        e.parentNode.style.display='none';
        document.getElementById(id).style.display='block';
        //$("#"+id).style.display='none';
        }
        
        function boardCommentCancel(e, id){
        	
        	
        	  document.getElementById(id).style.display='none';
        	  e.parentNode.parentNode.parentNode.parentNode.parentNode.children[0].style.display='block';
        	  
        	//console.log(e.parentNode.parentNode.parentNode.parentNode.parentNode.children[0]);
        }
        
        </script>
<!--  <script>
   		 $(document).ready(function(){
   			 var newsboard_id = ${detail.newsboard_id};
   			 console.log(newsboard_id);
   			 $.ajax({
				type : "POST",
				url : "recommandSum.do",
				data : {"newsboard_id" : newsboard_id},
				
				success : function(data){
					console.log(data)
				
				}
				}); 
    		});
    </script> -->

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
	<script src="resources/js/main.js"></script>
</body>
</html>