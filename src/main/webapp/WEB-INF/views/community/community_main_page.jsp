<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/community/communityMainPage.js"></script>
<link rel="stylesheet" href="css/community/community_main_page.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Diphylleia&family=Felipa&family=Orbit&display=swap')
	;
</style>

<!--타이틀 한국어글꼴 	font-family: 'Diphylleia', serif;  -->
<!--타이틀 영어글꼴 		font-family: 'Felipa', cursive; -->
<!--그외 한글 글꼴		font-family: 'Orbit', sans-serif; -->

</head>
<body>
	<div class="commu_container">
		<div class="commu_header">
			<button class="menu_btn">
				<img src="/img/menu_icon.png">
			</button>
			<span id="community_txt">커뮤니티</span>
			<div class="login_box">
				<div class="padding">
					<img class="login_img" alt="" src="/img/user_img.jpg">
				</div>
				<div class="padding">
					<div class="login_name">유저닉네임</div>
					<div class="login_grade">유저등급</div>
					<div class="login_btn">
						<button class="alam_btn">
							<img alt="" src="/img/alarm.png">
						</button>
						<button class="logout_btn">로그아웃</button>
					</div>
				</div>
			</div>
		</div>
		<div class="commu_menu">
			<input class="commu_seach" placeholder="다른 게시판을 검색해보세요.">
			<button class="commu_seach_btn">
				<img src="/img/seachBtn.png" maxlength=10>
			</button>
		</div>
		<div class="commu_contents">
			<div class="commu_content">
				<div class="commu_myboard">
					<br>
					<div class="commu_myboard_items">
						<div class="commu_board_title">My 게시판</div>
						<br>
						<button class="commu_board_btn">
							<img alt="" src="/img/note.png"> &nbsp;내가 쓴 글
						</button>

						<button class="commu_board_btn">
							<img alt="" src="/img/chaticon.png"> &nbsp;댓글 단 글
						</button>

						<button class="commu_board_btn">
							<img alt="" src="/img/pin.png"> &nbsp;내가 고정한 게시판 (변수)
						</button>
					</div>
					<br>
				</div>
				

				<div class="commu_boards_background">
					<div class="hot_board board">
						<br>
						<div class="commu_board_title">실시간 HOT 게시판</div>
						<br>
						<div class="board_box">
							<br>
							<button class="commu_board_btn">1위</button>
							<button class="commu_board_btn">2위</button>
							<button class="commu_board_btn">3위</button>
							<button class="commu_board_btn">4위</button>
							<button class="commu_board_btn">5위</button>
							<br>
						</div>
						<br>
					</div>
					<div class="grade_board board">
						<br>
						<div class="commu_board_title">등급별 독서토론 게시판</div>
						<br>
						<div class="board_box">
							<br>
							<button class="grade_board_btn D">다이아 책벌레 게시판</button>
							<br>
							<button class="grade_board_btn G">골드 책벌레 게시판</button>
							<br>
							<button class="grade_board_btn S">실버 책벌레 게시판</button>
							<br>
							<button class="grade_board_btn B">브론즈 책벌레 게시판</button>
							<br> <br>
						</div>
						<br>
					</div>
					<div class="free_board board">
						<br>
						<div class="commu_board_title">자유 게시판</div>
						<br>
						<div class="board_box">
							<br>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<button class="commu_board_btn">
								<img alt="" src="/img/emptyPin.png"> &nbsp;일반 게시판 (리스트)
							</button>
							<br> <br>
						</div>
						<br> <br>
					</div>
				</div>
			</div>
		<br>
		<br>
		<br>
		</div>

	</div>
</body>
</html>