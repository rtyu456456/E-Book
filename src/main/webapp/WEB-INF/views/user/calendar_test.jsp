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
<link rel="stylesheet" href="css/user/calendar_test.css">
</head>
<body>
	<div class="sec_cal">
		<div class="cal_nav">
			<a href="javascript:;" class="nav-btn go-prev">prev</a>
			<div class="year-month"></div>
			<a href="javascript:;" class="nav-btn go-next">next</a>
		</div>
		<div class="cal_wrap">
			<div class="days">
				<div class="day">MON</div>
				<div class="day">TUE</div>
				<div class="day">WED</div>
				<div class="day">THU</div>
				<div class="day">FRI</div>
				<div class="day">SAT</div>
				<div class="day">SUN</div>
			</div>
			<div class="dates"></div>
		</div>
	</div>
</body>
<script type="text/javascript" src="js/user/calendar_test.js"></script>
</html>