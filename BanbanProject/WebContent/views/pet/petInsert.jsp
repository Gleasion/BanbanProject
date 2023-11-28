<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
<title>반려 동물 등록</title>
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

#btn-Yes, #btn_login {
	background-color: rgb(250, 164, 3);
	border: none;
	width: 25rem;
	margin: auto;
	font: bold;
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
	border-top: 2px solid #ddd; /* 각 요소 사이에 선 추가 */
	margin-top: 20px; /* 위 여백 추가 */
}

.form-group:not(:first-child) {
	position: relative;
}

.form-group:not(:first-child)::before {
	content: "";
	position: absolute;
	top: -20px; /* 선의 위치 조정 */
	left: 0;
	width: 100%;
	height: 2px;
	background-color: rgba(52, 152, 219, 0.3); /* 선의 색상 설정 */
}
</style>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%">

	<div class="card" style="width: 40rem;">
		<div class="logo-container">
			<div class="logo">
				<a href="/Index.jsp"> <img src="./img/임지.png" alt="로고 이미지" />
				</a>
			</div>
		</div>
		<hr class="separator">

		<div class="card-body">

			<form action="/InsertPet" class="form-signin" method="POST"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="petNm">이름</label> <input type="text" name="petNm"
						id="petNm" class="form-control">
				</div>
				<br>
				<div class="form-group">
					<label for="petRegno">반려동물 등록번호</label> <input type="text"
						name="petRegno" id="petRegno" class="form-control" placeholder="반려동물 번호15자리 입력"> <span
						id="petRegnoError" style="color: red;"></span>
				</div>
				<br>
				<div class="form-group">
					<label for="petBir">반려동물 생일</label> <input type="date"
						name="petBir" id="petBir" class="form-control" placeholder="">
					<p id="birth_check" class="check"></p>
				</div>
				<br>
				<div class="form-group">
					<label for="petChip">반려동물 칩 여부</label>
					<div>
						<input type="radio" name="petChip" value="I" id="chipIn">
						<label for="chipIn">내장</label> <input type="radio" name="petChip"
							value="O" id="chipOut"> <label for="chipOut">외장</label> <input
							type="radio" name="petChip" value="N" id="chipNone"> <label
							for="chipNone">없음</label>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="petKind">반려동물 종류</label> <select name="petKind"
						id="petKind" class="form-control">
						<option value="" selected disabled>선택하세요</option>
						<option value="강아지">강아지</option>
						<option value="고양이">고양이</option>
						<option value="파충류">파충류</option>
						<option value="양서류">양서류</option>
						<option value="조류">조류</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<br>
				<div class="form-group">
					<label for="petGender">반려동물 성별</label>
					<div>
						<input type="radio" name="petGender" value="M" id="maleGender">
						<label for="maleGender">남자</label> <input type="radio"
							name="petGender" value="F" id="femaleGender"> <label
							for="femaleGender">여자</label> <input type="radio"
							name="petGender" value="N" id="unknownGender"> <label
							for="unknownGender">알 수 없음</label>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="petNeu">반려동물 중성화 여부</label>
					<div>
						<input type="radio" name="petNeu" value="Y" id="neuteredYes">
						<label for="neuteredYes">중성화됨</label> <input type="radio"
							name="petNeu" value="N" id="neuteredNo"> <label
							for="neuteredNo">중성화되지 않음</label>
					</div>
				</div>
				<br>
				<div class="form-group">
					<label for="petEtc">반려동물 특이사항</label> <input type="text"
						name="petEtc" id="petEtc" class="form-control">
				</div>
				<br>
				<div class="form-group">
					<label for="petAtchFile">반려동물 사진</label> <input type="file"
						name="petAtchFile" id="petAtchFile" class="form-control">
				</div>
				<br>
				<button type="button" id="btn-Yes"
					class="btn btn-lg btn-primary btn-block" onclick="regist()">반려동물
					등록</button>
				<br>
			</form>

			<button id="btn_login" class="btn btn-lg btn-primary btn-block"
				type="button" onclick="location.href = '/PetMypage' ">
				<b>뒤로 가기</b>
			</button>

		</div>
		<hr class="separator">
	</div>

</body>
<script>
	var namec = false;

	$("#petNm").focusout(function() {
		if ($('#petNm').val() == "") {

			$('#petNm').text('*필수 정보입니다.');
			$('#petNm').css('color', 'red');

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

		var name = $("#name").val();

		if (namec == false || name === "") {
			alert('이름을 입력해주세요')
		} else {
			$('form').submit();
		}
	};
</script>
</html>