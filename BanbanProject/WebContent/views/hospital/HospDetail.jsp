<%-- <%@page import="kr.or.ddit.vo.AtchFileVO"%> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.banban.vo.HospitalVO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
	HospitalVO hv = (HospitalVO) request.getAttribute("hv");
%>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>병원 상세정보</title>
<style>
html {
	height: 100%;
}

body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding-top: 50px;
	padding-bottom: 40px;
	background-repeat: no-repeat;
}

.card {
	margin: 0 auto;
	float: none;
	margin-bottom: 10px;
	border: none;
}

b {
	background-color: rgb(250, 164, 3);
	border: none;
	width: 25rem;
	margin: auto;
	font-size: 28px;
}

.form-control {
	display: inline;
	height: 40px;
	width: 400px;
	padding: 5px;
	font-size: 16px;
	margin-left: 100px;
}

#member_id {
	padding: 10px;
	font-size: 16px;
	width: 250px;
	margin-left: 100px;
}

#email {
	padding: 10px;
	font-size: 16px;
	width: 300px;
	margin-left: 100px;
}

.check {
	font-size: 16px;
	margin-left: 100px;
}

.card-title {
	width: 100%;
	height: 100%;
	object-fit: cover;
	text-align: center;
	height: 100%;
	object-fit: cover;
}

.text {
	font-size: 20px;
	margin-left: 100px;
}

.btn-primary {
	background-color: rgb(250, 164, 3);
}

.label {
	display: inline-block;
	width: auto;
	font-weight: bold;
}
</style>

</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%">

	<div class="card" style="width: 40rem;">
		<div class="card-title" style="margin-top: 30px;">

			<h6 class="card-title">
				<a href="/Index.jsp"> <img src="../img/태원요청.png" />
				</a>
			</h6>
		</div>
		<div class="card-body">

			<form action="join" class="form-signin" method="POST"  style="position: relative; margin: auto;">
				<hr>
				<p class="text">
					<span class="label"> 병원 아이디 : </span>
					<span style="margin-left: 80px;"><%=hv.getHospCd()%></span></p>
				<hr>
				<p class="text">
					<span class="label"> 병원 이름 : </span>
					<span style="margin-left: 100px;"><%=hv.getHospNm()%></span></p>
				<hr>
				<p class="text">
					<span class="label"> 사업자 등록번호 : </span>
					<span style="margin-left: 40px;"><%=hv.getHospEntNo()%></span></p>
				<hr>
				<p class="text">
					<span class="label"> 병원 주소 : </span>
					<span style="margin-left: 100px;"><%=hv.getHospAddr()%></span></p>
				<hr>
				<p class="text">
					<span class="label"> 병원 연락처 : </span>
					<span style="margin-left: 80px;"><%=hv.getHospTel()%></span></p>
				<hr>
				<p class="text">
					<span class="label"> 병원 협약 시작 일시 : </span>
					<span style="margin-left: 10px;"><%=hv.getHospPsStart()%></span></p>
				<hr>
				<p class="text">
					<span class="label"> 병원 협약 마감 일시 : </span>
					<span style="margin-left: 10px;"><%=hv.getHospPsEnd()%></span></p>
				<hr>
		</div>
<!-- 		<div class="btn"> -->
<!-- 			<input type="button" value="메인" onClick="location.href='Index.jsp'"> -->
<!-- 		</div> -->
	</div>
</body>
</script>
</html>