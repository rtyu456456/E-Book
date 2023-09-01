<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.tailwindcss.com"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<style type="text/css">
.menu-title-gh {
	width: 12rem;
	height: 3.5rem;
	background-color: transparent;
	border: none;
	margin-top: 3rem;
	margin-bottom: 5rem;
	margin-left: 2rem;
}

.menu-title-gh img {
	width: 12rem;
	height: 3.5rem;
}

.menu-close-gh {
	width: 4.5rem;
	heigt: 4.5rem;
	background-color: transparent;
	border: none;
}

.menu-close-gh img {
	width: 2.5rem;
	heigt: 2.5rem;
	position: absolute;
	top: 3.5rem;
	right: 3.5rem;
}

.menu-list-box {
	margin-left: 2rem;
}

.menu-list-gh {
	margin-top: 6rem;
}

.menu-list-gh img {
	height: 4rem;
	margin-bottom: 1rem;
}

.menu-list-gh h2 {
	font-size: 4rem;
	font-weight: 500;
	margin-bottom: 1rem;
}

.menu-list-gh h4 {
	color: rgba(38, 40, 61, 0.6);
	font-size: 2rem;
	margin-bottom: 1rem;
	margin-left: 0.5rem;
}

.menu-list-gh span {
	font-size: 1.5rem;
	font-weight: 800;
	margin-left: 0.5rem;
}

#menu-dialog {
	margin: 0;
	padding: 0;
	width: 75vw;
	height: 100vh;
	background-color: white;
	border-radius: 0px 50px 0px 0px;
	box-shadow: 15px 5px 20px 0px rgba(0, 0, 0, 0.10);
	position: relative;
	border: none;
}
</style>
</head>
<body>
	<div
		class="flex flex-col justify-start items-start h-screen bg-[#F5F6FA]">
		<div id="header" class="block w-full h-1/12">
			<div class="flex w-full justify-start items-center mt-24 mb-10">
				<div class="menu-icon-div w-1/3">
					<img class="menu-modal-open w-1/4 ml-8" alt=""
						src="imgs/menu_icon.png">
				</div>
				<div class="page-icon-div flex w-1/3 justify-center items-center">
					<img class="w-5/6" alt="" src="imgs/my_page_txt.png">
				</div>
				<div class="user-icon-div w-1/3"></div>
			</div>
		</div>
		<div id="nav" class="block w-full h-1/12">
			<div class="menu flex w-full pt-10 mb-20 font-bold">
				<div class="user-detail flex w-1/4 justify-center items-center">
					<a href="usermain"> <span
						class="block text-[2rem] h-16 text-[#26283D66] border-b-4 border-b-black">내
							정보</span>
					</a>
				</div>
				<div class="br-end flex w-1/4 justify-center items-center">
					<a href="bookRecord.fin"> <span
						class="block text-[2rem] mr-12 h-16 border-b-4 border-b-[#F5F6FA] text-[#26283D66]">읽은
							책</span>
					</a>
				</div>
				<div class="br-ing flex w-1/4 justify-center items-center">
					<a href="bookRecord.ing"> <span
						class="block text-[2rem] mr-10 h-16 border-b-4 border-b-[#F5F6FA] text-[#26283D66]">읽고
							있는 책</span>
					</a>
				</div>
				<div class="br-wish flex w-1/4 justify-center items-center">
					<a href="bookRecord.wish"> <span
						class="block text-[2rem] mr-10 h-16 border-b-4 border-b-[#F5F6FA] text-[#26283D66]">읽고
							싶은 책</span>
					</a>
				</div>
			</div>
		</div>
		<div id="content-page" class="flex w-full h-3/4">
			<jsp:include page="${contentPage }"></jsp:include>
		</div>
	</div>

	<dialog id="menu-dialog" class="menu-modal">
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
				<h4 onclick="location.href='go.my.post?cp_owner=${sessionScope.user.u_id }'">내가 쓴 글</h4>
				<h4 onclick="location.href='go.my.reply?cr_owner=${sessionScope.user.u_id }'">댓글 단 글</h4>
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
	</dialog>
</body>
<script type="text/javascript" src="js/user/bookrecord.js"></script>
<script type="text/javascript">
	$(function() {

		$('.menu-modal-open').click(function() {
			let menu_modal = document.querySelector('.menu-modal');

			menu_modal.showModal();

		});
	});
</script>
</html>