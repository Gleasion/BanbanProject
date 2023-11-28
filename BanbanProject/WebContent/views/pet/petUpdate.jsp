<%@page import="kr.or.ddit.banban.vo.PetVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.banban.vo.MemberVO"%>
<%-- <%@page import="kr.or.ddit.comm.vo.AtchFileVO"%> --%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<%
	PetVO pv = (PetVO) request.getAttribute("pv");
%>
<head>
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
<title>반려 동물 수정</title>
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

#btn_memupdate, #btn_login {
	background-color: rgb(250, 164, 3);
	border: none;
	width: 30rem;
	margin: 20px;
}

.form-control {
	display: inline;
	height: 40px;
	width: 400px;
	padding: 5px;
	font-size: 16px;
}

.form-group {
	display: grid;
	grid-template-columns: 200px auto;
	align-items: center;
	margin-bottom: 20px;
}

.form-group label {
	text-align: right;
	padding-right: 10px;
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
	text-align: center;
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
	margin-left: 100px;
}

.separator {
	width: 100%;
	height: 3px;
	background-color: rgba(52, 152, 219, 0.5);
	margin-bottom: 20px;
}

.logo-container {
	display: flex;
	justify-content: center;
	align-items: center;
	margin-bottom: 20px;
}

.logo {
	width: 150px;
}

.logo img {
	max-width: 100%;
	height: auto;
}

.form-group+.form-group {
	/* 	border-top: 2px solid #ddd; /* 각 요소 사이에 선 추가 */ */
	/* 	margin-top: 20px; /* 위 여백 추가 */ */
	
}

.form-group:not(:first-child) {
	position: relative;
}

.form-group:not(:first-child)::before {
	content: "";
	position: absolute;
	top: -0px; /* 선의 위치 조정 */
	left: 0;
	width: 100%;
	height: 2px;
	/* 	background-color: rgba(52, 152, 219, 0.3); /* 선의 색상 설정 */
	*/
}

.btn-primary:hover {
	background-color: rgb(250, 164, 3);
	/* 수정완료 버튼 스타일 */
}

#btn_memupdate {
	width: 100%;
	margin-top: 20px;
	margin-bottom: 10px;
	padding: 10px;
	font-size: 16px;
	background-color: rgb(65, 105, 225);
	border: none;
	color: #fff;
}

/* 목록 버튼 스타일 */
#btn_login {
	width: 100%;
	margin-bottom: 20px;
	padding: 10px;
	font-size: 16px;
	background-color: rgb(65, 105, 225);
	border: none;
	color: #fff;
}

/* 버튼 마우스 호버 스타일 */
#btn_memupdate:hover, #btn_login:hover {
	background-color: rgb(250, 164, 3);
	cursor: pointer;
}

#file {
	margin-left: 100px;
	margin-top: 30px;
}
</style>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%">

	<div class="card" style="width: 40rem;">
		<div class="logo-container">
			<div class="logo">
				<a href="/Index.jsp"> <img src="./img/임지.png" alt="로고 이미지" /></a>
			</div>
		</div>
		<hr class="separator">

		<div class="card-body">
			<form action="/PetUpdate" class="form-signin" method="POST"
				enctype="multipart/form-data">
				<input type="hidden" name="petNo" value="<%=pv.getPetNo()%>">

				<div class="form-group">
					<label for="petNm">반려동물 이름</label> <input type="text" name="petNm"
						id="petNm" class="form-control" placeholder="<%=pv.getPetNm()%>"
						value="<%=pv.getPetNm()%>">
				</div>
				<hr>
				<div class="form-group">
					<label for="petRegno">반려동물 등록번호</label> <input type="text"
						name="petRegno" id="petRegno" class="form-control"
						value="<%=pv.getPetRegno()%>">
					<p id="petRegnoError" class="check"></p>
				</div>
				<hr>
				<div class="form-group">
					<label for="petBir">반려동물 생일</label> <input type="date"
						name="petBir" id="petBir" class="form-control"
						placeholder="2000-10-10 형식입니다." value="<%=pv.getPetBir()%>">
					<p id="birth_check" class="check"></p>
				</div>
				<hr>

				<%-- <input type="date" name="petBir" id="petBir" class="form-control" placeholder="2000-10-10 형식입니다." value="<%=pv.getPetBir()%>"> --%>

				<div class="form-group">
					<label for="petChip">반려동물 칩 여부</label>
					<div>
						<input type="radio" name="petChip" value="I" id="chipIn"
							<%if (pv.getPetChip() != null && pv.getPetChip().equals("I")) {%>
							checked <%}%>> <label for="chipIn">내장</label> <input
							type="radio" name="petChip" value="O" id="chipOut"
							<%if (pv.getPetChip() != null && pv.getPetChip().equals("O")) {%>
							checked <%}%>> <label for="chipOut">외장</label> <input
							type="radio" name="petChip" value="N" id="chipNone"
							<%if (pv.getPetChip() != null && pv.getPetChip().equals("N")) {%>
							checked <%}%>> <label for="chipNone">없음</label>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="petKind">반려동물 종류</label> <select name="petKind"
						id="petKind" class="form-control">
						<option value="" <%if (pv.getPetKind() == null) {%> selected <%}%>
							disabled>선택하세요</option>
						<option value="강아지"
							<%if (pv.getPetKind() != null && pv.getPetKind().equals("강아지")) {%>
							selected <%}%>>강아지</option>
						<option value="고양이"
							<%if (pv.getPetKind() != null && pv.getPetKind().equals("고양이")) {%>
							selected <%}%>>고양이</option>
						<option value="파충류"
							<%if (pv.getPetKind() != null && pv.getPetKind().equals("파충류")) {%>
							selected <%}%>>파충류</option>
						<option value="양서류"
							<%if (pv.getPetKind() != null && pv.getPetKind().equals("양서류")) {%>
							selected <%}%>>양서류</option>
						<option value="조류"
							<%if (pv.getPetKind() != null && pv.getPetKind().equals("조류")) {%>
							selected <%}%>>조류</option>
						<option value="기타"
							<%if (pv.getPetKind() != null && pv.getPetKind().equals("기타")) {%>
							selected <%}%>>기타</option>
					</select>
				</div>
				<hr>
				<div class="form-group">
					<label for="petGender">반려동물 성별</label>
					<div>
						<input type="radio" name="petGender" value="M" id="maleGender"
							<%if (pv.getPetGender() != null && pv.getPetGender().equals("M")) {%>
							checked <%}%>> <label for="maleGender">수컷</label> <input
							type="radio" name="petGender" value="F" id="femaleGender"
							<%if (pv.getPetGender() != null && pv.getPetGender().equals("F")) {%>
							checked <%}%>> <label for="femaleGender">암컷</label> <input
							type="radio" name="petGender" value="N" id="unknownGender"
							<%if (pv.getPetGender() != null && pv.getPetGender().equals("N")) {%>
							checked <%}%>> <label for="unknownGender">알 수 없음</label>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="petNeu">반려동물 중성화 여부</label>
					<div>
						<input type="radio" name="petNeu" value="Y" id="neuteredYes"
							<%if (pv.getPetNeu() != null && pv.getPetNeu().equals("Y")) {%>
							checked <%}%>> <label for="neuteredYes">중성화됨</label> <input
							type="radio" name="petNeu" value="N" id="neuteredNo"
							<%if (pv.getPetNeu() != null && pv.getPetNeu().equals("N")) {%>
							checked <%}%>> <label for="neuteredNo">중성화되지 않음</label>
					</div>
				</div>
				<hr>
				<div class="form-group">
					<label for="petEtc">반려동물 특이사항</label> <input type="text"
						name="petEtc" id="petEtc" class="form-control"
						value="<%=pv.getPetEtc()%>">
				</div>
				<hr>
				<div class="form-group">
					<label for="petAtchFile">등록된 사진</label> <img
						src="/img/petImg/<%=pv.getPetAtchFileName()%>"
						style="width: 100px;" />
					<p id="file">
						<input type="file" name="petAtchFile" id="petAtchFile"
							class="form-control" />
					</p>
				</div>
				<hr>

				<!-- form안의 button이 type=button이 아닌 경우는  submit기능을 갖음 그래서 /update서블릿으로 넘어가는 거임 -->
				<button type="button" id="btn_memupdate"
					class="btn btn-lg btn-primary btn-block" onclick="regist()">반려동물
					수정완료</button>

				<button id="btn_login" class="btn btn-lg btn-primary btn-block"
					type="button" onclick="location.href = '/PetMypage'">
					<b>반려동물 목록</b>
				</button>
			</form>
		</div>
	</div>
</body>
<script>
	var namec = false;

	$("#petNm").focusout(function() {
		if ($('#petNm').val() == "") {

			$('#namech').text('*필수 정보입니다.');
			$('#namech').css('color', 'red');

		} else {
			namec = true;
		}
	});
	var petRegnoInput = document.getElementById("petRegno");
	var petRegnoError = document.getElementById("petRegnoError");

	petRegnoInput.addEventListener("blur", function() {
		var petRegnoPattern = /^[0-9]{15}$/;
		var petRegnoValue = petRegnoInput.value;

		if (petRegnoValue === "") {
			petRegnoError.textContent = "";
		} else if (!petRegnoPattern.test(petRegnoValue)) {
			petRegnoError.textContent = "잘못된 등록번호 형식입니다.";
			petRegnoInput.value = ""; // 입력 값을 초기화
			petRegnoInput.focus(); // 다시 포커스 설정
			alert("잘못된 등록번호 형식입니다.");
		} else {
			petRegnoError.textContent = "";
		}
	});
	function regist() {

		var name = $("#petNm").val();

		if (name == false || name == "") {
			alert('이름을 입력해주세요');
		} else {
			$('form').submit();
		}
	};
</script>
</html>