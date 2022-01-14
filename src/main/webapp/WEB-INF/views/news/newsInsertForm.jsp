<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="row block-9 justify-content-center mb-5" style="margin-top:80px">
          <div class="col-md-8 mb-md-5">
          	<h2 class="text-center">뉴스 기사 등록</h2>
            <form action="newsInsert.do" class="bg-light p-5 contact-form" method="post" enctype="multipart/form-data">
            <div class="form-group">
                <select name="newsboard_genre" id="newsboard_genre">
						<optgroup label="전체">
							<option value="전체">전체</option>
							<option value="부동산">부동산</option>
							<option value="영화">영화</option>
							<option value="유튜브">유튜브</option>
							<option value="푸드트럭">푸드트럭</option>
						</optgroup>
					</select>
              </div>
             <div class="form-group">
                <input type="text" id="newsboard_title" name="newsboard_title" class="form-control" placeholder="기사 제목">
              </div>
              <div class="form-group">
                <textarea id="newsboard_content" name="newsboard_content" cols="30" rows="7" class="form-control" placeholder="기사 내용"></textarea>
              </div>
               <div class="form-group">
                <input type="file" id="file" name="file" class="form-control" placeholder="Subject">
              </div>
              <div class="form-group">
                <input type="submit" value="기사 등록" class="btn btn-primary py-3 px-5">
              </div>
            </form>
          
          </div>
        </div>
        
</body>
</html>