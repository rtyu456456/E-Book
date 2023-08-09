<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
							<c:forEach var="c" items="${communitys }">
							<form action="/go.commu.post">
							<button class="commu_board_btn" name="c_no" value="${c.c_no }">
								<img  src="/img/emptyPin.png"> &nbsp; ${c.c_name } 
							</button> 
							</form>
							</c:forEach>

							<br> 
						</div>
						<br> <br>
					</div>
				</div>
			</div>
		<br>
		<br>
		<br>
		</div>

</body>
</html>