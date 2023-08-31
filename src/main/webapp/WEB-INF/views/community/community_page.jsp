<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- css(위에 있음)// js(아래 있음) -->
<link rel="stylesheet" href="css/community/community_page.css">
<link rel="stylesheet" href="css/community/community_main_header.css">
<link rel="stylesheet" href="css/community/community_main_contents.css">
<link rel="stylesheet" href="css/community/community_post_header.css">
<link rel="stylesheet" href="css/community/community_post_contents.css">
<link rel="stylesheet" href="css/community/community_detail_contents.css">
<link rel="stylesheet" href="css/community/community_writing_header.css">
<link rel="stylesheet" href="css/community/community_writing_contents.css">
<link rel="stylesheet" href="css/community/community_seach_contents.css">
<link rel="stylesheet" href="css/community/community_madePost_contents.css">
<link rel="stylesheet" href="css/community/community_commentMyPost_contents.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR:wght@100;200;300;400;500;600;700&display=swap')
	;
/* font-family: 'IBM Plex Sans KR', sans-serif; */
</style>
</head>
<body>
	<div class="commu_container">
		<div class="commu_header_page">
			<jsp:include page="${commu_header_page}"></jsp:include>
		</div>
		<div class="commu_contents_page">
			<jsp:include page="${commu_contents_page }"></jsp:include>
		</div>
	</div>
	
	<dialog id="menu-dialog">
	<form method="dialog">
		<div class="side-menu-gh">
			<button class="menu-title-gh" onclick="location.href='main'">
				<img src="/img/pageup_logo.png">
			</button>
			<button class="menu-close-gh">
				<img src="/img/x_icon.png">
			</button>
			<div class="menu-list-box">
				<div class="menu-list-gh">
					<img src="/imgs/my_page_txt.png">
					<!-- onclick="location.href='user_main'" -->
					<h4 >내 정보</h4>
					<h4>읽은 책</h4>
					<h4>읽고 있는 책</h4>
					<h4>읽고 싶은 책</h4>
				</div>

				<div class="menu-list-gh">
					<h2>커뮤니티</h2>
					<h4>내가 쓴 글</h4>
					<h4>댓글 단 글</h4>
				</div>

				<div class="menu-list-gh">
					<h2>
						책방<span>중고거래</span>
					</h2>
					<h4>판매하기</h4>
					<h4>판매 내역</h4>
					<h4>쪽지함</h4>
				</div>
			</div>
		</div>
	</form>
	</dialog>
	
</body>
<script type="text/javascript">
/*사이드 메뉴 창*/
$(function() {
	let menu = document.querySelector('.menu_btn');
	let dialog = document.querySelector('#menu-dialog');
	menu.addEventListener('click', function (event){
		console.log(111);
		dialog.showModal();
	})
});


</script>
</html>