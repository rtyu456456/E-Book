<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/index.css">
<script type="text/javascript" src="js/index.js"></script>
</head>
<body>
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
						<button class="grade_board_btn">현자 게시판</button>
						<br>
						<button class="grade_board_btn">학자 게시판</button>
						<br>
						<button class="grade_board_btn">조교 게시판</button>
						<br>
						<button class="grade_board_btn">학생 게시판</button>
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
									<img src="/img/emptyPin.png"> &nbsp; ${c.c_name }
								</button>
							</form>
						</c:forEach>

						<br>
					</div>
					<br> <br>
				</div>
			</div>
</body>
</html>