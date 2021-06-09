<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>쇼핑몰</title>
	<link rel="stylesheet" href="/resources/css/home.css"/>	
</head>
<body>
	<div id="divTop">
		<img src="/resources/image/back.jpg" id="bannerImg" onClick="location.href='/'">
		<div id="divMenu">
			<jsp:include page="menu.jsp"/>
		</div>
	</div>
	<div id="divCenter">
		<div id="Content">
			<jsp:include page="${pageName}"/>
		</div>
	</div>
	<div id="divBottom">
		<h4>인천일보 아카데미 김수지</h4>
	</div>
</body>
</html>