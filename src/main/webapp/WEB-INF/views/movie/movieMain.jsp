<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>

    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900&display=swap"
        rel="stylesheet">

    <link rel="stylesheet" href="resources/css/open-iconic-bootstrap.min.css">
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
    <style>
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=80);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 25%;
            left: 25%;
            width: 70%;
            height: 50%;
            padding: 16px;
            border: 16px solid orange;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }

        .buttonGroup {
            height: 100%;
            position: relative;
            top: 5vw;
            left: 35vw;
            align-items: center;
            justify-content: center;
        }

        .movieGO {
            width: 140px;
            height: 45px;
            font-family: 'Roboto', sans-serif;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 2.5px;
            font-weight: 500;
            color: #000;
            background-color: #fff;
            border: none;
            border-radius: 45px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease 0s;
            cursor: pointer;
            outline: none;
        }

        .movieGO:hover {
            background-color: #f8c3ff;
            box-shadow: 0px 15px 20px rgba(252, 101, 244, 0.4);
            color: #fff;
            transform: translateY(-7px);
        }

        #section {
            position: relative;
            top: 5vw;
        }
    </style>

</head>

<body>
    <div class="buttonGroup">
        <button type="button" class="movieGO" onclick="location.href='movieMain.do'">홈</button>&nbsp&nbsp
        <button type="button" class="movieGO" onclick="location.href='reserve.do'">영화예약</button>
    </div>
    <section class="ftco-section ftco-agent" id="section">
        <div>
            <div class="container">
                <div class="row" id="upcoming"></div>
            </div>
        </div>
        <div id="light" class="white_content">
            <a href="javascript:void(0)"
                onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">Close
            </a> <br> <br>
            <div id="detail"> </div>
            <div class="ftco-counter img">
                <div class="container">
                    <div class="row">
                        <div class="block-6">
                            <div class="text text-border d-flex align-items-center">
                                <h3>평점</h3>
                            </div>
                            <div class="text">
                                <p>ddddddddddddddd</p>
                            </div>
                        </div>
                        <div class="block-6">
                            <div class="text text-border d-flex align-items-center">
                                <h3>상영시간표</h3>
                            </div>
                            <div class="text">
                                <p>ddddddddddddddd</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="fade" class="black_overlay"></div>

        <div class="col-lg-8 col-md-6" style="margin-left: 15vw;">
            <div class="text text-center">
                <form action="searchMovie.do" class="search-location mt-md">
                    <div class="col-lg-10 align-items-end">
                        <div class="form-group">
                            <div class="form-field">
                                <input type="text" class="form-control bg-light" placeholder="Search location" id="movie"
                                    name="movie" style="border: 2px solid black">
                                <button type="submit">
                                    <span class="ion-ios-search"></span>
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <h2 clss="mb-2"  style="position: relative; right: 8vw;">주간박스오피스</h2>
        <div class="container1" style="position: relative; top: 8vw;">
        <div class="row" id="main-box">
            <!-- var mainBox = $('#main-box') -->
		</div>        
        </div>
    </section>
    <script>
        //  config.MOVIE_API_KEY: 영화진흥위원회 발급 API KEY
        $(document).ready(
            function () {
                $.ajax({
                    type: 'get', // 통신방식 (GET/POST)
                    dataType: 'xml', // 서버로부터 응답 받을 데이터 형식
                    url: "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchWeeklyBoxOfficeList.xml?key=31bf2f4e886b6fca114ba4c80273968a&targetDt=20220108&weekGb=0", // 통신할 대상 페이지가 있는 url 주소
                    success: function (data) {

                        var mainBox = $('#main-box');

                        for (var i = 0; i < 8; i++) {

                            var movieName = $(data).find('weeklyBoxOffice').eq(i).find('movieNm')
                                .text();
                            var movieDate = $(data).find('weeklyBoxOffice').eq(i).find('openDt').text();
                            var detail = $(data).find('weeklyBoxOffice').eq(i).find('movieCd').text();
                            console.log(detail);
                            var main = $('<div>').attr('class', 'col-md-3');
                            var agent = $('<div>').attr('class', 'agent');
                            var image = $('<div>').attr('class', 'img-fluid');
                            var content = $('<div>').attr('class', 'desc');
                            var title = $('<div>').attr('class', 'h-info');
                            var date = $('<span>').attr('class', 'location');
                            date.append('<span>' + movieDate + '</span>');
                            title.append($('<a>').attr({
                                'href': 'javascript:void(0)',
                                'onclick': "movieDetail(" + detail + ")"
                            }).text(movieName));
                            content.append(title, date);
                            image.append(content);
                            agent.append(image);
                            main.append(agent);
                            mainBox.append(main);

                        }

                    }, // 통신이 성공했을 때 수행될 콜백 함수
                    error: function (req) {
                        alert('통신을 실패하였습니다. 상태 : ' + req.status + ', ' + req.requestText + ', ' + req
                            .error);
                    } // 통신이 실패했을 때 수행될 콜백 함수     
                });

            });
        //  천 단위 ,(콤마) 찍기
        function numberToString(audiAcc) {
            return audiAcc.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        }

        function movieDetail(detail) {
            document.getElementById('light').style.display = 'block';
            document.getElementById('fade').style.display = 'block';
            $.ajax({
                type: 'get',
                dataType: 'json', // 서버로부터 응답 받을 데이터 형식
                url: 'http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=31bf2f4e886b6fca114ba4c80273968a&movieCd=' +
                    detail,
                success: function (data) {
                    console.log(data);
                    $('#detail').children().remove();

                    var list = $('#detail');

                    var main = $('<div>').attr('class', 'col-md-12 mb-md-5');
                    var title = $('<div>').attr('class', 'testimony-wrap py-4');
                    var content = $('<div>');
                    var info = $('<div>');
                    content.append(info);
                    title.append('<h2 style="text-align:center">' +
                        data.movieInfoResult.movieInfo.movieNm +
                        data.movieInfoResult.movieInfo.movieNmEn +
                        '<h2/>', content);
                    main.append(title);
                    list.append(main);

                    for (var field in data.movieInfoResult.movieInfo) {
                        if (field == 'nations') {
                            for (var object in data.movieInfoResult.movieInfo[field])
                                info.append('<p>' +
                                    data.movieInfoResult.movieInfo[field][object].nationNm +
                                    " | " + data.movieInfoResult.movieInfo.showTm +
                                    " | " + data.movieInfoResult.movieInfo.openDt +
                                    '</p>');

                        } else if (field == 'audits') {
                            for (var object in data.movieInfoResult.movieInfo[field])
                                info.append('<p>' +
                                    "관람등급 | " + data.movieInfoResult.movieInfo[field][object].watchGradeNm +
                                    '</p>');
                        } else if (field == 'genres') {
                            for (var object in data.movieInfoResult.movieInfo[field])
                                info.append('<span>' +
                                    data.movieInfoResult.movieInfo[field][object].genreNm + " | " +
                                    '</span>');
                        } else if (field == 'actors') {
                            for (var object in data.movieInfoResult.movieInfo[field])
                                info.append('<span>' +
                                    data.movieInfoResult.movieInfo[field][object].peopleNm + " | " +
                                    '</span>');
                        } else if (field == 'directors') {
                            for (var object in data.movieInfoResult.movieInfo[field])
                                info.append('<p>' +
                                    "감독 |  " + data.movieInfoResult.movieInfo[field][object].peopleNm +
                                    '</p>');
                        } else if (field == 'companys') {
                            for (var i = 0; i < 1; i++) {
                                info.append('<p>' +
                                    "배급사 |  " + data.movieInfoResult.movieInfo[field][i].companyNm +
                                    '</p>');
                            }
                        }
                    }
                },
                error: function (req) {
                    alert('통신을 실패하였습니다. 상태 : ' + req.status + ', ' + req.requestText + ', ' + req.error);
                } // 통신이 실패했을 때 수행될 콜백 함수     
            });
        }
    </script>
    <script>
        $.ajax({
                method: "GET",
                url: "https://api.themoviedb.org/3/movie/upcoming?api_key=3b107430820d0cf4938ce577256667d7&language=ko-KR",
                headers: {
                    Authorization: "Bearer 3b107430820d0cf4938ce577256667d7"
                }

            })
            .done(
                function (msg) {

                    var img = "https://image.tmdb.org/t/p/w300/";
                    var upComing = $('#upcoming');

                    for (var i = 0; i < 8; i++) {

                        var first = $('<div>').attr('class', 'col-md-3');
                        var second = $('<div>').attr('class', 'agent');
                        var image = $('<div>').attr('class', 'img-fluid');
                        var third = $('<div>').attr('class', 'property-wrap ftco-animate fadeInUp ftco-animated');
                        var content = $('<div>').attr('class', 'desc');
                        var fourth = $('<div>').attr('class', 'mb-4');
                        var fifth = $('<div>');
                        fifth.append('<h3>' + msg.results[i].title + '</h3>');
                        fourth.append('<p>' + msg.results[i].overview + '</p>');
                        content.append(fourth, fifth);
                        third.append(content);
                        image.append("<img src='" + img + msg.results[i].poster_path + "'/>", content);
                        second.append(image);
                        first.append(second);
                        upComing.append(first);

                    }

                });
    </script>

    <!-- loader -->

    <script src="https://code.jquery.com/jquery-3.6.0.js"
        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false">

    </script>
    <script src="resources/js/google-map.js"></script>
    <script src="resources/js/main.js"></script>

</body>

</html>