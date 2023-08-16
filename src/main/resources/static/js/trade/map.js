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

		var iwContent = '', iwPosition = new kakao.maps.LatLng(33.450701,
				126.570667);

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

			// URL 생성 및 쿼리 파라미터 추가
			var nextPageUrl = '/trade.reg.go' + '?latitude=' + latitude
					+ '&longitude=' + longitude + '&inputContent='
					+ encodeURIComponent(inputContent);

			// 다음 페이지로 이동
			window.location.href = nextPageUrl;
		}
		//취소 버튼
		function goBack() {
			window.history.back();
		}
