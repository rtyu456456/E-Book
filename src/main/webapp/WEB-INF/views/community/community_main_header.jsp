<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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


</body>
<script type="text/javascript">
let countAlarm = document.getElementById("count-alarm").value;
let alarmImg = document.getElementById("commu-alarm");

if(countAlarm >= 1){
	alarmImg.style.visibility = "visible";
}else if(countAlarm == 0){
	alarmImg.style.visibility = "hidden";
	
}


</script>
</html>