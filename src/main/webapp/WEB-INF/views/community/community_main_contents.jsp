<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
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

					<form action="/go.commu.post">
						<div id="pinned-commu"></div>
					</form>
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
							<button id="not-pinned-btn" class="commu_board_btn" name="c_no"
								value="${c.c_no }">
								<img class="not-pinned"
									onclick="pinnedCommunity(event, '${c.c_no}')"
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
	var addedCommunities = {};
	$(function() {
		loadPinnedCommu();
	})

	function loadPinnedCommu() {
		$.ajax({
			url : "get.pinned.commu",
			dataType : "JSON",
			success : function(data) {
				console.log(data);

				$.each(data.pinnedCommu, function(index, item) {

					console.log(item.c_name);

					var pinnedCommuContainer = $("#pinned-commu");
					if (!addedCommunities[item.c_no]) { // 이미 추가한 커뮤니티인지 확인
						var button = $("<button>").addClass("pinned-btn").attr(
								"name", "c_no");
						$(button).val(item.c_no);
						var img = $("<img>").addClass("pinned").attr("src",
								"/img/커뮤니티_즐겨찾기함_icon.png").click(function() {
							notPinnedCommunity(this, item.c_no); // item.c_no는 클로저로 캡쳐될 것입니다.
						});
						var text = $("<span>").css("white-space", "pre").text(
								" " + item.c_name);

						button.append(img, text);
						pinnedCommuContainer.append(button);

						addedCommunities[item.c_no] = true; // 커뮤니티 추가 기록
					}

				});

			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}

	function pinnedCommunity(event, c_no) {
		event.preventDefault();
		$.ajax({
			url : "do.pinned.commu",
			data : {
				"lr_where_no" : c_no
			},
			dataType : "JSON",
			success : function(data) {
				console.log(data);

				$.each(data.pinnedCommu, function(index, item) {
					console.log(item.c_name);

					var pinnedCommuContainer = $("#pinned-commu");

					if (!addedCommunities[item.c_no]) { // 이미 추가한 커뮤니티인지 확인
						// 						var button = $("<button>").addClass("pinned-btn").attr(
						// 								"name", "c_no");
						// 						var img = $("<img>").addClass("pinned").attr("src",
						// 								"/img/커뮤니티_즐겨찾기함_icon.png");
						// 						var text = $("<span>").text(item.c_name);

						// 						button.append(img, text);
						// 						pinnedCommuContainer.append(button);

						// 						addedCommunities[item.c_no] = true; // 커뮤니티 추가 기록
					}

				});

				loadPinnedCommu();

			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})

	}

	function notPinnedCommunity(btn, lr_where_no) {
		event.preventDefault();
		$.ajax({
			type : "GET",
			url : "/update.pinned.commu?lr_where_no=" + lr_where_no,
			dataType : "JSON",
			success : function(data) {
				console.log("Ajax request success:", data);
				const valueToDelete = $(btn).parent().attr("value");
				console.log(valueToDelete);
				console.log(addedCommunities);
				delete addedCommunities[valueToDelete];
				
				console.log(addedCommunities);
				//delete addedCommunities.
				$(btn).parent().remove();
			},
			error : function(request, status, error) {
				console.log("code:" + request.status + "\n" + "message:"
						+ request.responseText + "\n" + "error:" + error);
			}
		})
	}
</script>
</html>