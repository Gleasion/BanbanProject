<%-- <%@page import="kr.or.ddit.vo.AtchFileVO"%> --%>
<%@page import="kr.or.ddit.banban.vo.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
%>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<link href="https://cdn.jsdelivr.net/npm/daisyui@3.2.1/dist/full.css"
	rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>(관리자)회원정보 상세</title>
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

.label {
	display: inline-block;
	width: 110px;
	font-weight: bold;
}
</style>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%">

	<div class="card" style="width: 40rem;">
		<div class="card-title" style="margin-top: 30px;">

			<h6 class="card-title">
			<a href="../Index.jsp">
				<img src="../img/태원요청.png" /></a>
			</h6>
		</div>
		<div class="card-body">

			<form action="join" class="form-signin" method="POST">
				<hr>
				<p class="text">
					<span class="label"> 아이디 : </span>
					<%=mv.getMemId()%></p>
				<hr>
				<p class="text">
					<span class="label"> 이름 : </span>
					<%=mv.getMemNm()%></p>

				<hr>
				<p class="text">
					<span class="label"> 전화번호 : </span>
					<%=mv.getMemTel()%></p>
				<hr>
				<p class="text">
					<span class="label"> 닉네임 : </span>
					<%=mv.getMemNic()%></p>
				<hr>
				<%
					String strBir = mv.getMemBir();
				%>
				<p class="text">
					<span class="label"> 생년월일 : </span>
					<%
						SimpleDateFormat outputFormat = new SimpleDateFormat("yy-MM-dd");
					String formattedDate = outputFormat.format(outputFormat.parse(mv.getMemBir()));
					%>
					<%=formattedDate%>
				<hr>
				<p class="text">
					<span class="label"> 이메일 : </span>
					<%=mv.getMemEmail()%></p>
				<hr>
				<p class="text">
					<span class="label"> 주소 : </span>
					<%=mv.getMemAddr()%></p>
				<hr>
			</form>
				<dialog id="my_modal_1" class="modal">
				<form method="dialog" class="modal-box">
					<h3 class="font-bold text-lg">회원탈퇴</h3>
					<p class="py-4">진짜 탈퇴하시겠습니까?</p>
					<div class="modal-action">
						<!-- if there is a button in form, it will close the modal -->
						<button class="btn btn-md">아니오</button>
						<button class="btn btn-md inline-block cursor-pointer rounded-md bg-blue-400 px-4 py-3 text-center text-sm font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-blue-500">
							<a href="../admin/ADMemberDelete">　예　</a>
						</button>
					</div>
				</form>
				</dialog>
			</div>
		</div>
	</div>
</body>
</html>