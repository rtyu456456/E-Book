<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/main/main_index.css">
</head>
<body>
	<div class="commu_header">
		<div class="commu_logo">
			<div class="logo_icon">
				<img src="/img/logo_icon.png">
			</div>
		</div>

		<div class="header_contents">
			<button class="menu_btn">
				<img src="/img/menu_icon.png">
			</button>
			<div id="community_txt">커뮤니티</div>

			<form action="/comment.my.post">
				<img id="commu-alarm" src="/img/commentAlarm.png">
				<button class="login_box">
					<img class="login_img" alt="" src="${sessionScope.user.u_profile }">
				</button>
			</form>
			<input type="hidden" id="count-alarm" value="${commentAlarm }">
		</div>


		<form action="/seach.community">
			<div class="commu_menu">
				<div class="box_shadow">
					<input name="c_name" class="commu_seach"
						placeholder="게시판 이름을 검색해보세요.">
					<button class="commu_seach_btn">
						<img src="/img/돋보기_icon.png" maxlength=10>
					</button>
				</div>
			</div>
		</form>

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
					<h4 onclick="location.href='usermain'">내 정보</h4>
					<h4 onclick="location.href='bookRecord.fin'">읽은 책</h4>
					<h4 onclick="location.href='bookRecord.ing'">읽고 있는 책</h4>
					<h4 onclick="location.href='bookRecord.wish'">읽고 싶은 책</h4>
				</div>

				<div class="menu-list-gh">
					<h2 onclick="location.href='community_main'">커뮤니티</h2>
					<h4
						onclick="location.href='go.my.post?cp_owner=${sessionScope.user.u_id }'">내가
						쓴 글</h4>
					<h4
						onclick="location.href='go.my.reply?cr_owner=${sessionScope.user.u_id }'">댓글
						단 글</h4>
				</div>

				<div class="menu-list-gh">
					<h2 onclick="location.href='trade.go'">
						책방<span>중고거래</span>
					</h2>
					<h4 onclick="location.href='trade.choose.go'">판매하기</h4>
					<h4 onclick="location.href='trade.sale.now	'">판매 내역</h4>
					<h4 onclick="location.href='trade.Msg.get.to'">쪽지함</h4>
				</div>
			</div>
		</div>
	</form>
	</dialog>


</body>
<script type="text/javascript">
	let countAlarm = document.getElementById("count-alarm").value;
	let alarmImg = document.getElementById("commu-alarm");

	if (countAlarm >= 1) {
		alarmImg.style.visibility = "visible";
	} else if (countAlarm == 0) {
		alarmImg.style.visibility = "hidden";

	}

	$(function() {
		let menu = document.querySelector('.menu_btn');
		let dialog = document.querySelector('#menu-dialog');
		menu.addEventListener('click', function(event) {
			console.log(111);
			dialog.showModal();
		})
	});
</script>
</html>