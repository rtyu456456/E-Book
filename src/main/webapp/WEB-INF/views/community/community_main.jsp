<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/community/community_main.css">
</head>
<body>
	<div class="commu_contents">
		<div class="commu_content">

			<div class="commu_board">
				<br>
				<div class="commu_board_title">My 게시판</div>
				<br>
				<div class="board_box">
					<br>
					<button class="commu_board_btn">
						<img alt="" src="/img/커뮤니티_내가 쓴 글_icon.png"> &nbsp;내가 쓴 글
					</button>

					<button class="commu_board_btn">
						<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png"> &nbsp;댓글 단 글
					</button>

					<button class="commu_board_btn">
						<img alt="" src="/img/커뮤니티_즐겨찾기함_icon.png"> &nbsp;내가 고정한 게시판
						(변수)
					</button>
					<br>
				</div>
			</div>

			<div class="commu_board">
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

			<div class="commu_board">
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

			<div class="commu_board">
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
			</div>
		</div>
	</div>
</body>
</html>