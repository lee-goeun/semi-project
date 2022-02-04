<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="temp_1">
<div class="temp_2"><img src="/resources/image/logo.png" class="logo" /></div>
<div class="temp_3">오시는길</div>

<div class="temp_4" >서울특별시 강남구 언주로 508 14층(역삼동, 서울상록빌딩)</div>

<div id="map" style="width:1000px;;height:700px;"></div>
<div class="temp_5"><img src="/resources/image/info.png" class="info" /></div>
</div>























<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=142c83906c0d40ddfed05bec20f2f4bd"></script>
<script>
    const mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = { 
            center: new kakao.maps.LatLng(37.50137632146012, 127.03963096245923), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };

    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
    const map = new kakao.maps.Map(mapContainer, mapOption); 
    
    var markerPosition  = new kakao.maps.LatLng(37.50137632146012, 127.03963096245923); 
 // 마커를 생성합니다
 var marker = new kakao.maps.Marker({
     position: markerPosition
 });

 // 마커가 지도 위에 표시되도록 설정합니다
 marker.setMap(map);
    </script>