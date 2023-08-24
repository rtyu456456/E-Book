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
					<form action="/go.my.post">
						<button name="cp_owner" value="김포공주" class="commu_board_btn">
							<img alt="" src="/img/커뮤니티_내가 쓴 글_icon.png"> &nbsp;내가 쓴 글
						</button>
					</form>

					<form action="/go.my.reply">
						<button name="cr_owner" value="김포공주" class="commu_board_btn">
							<img alt="" src="/img/커뮤니티_댓글 단 글_icon.png"> &nbsp;댓글 단 글
						</button>
					</form>
					<c:forEach var="pin" items="${pinnedCommu  }">
					<button class="commu_board_btn">
						<img onclick="notPinnedCommunity('${pin.c_no}')"  alt="" src="/img/커뮤니티_즐겨찾기함_icon.png"> &nbsp; ${pin.c_name }
					</button>
					</c:forEach>
					<br>
				</div>
			</div>




			<!-- <div class="commu_board">
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
			</div> -->

			<div class="commu_board">
				<br>
				<div class="commu_board_title">자유 게시판</div>
				<br>
				<div class="board_box">
					<br>
					<c:forEach var="c" items="${communitys }">
						<form action="/go.commu.post">
							<button class="commu_board_btn" name="c_no" value="${c.c_no }">
								<img id="not-pinned" onclick="pinnedMyCommunity('${c.c_no }')"
									src="/img/커뮤니티_즐겨찾기안함_icon.png"> &nbsp; ${c.c_name }
							</button>
						</form>
					</c:forEach>
					<br>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	let notPinned = document.getElementById("not-pinned");	
	
	function pinnedMyCommunity(c_no) {
		event.preventDefault(); 
		console.log(c_no);
		location.href="/do.pinned.commu?lr_where_no=" + c_no;
	}
	
	function notPinnedCommunity(c_no){
		location.href="/update.pinned.commu?lr_where_no=" + c_no;
	}
</script>
</html>