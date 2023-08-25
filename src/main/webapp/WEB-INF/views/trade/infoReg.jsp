<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/trade/infoReg.css">

<script type="text/javascript">
	//페이지 로드 시에 Local Storage에서 입력 값을 읽어와서 적용하는 함수
	function loadInputsFromLocalStorage() {
		const t_title = localStorage.getItem('t_title');
		const t_book_title = localStorage.getItem('t_book_title');
		const t_authors = localStorage.getItem('t_authors');
		const t_publisher = localStorage.getItem('t_publisher');
		const t_price = localStorage.getItem('t_price');
		const t_contents = localStorage.getItem('t_contents');

// 		const urlParameter = window.location.searchParams;
// 		const t_title = urlParams.get('title');
// 		const t_title = urlParams.get('t_book_title');
// 		const t_title = urlParams.get('tag');
// 		const t_title = urlParams.get('tag');
// 		const t_title = urlParams.get('tag');
// 		const t_title = urlParams.get('tag');
		
		if (localStorage.length !== 0) {
			document.getElementsByName('t_title')[0].value = t_title;
			document.getElementsByName('t_book_title')[0].value = t_book_title;
			document.getElementsByName('t_authors')[0].value = t_authors;
			document.getElementsByName('t_publisher')[0].value = t_publisher;
			document.getElementsByName('t_price')[0].value = t_price;
			document.getElementsByName('t_contents')[0].value = t_contents;
		}

	}

	// 페이지 로드 시에 Local Storage에서 값 불러오기
	window.onload = function() {
		loadInputsFromLocalStorage();
	}
</script>


</head>
<body>
	<div class="container-reg">
		<div class="reginfo">
			<br>
			<form action="reg.trade.book" method="post"
				enctype="multipart/form-data" id="regForm">
				<br>
				<div class="book-info-reg">책 정보를 입력해 주세요</div>
				<br> <input type="hidden"
					value="${sessionScope.loginMember.u_id }" name="t_owner">
				<div class="input-group">
					<input placeholder="글 제목" name="t_title"
						oninput="localStorage.setItem('t_title', this.value)">
				</div>
				<c:choose>
					<c:when test="${param.title != null}">
						<div class="input-group2">
							<input value="${param.title }" name="t_book_title" readonly
								oninput="localStorage.setItem('t_book_title', this.value)">
							<script>
								localStorage.setItem('t_book_title', 
										'${param.title}');
 							</script> 
						</div>
						<div class="input-group2">
							<input value="${param.authors }" name="t_authors" readonly
								oninput="localStorage.setItem('t_authors', this.value)">
							<script>
								localStorage.setItem('t_authors',
										'${param.authors}');
							</script>
						</div>
						<div class="input-group2">
							<input value="${param.publisher }" name="t_publisher" readonly
								oninput="localStorage.setItem('t_publisher', this.value)">
							<script>
								localStorage.setItem('t_publisher',
										'${param.publisher}');
							</script>
						</div>
						<div class="input-group2">
							<input value="${param.price }" name="price" readonly>
							<script>
								localStorage.setItem('t_price',
										'${param.price}');
							</script>
						</div>
						<div class="input-group">
							<input placeholder="판매가" name="t_price"
								oninput="localStorage.setItem('t_price', this.value)">
						</div>
					</c:when>
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
					</c:otherwise>
				</c:choose>

				<div class="input-group">
					<input type="file" name="t_file">
				</div>
				<div class="input-group-text">
					<textarea rows="8" cols="2" placeholder="도서 상태 정보"
						name="t_contents"></textarea>
				</div>
				<div class="input-group">
					<a href="trade.map.go">희망 장소 선택하기</a>
					<br> <span>${param.inputContent }</span>
					<input type="hidden" value="${param.latitude }" name="t_map_lat">
					<input type="hidden" value="${param.longitude }" name="t_map_lng">
					<input type="hidden" value="${param.inputContent }"
						name="t_marker_name">
				</div>
				<br>
				<div class="reg-btn">
					<button>등록하기</button>
				</div>
			</form>
		</div>
	</div>


	<script>
		
// 		if(${param.title == null}){
// 			localStorage.clear()
// 		}
	</script>

</body>
</html>