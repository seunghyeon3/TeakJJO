<%@page import="co.teakjjo.prj.member.service.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>맵 테스트</title>
<script type="text/javascript"
	src="/prj/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="resources/css/style.css">
	
<style type="text/css">
@font-face {
	font-family: 'yg-jalnan';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_four@1.2/JalnanOTF00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
/* 매우 작은 기기들 (모바일폰, 768px 보다 작은) */
/* 부트스트랩에서 이것은 기본이므로 미디어쿼리가 없습니다. */

/* 작은 기기들 (태블릿, 768px 이상) */
@media ( min-width : @screen-sm-min) {
	...
}

/* 중간 기기들 (데스크탑, 992px 이상) */
@media ( min-width : @screen-md-min) {
	...
}

/* 큰 기기들 (큰 데스크탑, 1200px 이상) */
@media ( min-width : @screen-lg-min) {
	...
}

@media ( max-width : @screen-xs-max) {
	...
}

@media ( min-width : @screen-sm-min) and (max-width: @screen-sm-max) {
	...
}

@media ( min-width : @screen-md-min) and (max-width: @screen-md-max) {
	...
}

@media ( min-width : @screen-lg-min) {
	...
}
/* 헤더 아이콘 색상설정 */

/* 클러스터 색상설정  */
#map>div>div>div>div>div {
	color: black !important;
}

/* #mapinfo 상위 div  */
#map>div>div>div>div>div:nth-child(2) {
	font-size: 16px;
}
/*카카오 지도레벨 표시부분   */
#map>div:nth-child(2)>div:nth-child(1)>div:nth-child(2) {
	color: black !important;
}

div #mapInfo {
	width: 250px;
	height: 100px;
	font-size: 14px;
}

#mapInfo a {
	font-size: 14px;
	color: #4885e8 !important;
}

#mapSearch {
	margin-top: 75px;
}

.sidebar {
	margin-top: 75px;
	float: left;
	width: 25% !important;
}

.sidebar li {
	list-style: none;
}

.sidebar>div>div>ul>li>a {
	font-weight: bold;
}

.hide {
	display: none;
}

.tr>th {
	width: 110px;
	color : #ff0047 !important;
}

.tr>th>button {
	width: 90px;
}

a.page-link {
	color: blue !important;
}
</style>
</head>
<body>
<!-- 타이틀 출력 -->
			<div class="row justify-content-center" style="margin-top:46px; margin-right: 50px; ">
				<div class="col-md-12 heading-section text-center mb-5">
					<span class="subheading">양택조와 함께하는</span>
					<h2 class="mb-2">푸드트럭 위치찾기</h2>
				</div>
			</div>

	<%
	MemberVO vo = (MemberVO) session.getAttribute("memberinfo");
	%>
	<div style="margin-left: 200px;">
		<!-- ! Sidebar -->
		<aside class="sidebar">
			<div style="margin-left: 100px;">
				<div style="width: 100px;"></div>
				<div style="margin-left: 100px;">
					<ul>
						<li style="width: 150px;"><a href="javascript:void(0);"
							style="cursor: pointer"> 푸드트럭 </a>
							<ul class="hide" style="width: 200px;">
								<li><a href="javascript:void(0);"
									style="cursor: pointer; margin-top: 5px;" onclick="mapSearch()">검색</a></li>
								<li><a href="javascript:void(0);" style="cursor: pointer;"
									onclick="foodMark()">즐겨찾기</a></li>
								<li><a href="javascript:void(0);" style="cursor: pointer;"
									onclick="rsrSearch()">최근검색</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- 검색 시작부분 -->
				<div id="searchDiv" class="hide"
					style="margin-left: 100px; overflow: auto; width: 320px;">
					<input type="text" id="searchBox" name="searchBox"
						placeholder="검색어를 입력해주세요">
					<button id="foodSearch" class="btn btn-primary">검색</button>
					<div style="height: 450px;">
						<table id="searchTable">
						</table>
					</div>

				</div>
				<!-- 검색 끝 부분 -->
				<!-- 즐겨찾기 이동 -->
				<div id="markDiv" class="hide" style="height: 400px;">
					<div style="margin-left: 100px;">
						<div style="color : black important;"><h3>즐겨찾기 목록</h3></div>
						<div>
							<table id="bookMarkList"></table>
						</div>
						<nav aria-label="...">
							<ul class="pagination"
								style="margin-top: 10px; margin-left: -60px;">
							</ul>
						</nav>
					</div>
				</div>
				<!-- 최근검색 이동 -->
				<div id="rsrDiv" class="hide"
					style="width : 300px; height: 500px; margin-left: 100px;">
					<div>
						<h3>최근검색 목록</h3>
						<table id="rsrList" ></table>
					</div>
				</div>
			</div>
		</aside>
		<!-- ! Sidebar End -->

		<!-- 맵 div -->
		<div id="map"
			style="width: 50%; height: 700px; margin-right: 300px; margin-top: 75px; float: right;"></div>

	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47ef13464842c3a22235787a9d64e6fc&libraries=services,clusterer"></script>
	<script>
	
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(35.20888446, 128.1250549), // 지도의 중심좌표
			level : 13
		// 지도의 확대 레벨
		});

		// 마커 클러스터러를 생성합니다
		// 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
		// 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
		// 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
		// 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
		var clusterer = new kakao.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			averageCenter : false, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			minLevel : 7, // 클러스터 할 최소 지도 레벨
			disableClickZoom : true
		// 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
		});

		var markerPosition = new kakao.maps.LatLng;
		iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		var markers;
		var searchData = new Array();
		
		
		// 데이터를 가져오기 위해 jQuery를 사용합니다
		// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
		$.get( "/prj/resources/json/foodtruckdata.json",
						function(data) {
							searchData = data;
							// 데이터에서 좌표 값을 가지고 마커를 표시합니다
							// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
							// 마커가 지도 위에 표시되도록 설정합니다
							
							markers = $(data.records).map(function(i, record) {
												var maks = new kakao.maps.Marker(
														{
															map : map,
															position : new kakao.maps.LatLng(
																	record[data.fields[6].id],
																	record[data.fields[7].id])
														});
												var infowindow = new kakao.maps.InfoWindow(
														{
															content : record[data.fields[0].id]
																	+ '<div id="mapInfo" style="padding:5px;"> <br><a href="https://map.kakao.com/link/map/'
																	+ record[data.fields[0].id]
																	+ ','
																	+ record[data.fields[6].id]
																	+ ','
																	+ record[data.fields[7].id]
																	+ '" style="color:blue" ; target="_top">길찾기</a><a> | <a>  '
																	+ ' <a href="https://map.kakao.com/link/roadview/'
																	+ record[data.fields[6].id]
																	+ ','
																	+ record[data.fields[7].id]
																	+ '" style="color:blue"; target="_top">로드뷰</a>'
																	+ '</div>',
															removable : true
														});

												kakao.maps.event.addListener(
														maks, 'click',
														makeOverListener(map,
																maks,
																infowindow));

												return maks;
											});

							clusterer.addMarkers(markers);
							
						});
		var next;
		var lastPage;
		var prev;
		var nowPage2;
		// 마커 클러스터러에 클릭이벤트를 등록합니다
		// 마커 클러스터러를 생성할 때 disableClickZoom을 true로 설정하지 않은 경우
		// 이벤트 헨들러로 cluster 객체가 넘어오지 않을 수도 있습니다
		kakao.maps.event.addListener(clusterer, 'clusterclick', function(
				cluster) {
			// 현재 지도 레벨에서 1레벨 확대한 레벨
			var level = map.getLevel() - 2;

			// 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
			map.setLevel(level, {
				anchor : cluster.getCenter()
			});
		});
		//마커 클릭 이벤트 (인포윈도우 생성 및 닫기)
		function makeOverListener(map, marker, infowindow) {
			var flag = true;
			
			return function() {
				if(flag){
					infowindow.open(map, marker);
					flag = false;
				}else{
					infowindow.close();
					flag = true;
				}
			};
		}
		// 검색
		function mapSearch() {
			$("#markDiv").hide();
			$("#rsrDiv").hide();
			$("#searchDiv").show();
		}
		//즐겨찾기
		function foodMark() {
			selectFoodMark(1);
		}
		
		//페이징
		 function paging(){
			var $page = $(`<li class="page-item"><a class="page-link" onclick="selectFoodMark(`+prev+`)"
			tabindex="-1"><</a></li>`);
			var $page2 = $(`<li class="page-item"><a class="page-link" onclick="selectFoodMark(`+next+`)">></a>
			</li>`);
			
			$(".pagination").append($page);
			for(var i=1;i<=lastPage;i++){
				var $page3;
				var $finalPage;
				var $other;
				if(i==nowPage2){
					$page3 = $(`<li class="page-item active"><a class="page-link" onclick="selectFoodMark(`+i+`)">`+i+`
									<span class="sr-only">(current)</span></a></li>`);
				}else if((i!=nowPage2 && nowPage2 >= i+3) ||(i!=nowPage2 && nowPage2 <= i-3)) /* && i != lastPage */{
					
				}else {
						$page3 = $(`<li class="page-item"><a class="page-link" onclick="selectFoodMark(`+i+`)">`+i+`</a></li>`);
					}
				
				$(".pagination").append($other);
				$(".pagination").append($page3);
			}
				
			$(".pagination").append($page2);
		} 
		
		//최근검색
		 function rsrSearch(){
			$("#searchDiv").hide();
			$("#markDiv").hide();
			$("#rsrDiv").show();
			selectRsrSearch();
		} 
		
		//즐겨찾기 목록 리스트 출력
		function selectFoodMark(nowPage){
			var $btr;
			//기존 검색결과 리셋
        	if($(".tr")){
        		$("#bookMarkList").empty();
        	}
			
			//즐겨찾기 목록 출력
			$.ajax({
	     	        type:"POST",
	     	        url: "foodSelectList.do",
	     	        data : {"nowPage" : nowPage},
	     	      	async:false,
	     	        success: function(result){
	     	        	console.log(result.length);
	     	        	if(result.length != 0 ){
		     	        	$("#searchDiv").hide();
		     				$("#rsrDiv").hide();
		     				$("#markDiv").show();
		     	        	$(".pagination").empty();
		     	        	
		     	        	next=result[0].vo.next;
		     	        	prev=result[0].vo.prev;
		     	        	lastPage=result[0].vo.lastPage;
		     	        	nowPage2 = result[0].vo.nowPage;
		     	        	
		     	        	for ( var i in result ) {
				        		$btr = $(`
				        				<tr>
					        				<input type="hidden" value=`+result[i].lat+`>
											<input type="hidden" value=`+result[i].lng+`>
											<th style="cursor: pointer" colspan="2" class="bookMarkSearchView" >`+result[i].bookmark_id+`</th>
										</tr>
										<tr>
					        				<input type="hidden" value=`+result[i]+`>
											<th colspan="2" style = "color : gray !important;">
											`+result[i].bookmark_date.substr(0,10)+`</th>
										</tr>
										<tr>
											
											<th><input type="hidden" value=`+result[i].bookmark_id+`>
												<input type="hidden" value=`+result[i].lat+`>
												<input type="hidden" value=`+result[i].lng+`>
												<button class="bookMarkSearch btn btn-primary">길찾기</button>
											</th>
												
											<th><input type="hidden" value=`+result[i].bookmark_id+`>
												<input type="hidden" value=`+result[i].lat+`>
												<input type="hidden" value=`+result[i].lng+`>
												<button class="bookMarkLoad btn btn-primary">로드뷰</button>
											</th>
											
											<th>
											<input type="hidden" value=`+result[i].bookmark_id+`>
											<button class="bookMarkDel btn btn-primary">등록해제</button>
											</th>
											
										</tr>
										`);
				        		$("#bookMarkList").append($btr);
				        		$btr.addClass('tr');
				        		
				        	}
		     	        	paging();
	     	        	}else{
	     	        		$h4 = $(`<h4 style="font-weight : bold;">검색하신 이력이 없습니다.</h4>`);
			        		$("#bookMarkList").append($h4);
			        		$h4.addClass('tr');
	     	        	}
	     	        },
	     	        error : function(e){
	     	        	$h4 = $(`<h4 style="font-weight : bold;"> 로그인이 필요한 서비스입니다.</h4>`);
		        		$("#bookMarkList").append($h4);
		        		$h4.addClass('tr');
	     	        }
	     	   });
		}
		
		//최근검색목록 출력
		function selectRsrSearch(){
			var $rtr;
			//최근검색 목록 리셋
        	if($(".tr")){
        		$("#rsrList").empty();
        	}
			
			//최근검색 목록 출력
			$.ajax({
	     	        type:"POST",
	     	        url: "rsrList.do",
	     	        success: function(result){
	     	        	console.log(result.length);
	     	        	if(result.length != 0){
		     	        	for ( var i = 0; i < 4; i++ ) {
				        		$rtr = $(`
				        				<tr>
				        					<input type="hidden" value=`+result[i].rsr_id+`>
					        				<input type="hidden" value=`+result[i]+`>
											<th style="cursor: pointer;" colspan="3" class="clickRsr">`+result[i].rsr_id+`</th>
										</tr>
										<tr>
											<input type="hidden" value=`+result[i].rsr_id+`>
											<th style="color : gray !important;">`+result[i].rsr_date.substr(0,10)+`</th>
										</tr>
										<tr>
											<th>
												<input type="hidden" value=`+result[i].rsr_id+`>
												<button class="rsrDel btn btn-primary">삭제</button>
											</th>	
										</tr>
										
										`);
				        		$("#rsrList").append($rtr);
				        		$rtr.addClass('tr');
				        		} 
				        	}else {
				        		$h4 = $(`<h4 style="font-weight : bold;">최근검색정보가 없거나 로그인 되어있지 않습니다.</h4>`);
				        		$("#rsrList").append($h4);
				        		$h4.addClass('tr');
	     	        		}
	     	        },
	     	        error: function(error) {
	     	            alert(error);
					}
	     	   });
		}
		
		
		//document
		$(document).ready(function(){
				
	        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
	        $(".sidebar>div>div>ul>li>a").click(function(){
	            var submenu = $(this).next("ul");
	            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
	            if( submenu.is(":visible")){
	                submenu.slideUp();
	            }else{
	                submenu.slideDown();
	                return;
	            }
	        });
		      
		        //검색 버튼 클릭시 이벤트발생
		        $("#foodSearch").on("click",function(e){
		        	var search = $(this).prev().val();
		        	console.log(search);
		        	if(search == ""){
		        		
		        	}else{
			        	$.ajax({
			     	        type:"POST",
			     	        url: "${pageContext.request.contextPath}/rsrInsert.do",
			     	        data : {"search" : search },
			     	        success: function(result){
			     	        	if(result == 1){
			     	        		
			     	        	}else{
			     	        		alert("검색도중 오류가 발생했습니다.");
			     	        	}
			     	        },
			     	        error: function(){
			     	        	return;
			     	        }
			     	    });
	        		}	
		        	
		        	var searchIndex = ""; //String
		        	var searchBox = $("#searchBox").val();
		        	var searchArray = [];
		        	var $tr;
		        	
		        	$.each(searchData.records, function(index, item){
		        		//console.log(item[searchData.fields[0].id].indexOf(searchBox));
		        		if(item[searchData.fields[0].id].indexOf(searchBox) != -1){
		        			searchIndex += index+",";
		        		}
		        	});
		        	
		        	//기존 검색결과 리셋
		        	if($(".tr")){
		        		$("#searchTable").empty();
		        	}
		        	
		        	//console.log(searchIndex);
		        	searchArray = searchIndex.split(',');
		        	
		        	//검색 버튼을 눌렀을때의 테이블 생성
		        	for ( var i in searchArray ) {
		        		if(searchArray[i] != 'undefined' && searchArray[i] != ""){
		        		
		        		$tr = $(`<tr>
		        				<input type="hidden" value=`+searchArray[i]+`>
								<th style="cursor: pointer" colspan="3" class="searchView" >`+searchData.records[searchArray[i]][searchData.fields[0].id]+`</th>
								</tr>
								<tr>
									<th><input type="hidden" value=`+searchData.records[searchArray[i]][searchData.fields[0].id]+`><button class="bookmark btn btn-primary">즐겨찾기</button></th>
									<th><input type="hidden" value=`+searchArray[i]+`><button class="searchBtn btn btn-primary">길찾기</button></th>
									<th><input type="hidden" value=`+searchArray[i]+`><button class="viewBtn btn btn-primary">로드뷰</button></th>
								</tr>`);
		        		$("#searchTable").append($tr);
		        		$tr.addClass('tr');
		        		}
		        		//검색값 초기화
		        		//$("#searchBox").val('');
		        	}
		        	$up = $(`<br><div><button id="up"  class="btn btn-primary"  onclick="location.href='#searchBox'">위로</button></div>`);
					$("#searchTable").append($up);
		        })
		         //검색버튼 이벤트 끝부분
		         
		         //즐겨찾기 목록 표출
		          $("#foodMark").on("click",function(e){
		        	  $.ajax({
			     	        url: "/foodSelectList.do",
			     	        success: function(html){
			     	         var value = $(this);
			     	        console.log(value); 
			     	        }
			     	    });
		          });
		        
		        //검색시 길찾기 버튼 값 지정
		        $(document).on('click',".searchBtn", function(e){
		        	var value = $(this).prev().val();
		        	var name = searchData.records[value][searchData.fields[0].id];
		        	var lat = searchData.records[value][searchData.fields[6].id];
					var lng = searchData.records[value][searchData.fields[7].id];
		        	console.log(value);
		        	location.href='https://map.kakao.com/link/to/'
		        	+ name
		        	+ ','
		        	+ lat
		        	+ ','
		        	+ lng ;
		        });
		      	//즐겨찾기목록에 길찾기 버튼 값 지정
		        $(document).on('click',".bookMarkSearch", function(e){
		        	var name = $(this).prev().prev().prev().val();
		        	console.log(name);
					var lat = $(this).prev().prev().val();
					console.log(lat);
		        	var lng = $(this).prev().val();
		        	console.log(lng);
		        	location.href='https://map.kakao.com/link/to/'
		        	+ name
		        	+ ','
		        	+ lat
		        	+ ','
		        	+ lng ;
		        });
		       	//검색 시 카카오맵 로드뷰 버튼 이벤트 생성
		        $(document).on('click',".viewBtn", function(e){
		        	e.preventDefault();
		        	var value = $(this).prev().val();
		        	var lat = searchData.records[value][searchData.fields[6].id];
					var lng = searchData.records[value][searchData.fields[7].id];
		        	console.log(value);
		        	location.href='https://map.kakao.com/link/roadview/'
		        	+ lat
		        	+ ','
		        	+ lng ;
		        });
		      	//즐겨찾기목록에 카카오맵 로드뷰 버튼 이벤트 생성
		        $(document).on('click',".bookMarkLoad", function(e){
		        	var name = $(this).prev().prev().prev().val();
		        	console.log(name);
					var lat = $(this).prev().prev().val();
					console.log(lat);
		        	var lng = $(this).prev().val();
		        	console.log(lng);
		        	location.href='https://map.kakao.com/link/roadview/'
		        	+ lat
		        	+ ','
		        	+ lng ;
		        });
		       	
		      //검색결과 th클릭시 지도이동
				$(document).on('click',".searchView", function(e){	
				var value = $(this).prev().val();
				
				//console.log(searchData.records[value][searchData.fields[6].id]);
				var lat = searchData.records[value][searchData.fields[6].id];
				var lng = searchData.records[value][searchData.fields[7].id];
				
				//위도 경도 값이 없을때
				if(lat==""&&lng==""){
					alert("지정된 위치를 찾을수 없습니다.");
				}else{
				// 이동할 위도 경도 위치를 생성합니다 
			    var moveLatLon = new kakao.maps.LatLng(lat, lng);
				
			    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
			    map.setLevel(5);
			    
			    // 지도 중심을 이동 시킵니다
			  	map.setCenter(moveLatLon);
						}
					});
		      	//즐겨찾기 목록 th클릭시 지도 이동
				$(document).on('click',".bookMarkSearchView", function(e){	
					var lat = $(this).prev().prev().val();
		        	var lng = $(this).prev().val();
					
					//위도 경도 값이 없을때
					if(lat==""&&lng==""){
						alert("지정된 위치를 찾을수 없습니다.");
					}else{
					// 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new kakao.maps.LatLng(lat, lng);
					
				    // 지도를 1레벨 내립니다 (지도가 확대됩니다)
				    map.setLevel(5);
				    
				    // 지도 중심을 이동 시킵니다
				  	map.setCenter(moveLatLon);
							}
						});
				
		     	});
			//document end 
			
		//즐겨찾기 추가 버튼 이벤트
     	$(document).on('click',".bookmark", function(e){
     		var value = $(this).parent().next().children().prev().val();
     		var key = $(this).prev().val();
     		var lat = searchData.records[value][searchData.fields[6].id]
     		var lng = searchData.records[value][searchData.fields[7].id]
     		var flag = true;
     		/* 단건조회 ajax
     			success flag값이 있으면 true 없으면 false*/
     			//console.log(key); 
     			 $.ajax({
	     	        type:"POST",
	     	        url: "foodSelect.do",
	     	        data : {"key" : key },
	     	        success: function(result){
	     	        	console.log(result);
	     	        	if(result == "") {
	     	        		flag = true;
	     	        	}else{
	     	        		flag= false;
	     	        	}
	     	        	if(flag == true){
				     	    $.ajax({
				     	        type:"POST",
				     	        url: "${pageContext.request.contextPath}/foodInsert.do",
				     	        data : {"key" : key , "lat" : lat , "lng" : lng },
				     	        success: function(result){
				     	        	if(result == 1){
				     	        		alert("즐겨찾기에 추가되었습니다.");
				     	        	}else{
				     	        		alert("추가실패");
				     	        	}
				     	        },
				     	        error: function(){
				     	        	alert("로그인이 필요한 서비스입니다.");
				     	        }
				     	    });
	     				}else if(flag == false){
	     		     	   $.ajax({
	     		     	        type:"POST",
	     		     	        url: "foodDelete.do",
	     		     	     	data : {"key" : key},
	     		     	        success: function(result){
	     		     	        	if(result == 1){
				     	        		alert("즐겨찾기 해제되었습니다.");
				     	        	}else{
				     	        		alert("삭제실패");
				     	        	}
	     		     	        }
	     		     	   });
						}
	     	        },
	     	    }); 
     		});
			//최근검색 삭제버튼 이벤트
			$(document).on('click','.rsrDel',function(e){
				var search = $(this).prev().val();
				console.log(search);
				$.ajax({
		     	        type:"POST",
		     	        url: "rsrDelete.do",
		     	     	data : {"search" : search},
		     	        success: function(result){
		     	        	if(result == 1){
	     	        		alert("최근검색 삭제완료!");
	     	        		selectRsrSearch();
	     	        		}else{
	     	        		alert("최근검색 삭제실패");
	     	        		}
		     	        }
		     	   });
			});
			
			//최근검색 th부분 클릭시 이벤트발생
			$(document).on('click','.clickRsr', function(){
				var value= $(this).prev().prev().val();
				console.log(value);
				$("#searchBox").attr('value',value);
				$("#foodSearch").trigger("click");
				$("#markDiv").hide();
				$("#rsrDiv").hide();
				$("#searchDiv").show();
			});
			
			
			//즐겨찾기 삭제버튼 이벤트
			$(document).on('click','.bookMarkDel',function(){
				var key = $(this).prev().val();
				console.log(key);
				$.ajax({
		     	        type:"POST",
		     	        url: "foodDelete.do",
		     	     	data : {"key" : key},
		     	        success: function(result){
		     	        	if(result == 1){
	     	        		alert("즐겨찾기 해제되었습니다.");
	     	        		selectFoodMark(1);
	     	        		}else{
	     	        		alert("삭제실패");
	     	        		}
		     	        }
		     	   });
			});
			
			
	</script>
</body>
</html>