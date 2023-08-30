<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2ec9e96982d203168b7d94dde7b62fe"></script>
<link rel="stylesheet" href="css/trade/infoReg.css">
<link rel="stylesheet" href="css/trade/tradeMap.css">

<script type="text/javascript">
	//페이지 로드 시에 Local Storage에서 입력 값을 읽어와서 적용하는 함수
	function loadInputsFromLocalStorage() {
		const t_title = localStorage.getItem('t_title');
		const t_book_title = localStorage.getItem('t_book_title');
		const t_authors = localStorage.getItem('t_authors');
		const t_publisher = localStorage.getItem('t_publisher');
		const t_price = localStorage.getItem('t_price');
		const t_contents = localStorage.getItem('t_contents');
		const t_thumbnail = localStorage.getItem('t_thumbnail');
		
		if (localStorage.length !== 0) {
			document.getElementsByName('t_title')[0].value = t_title;
			document.getElementsByName('t_book_title')[0].value = t_book_title;
			document.getElementsByName('t_authors')[0].value = t_authors;
			document.getElementsByName('t_publisher')[0].value = t_publisher;
			document.getElementsByName('t_price')[0].value = t_price;
			document.getElementsByName('t_contents')[0].value = t_contents;
			document.getElementsByName('t_thumbnail')[0].value = t_thumbnail;
		}
	}

// 	페이지 로드 시에 Local Storage에서 값 불러오기
	window.onload = function() {
		loadInputsFromLocalStorage();
	}
	
</script>


</head>
<body>
	<div class="container-reg">
		<div class="reginfo">
			<br>
			<form action="reg.trade.book" method="post"	enctype="multipart/form-data" id="regForm">
				<br>
				<div class="book-info-reg">책 정보를 입력해 주세요</div>
				<br> <input type="hidden"
					value="${sessionScope.user.u_id }" name="t_owner">

				<div class="input-group">
					<input placeholder="글 제목" name="t_title"
						oninput="localStorage.setItem('t_title', this.value)">
				</div>
				<!-- 					검색 정보 불러오기  -->
				<c:choose>
					<%-- 검색 정보 불러오기  --%>
					<c:when test="${param.title != null}">

						<div class="input-group2">
							<input value="${param.title }" name="t_book_title" readonly
								oninput="localStorage.setItem('t_book_title', this.value)">
							<script> 
								localStorage.setItem('t_book_title', '${param.title}');
  							</script>
						</div>
						<div class="input-group2">
							<input value="${param.authors }" name="t_authors" readonly
								oninput="localStorage.setItem('t_authors', this.value)">
							<script> 
 								localStorage.setItem('t_authors','${param.authors}');
 							</script>
						</div>
						<div class="input-group2">
							<input value="${param.publisher }" name="t_publisher" readonly
								oninput="localStorage.setItem('t_publisher', this.value)">
							<script> 
 								localStorage.setItem('t_publisher', '${param.publisher}'); 
 							</script>
						</div>
						<div class="input-group2">
							<input value="${param.price }" name="price" readonly>
							<script> 
								localStorage.setItem('b_price', '${param.price}');
 							</script>
						</div>
						<div class="input-group">
							<input placeholder="판매가" name="t_price" value=""
								oninput="localStorage.setItem('t_price', this.value)">
						</div>
						<div class="input-group3">
							<img alt="" src="${param.thumbnail }"> 
							<input type="hidden" value="${param.thumbnail}" name="t_thumbnail">
							<script> 
 								localStorage.setItem('t_thumbnail', '${param.thumbnail}');
 							</script>
						</div>
					</c:when>

					<%-- 수동 입력  --%>
					<c:otherwise>

						<div class="input-group">
							<input placeholder="책 이름" name="t_book_title"
								oninput="localStorage.setItem('t_book_title', this.value)">
						</div>
						<div class="input-group">
							<input placeholder="저자" name="t_authors"
								oninput="localStorage.setItem('t_authors', this.value)">
						</div>
						<div class="input-group">
							<input placeholder="출판사" name="t_publisher"
								oninput="localStorage.setItem('t_publisher', this.value)">
						</div>
						<div class="input-group">
							<input placeholder="판매가" name="t_price"
								oninput="localStorage.setItem('t_price', this.value)">
						</div>
						<div class="input-group">
							<input type="file" name="t_file"
							oninput="localStorage.setItem('t_file', this.value)">
						</div>
					</c:otherwise>
				</c:choose>

				<div class="input-group-text">
					<textarea rows="8" cols="2" placeholder="도서 상태 정보"
						name="t_contents"
						oninput="localStorage.setItem('t_contents', this.value)"></textarea>
				</div>
				<div class="input-group">
					<a class="btn-open-modal">희망 장소 선택하기</a> <br> 
					<span id="input-content"></span> <input hidden value="" name="t_map_lat" id="t_map_lat"> 
					<input hidden value="" name="t_map_lng"	id="t_map_lng">
					<input hidden value="" name="t_marker_name" id="t_marker_name">
				</div>
				<br>
				<div class="reg-btn">
					<button>등록하기</button>
				</div>
			</form>



		</div>


	</div>

	<div class="modal">
		<div class="modal_body">

			<div class="container-map">
				<div id="map"></div>
				<div class="enterMapInfo">
					<input type="text" id="inputContent" placeholder="장소에 대한 상세 설명">
					<div class="btn-menu">
						<button onclick="updateInfoWindowContent()">업데이트</button>
						<button onclick="regTradeLocation()">등록하기</button>
						<button onclick="closeModal()">취소하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
	//모달 관련
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.btn-open-modal');

        btnOpenModal.addEventListener("click", ()=>{
        
         modal.style.display="flex";
       	 map.relayout();
        });
        

//map 관련
	var container = document.getElementById('map');
		var options = {
			center : new kakao.maps.LatLng(33.452613, 126.570888),
			level : 1
		};

		var map = new kakao.maps.Map(container, options);
		var marker = new kakao.maps.Marker({
			position : map.getCenter(),
			map : map
		});

		var iwContent = '', iwPosition = new kakao.maps.LatLng(33.450701, 126.570667);

		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 인포윈도우 표시
		infowindow.open(map, marker);

		kakao.maps.event.addListener(marker, 'click', function() {
		});

		kakao.maps.event.addListener(map, 'drag', function() {
			marker.setPosition(map.getCenter());
			infowindow.setPosition(marker.getPosition());
		});

		// 입력 폼의 값을 가져와 인포윈도우 내용을 업데이트하는 함수
		function updateInfoWindowContent() {
			var inputContent = document.getElementById('inputContent').value;
			iwContent = '<div style="padding:5px;">' + inputContent + '</div>';
			infowindow.setContent(iwContent);
		}
	

		function regTradeLocation() {
			var markerPosition = marker.getPosition();
			var latitude = markerPosition.getLat();
			var longitude = markerPosition.getLng();
			var inputContent = document.getElementById('inputContent').value;

			let t_map_lat = document.getElementById('t_map_lat').value = latitude;
			let t_map_lng = document.getElementById('t_map_lng').value = longitude;
			let t_map_marker_name = document.getElementById('t_marker_name').value = inputContent;
			document.getElementById('input-content').innerText = inputContent;
			
		    // 모달 닫기
		    closeModal();	
		}
		
		function closeModal() {
            modal.style.display = "none";
        }
	</script>

</body>
</html>