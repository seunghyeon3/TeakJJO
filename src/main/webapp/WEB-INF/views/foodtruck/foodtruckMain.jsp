<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>맵 테스트</title>
<script type="text/javascript" src="resources/js/jquery-3.6.0.min.js"></script>

<style type="text/css">
#map {
	float: right;
	margin-top: 75px;
}

div #mapInfo {
	width: 200px;
	height : 75px;
	font-size: 14px;
}

#mapInfo a {
	font-size: 14px;
}

#mapSearch {
	margin-top: 75px;
	float: left;
}

.sidebar {
	margin-top: 75px;
	float: left;
	width : 20%;
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
.searchView{

}

</style>
</head>
<body>
<!-- 로드뷰 생성 -->
<div id="roadview"  style="width:100%;height:300px; display: none;"></div>

	<!-- ! Sidebar -->
	<aside class="sidebar">
		<div>
			<div>
				<ul>
					<li><a href="javascript:void(0);" style="cursor: pointer">
							푸드트럭 </a>
						<ul class="hide">
							<li><a href="javascript:void(0);" style="cursor: pointer; margin-top: 5px; "
								onclick="mapSearch()">검색</a></li>
							<li><a href="javascript:void(0);" style="cursor: pointer"
								onclick="foodMark()">즐겨찾기</a></li>
							<li><a href="javascript:void(0);" style="cursor: pointer"
								onclick="mapLoad()">길찾기</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- 검색 시작부분 -->
			<div id="searchDiv" class="hide">
				<input type="text" id="searchBox" name="searchBox"
					placeholder="검색어를 입력해주세요">
				<button id="foodSearch" class="btn btn-primary">검색</button>
				<div style="height: 500px; overflow: auto">
				<form action="" method="post">
					<table id="searchTable">
					
					</table>
					</form>
				</div>
			</div>
			<!-- 검색 끝 부분 -->
			<!-- 즐겨찾기 이동 -->
			<div id="markDiv" class="hide">
				<div><h3>즐겨찾기 목록</h3></div>
			</div>
		</div>
	</aside>
	<!-- ! Sidebar End -->
	<div id="map" style="width: 70%; height: 700px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=47ef13464842c3a22235787a9d64e6fc&libraries=services,clusterer"></script>
	<script>
		var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
			center : new kakao.maps.LatLng(35.20888446, 128.1250549), // 지도의 중심좌표
			level : 14
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
		$.get( "/resources/json/foodtruckdata.json",
						function(data) {
						searchData = data;
							// 데이터에서 좌표 값을 가지고 마커를 표시합니다
							// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
							// 마커가 지도 위에 표시되도록 설정합니다

							markers = $(data.records)
									.map(
											function(i, record) {
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
																	+ '" style="color:blue" ; target="_top">길찾기</a> | '
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

		function makeOverListener(map, marker, infowindow) {
			infowindow.close();
			return function() {
				infowindow.open(map, marker);
			};
		}

		function mapSearch() {
			$("#markDiv").hide();
			$("#searchDiv").show();
		}
		function foodMark() {
			$("#searchDiv").hide();
			$("#markDiv").show();
		}
		function mapLoad() {
		
		}
		
		
		
			$(document).ready(function(){
		        // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
		        $(".sidebar>div>div>ul>li>a").click(function(){
		            var submenu = $(this).next("ul");
		            // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
		            if( submenu.is(":visible") ){
		                submenu.slideUp();
		            }else{
		                submenu.slideDown();
		                return;
		            }
		        });
		        
		        //검색버튼 클릭시 이벤트발생
		        $("#foodSearch").on("click",function(e){
		        	e.preventDefault();
		        	console.log(searchData.records);
		        	//console.log(searchData.fields);
					
		        	
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
		        		//console.log(searchData.records[searchArray[i]][searchData.fields[0].id]);
		        		$tr = $(`<tr>
		        				<input type="hidden" value=`+searchArray[i]+`>
								<th style="cursor: pointer" colspan="2" class="searchView" >`+searchData.records[searchArray[i]][searchData.fields[0].id]+`</th>
								</tr>
								<tr>
									<th><input type="hidden" value="Add"><button class="bookmark btn btn-primary">즐겨찾기 추가</button></th>
									<th><input type="hidden" value=`+searchArray[i]+`><button class="searchBtn btn btn-primary">길찾기</button></th>
								</tr>`);
		        		$("#searchTable").append($tr);
		        		$tr.addClass('tr');
		        		}
		        		
		        		//검색값 초기화
		        		$("#searchBox").val('');
		        	}
		        	
		        })
		         //검색버튼 이벤트 끝부분
		         
		       
		        //길찾기 버튼 값 지정
		        $(document).on('click',".searchBtn", function(e){
		        	e.preventDefault();
		        	//console.log($(this).prev().val());
		        	var value = $(this).prev().val();
		        	console.log(value);
		        });
		       
		     	//검색결과 th클릭시 지도이동
				$(document).on('click',".searchView", function(e){
				var value = $(this).prev().val();
				//console.log(value);
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
		     	
		     	//로드뷰 부분
		     	/* $(document).on('click',".loadViewBtn",function(e){
		     		var roadviewContainer = document.getElementById('roadview'); //로드뷰를 표시할 div
		     		var roadview = new kakao.maps.Roadview(roadviewContainer); //로드뷰 객체
		     		var roadviewClient = new kakao.maps.RoadviewClient(); //좌표로부터 로드뷰 파노ID를 가져올 로드뷰 helper객체
		     		
		     		var value = $(this).prev().val();
		     		var lat = searchData.records[value][searchData.fields[6].id];
					var lng = searchData.records[value][searchData.fields[7].id];

		     		var position = new kakao.maps.LatLng(lat, lng);

		     		// 특정 위치의 좌표와 가까운 로드뷰의 panoId를 추출하여 로드뷰를 띄운다.
		     		roadviewClient.getNearestPanoId(position, 50, function(panoId) {
		     		    roadview.setPanoId(panoId, position); //panoId와 중심좌표를 통해 로드뷰 실행
		     		});
		     		$("roadview").show();
		     	}) */
		     	
		     	//즐겨찾기
		     	$(document).on('click',".bookmark",function(e){
		     		if($(".bookmark").prev().val== 'Add'){
		     	    $.ajax({
		     	        type:"POST",
		     	        url: "/foodInsert.do",
		     	        success: function(html){
		     	        $(".bookmark").prev().val= 'remove';
		     	        },
		     	        error: function(xhr, status, error) {
		     	            alert(error);
		     	        }
		     	    });
		     	    return;
		     	    
		     		}else if($(".bookmark").prev().val== 'remove')
		     	   $.ajax({
		     	        type:"POST",
		     	        url: "/foodDelete.do",
		     	        success: function(html){
		     	        	
		     	        },
		     	        error: function(xhr, status, error) {
		     	            alert(error);
		     	        }  
		     	    });
		     	})
			});
			
			
		 
	</script>
</body>
</html>