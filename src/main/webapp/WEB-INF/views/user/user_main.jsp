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
</head>
<body>
	<div
		class="flex flex-col justify-start items-start h-screen bg-[#F5F6FA]">
		<div id="header" class="block w-full h-1/12">
			<div class="flex w-full justify-start items-center mt-24 mb-10">
				<div class="menu-icon-div w-1/3">
					<img class="w-1/4 ml-8" alt="" src="imgs/menu_icon.png">
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
</body>
<script type="text/javascript" src="js/user/bookrecord.js"></script>
</html>