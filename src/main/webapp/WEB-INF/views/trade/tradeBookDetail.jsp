<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/tradeBookDetail.css">

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a2ec9e96982d203168b7d94dde7b62fe"></script>
<script type="text/javascript"
	src="main/resources/static/js/trade/site_qurey.js"></script>
</head>

<body>
	<div class="detail-container">

		<div class="book-info">
			<div class="book-img">
				<img alt="" src="">
			</div>
			<div class="book-basic">
				<div class="book-title">${trade.t_book_title }</div>
				<div class="book-authors">${trade.t_authors }</div>
				<div class="book-publisher">${trade.t_publisher }</div>
				<div class="book-price">
					<fmt:formatNumber value="${trade.t_price }" pattern="#,###원" />
				</div>
				<br>
				<div class="trade-title">${trade.t_title }</div>

			</div>
			<div class="trader_From">
				<div>${userinfo.u_name }</div>
				<div>${userinfo.u_id }</div>
				<div>${userinfo.u_achievement }</div>
			</div>
		</div>
		<hr>
		<div class="book-contents">
			<p>${trade.t_contents }</p>
		</div>
		<div class="trade-map">
			<span>거래 희망 장소</span>
			<div id="map"></div>
		</div>
		<br>
		<div class="trade-btn">

			<c:choose>
				<c:when test="${trade.t_owner == loginMember.u_id }">
					<div class="trade-sell-me">
						<button onclick="confirmAndComplete(${trade.t_no})">판매
							완료하기</button>
						<button>수정하기</button>
					</div>
				</c:when>
				<c:otherwise>
					<form action="trade.Send.Msg">
						<div class="modal">
							<div class="modal_body">
								<input type="hidden" value="${trade.t_no }" name="m_trade">
								<input type="hidden" value="${trade.t_owner }" name="m_to">
								<input type="hidden" value="${sessionScope.loginMember.u_id }"
									name="m_from">
								<h1>${trade.t_owner}님에게보내는쪽지</h1>
								<br>
								<textarea name="m_txt"></textarea>
								<button class="sendMsg">전송</button>
							</div>
						</div>
					</form>
					<div class="open-modal">
						<button class="btn-open-modal">쪽지 보내기</button>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<script>
	 var container = document.getElementById('map');
	    var latitude = ${trade.t_map_lat }; // JSP에서 받아온 경도 값
	    var longitude = ${trade.t_map_lng}; // JSP에서 받아온 위도 값
	    var options = {
	        center : new kakao.maps.LatLng(latitude, longitude),
	        level : 1
	    };

		var map = new kakao.maps.Map(container, options);
		var marker = new kakao.maps.Marker({
			position : map.getCenter(),
			map : map
		});
		
        const modal = document.querySelector('.modal');
        const btnOpenModal=document.querySelector('.btn-open-modal');

        btnOpenModal.addEventListener("click", ()=>{
            modal.style.display="flex";
            
            map.setDraggable(false);
            map.setZoomable(false);
        });
        
        modal.addEventListener("click", (event) => {
            if (event.target === modal) {
                modal.style.display = "none";
                // 맵 활성화
                map.setDraggable(true);
                map.setZoomable(true);
            }
        });
        
       // 판매 완료 확인 
    function confirmAndComplete(t_no) {
    var confirmation = confirm("정말로 판매를 완료하시겠습니까?");
    if (confirmation) {
        // 확인 버튼을 클릭한 경우
        location.href = 'trade.complete?t_no=' + t_no;
    } else {
        // 취소 버튼을 클릭한 경우
        // 아무 작업도 수행하지 않음
    }
}
        
	</script>

</body>
</html>