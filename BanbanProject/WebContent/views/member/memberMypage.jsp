<%-- <%@page import="kr.or.ddit.vo.AtchFileVO"%> --%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.banban.service.MemberServiceImpl"%>
<%@page import="kr.or.ddit.banban.service.IMemberService"%>
<%@page import="kr.or.ddit.banban.dao.IMemberDao"%>
<%@page import="kr.or.ddit.banban.dao.MemberDaoImpl"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.banban.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%
	MemberVO mv = (MemberVO) request.getAttribute("mv");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");

session.removeAttribute("msg");
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
<title>회원정보 상세</title>
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
				<a href="/Index.jsp"> <img src="../img/임지.png" style="width: 300px; margin-left: 170px;"/>
				</a>
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
				<p class="text">
					<span class="label"> 생년월일 : </span>
					<%=mv.getMemBir()%>
				</p>
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
			<div style="float: left; margin-top: 10px;">
				<button style="width: 49%;" id="btn_memupdate"
					class="inline-block cursor-pointer rounded-md bg-blue-400 px-4 py-3 text-center text-sm font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-blue-500"
					type="button" onclick="location.href = '/MemberUpdate' ">
					회원정보 수정 <br>
				</button>

				<button style="width: 49%; margin-left: 5px;"
					class="inline-block cursor-pointer rounded-md bg-blue-400 px-4 py-3 text-center text-sm font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-blue-500"
					onclick="my_modal_1.showModal()">탈퇴하기</button>
				<dialog id="my_modal_1" class="modal">
				<form method="dialog" class="modal-box">
					<h3 class="font-bold text-lg">회원탈퇴</h3>
					<p class="py-4">진짜 탈퇴하시겠습니까?</p>
					<div class="modal-action">
						<!-- if there is a button in form, it will close the modal -->
						<button class="btn btn-md">아니오</button>
						<button
							class="btn btn-md inline-block cursor-pointer rounded-md bg-blue-400 px-4 py-3 text-center text-sm font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-blue-500">
							<a href="./Delete"> 예 </a>
						</button>
					</div>
				</form>
				</dialog>
			</div>
		</div>
	</div>
</body>
<script>
	//   var emoverChk = false;
	// 	$("#emoverlay").click(function(){
	// 		var email = $("#email").val();
	// 			$.ajax({
	// 				type:'post'
	// 				,url:'emoverlay'
	// 				,data:{'email' : email }
	// 				,dataType:'JSON'
	// 				,success:function(obj){
	// 					console.log(obj);
	// 					if(obj.use2 != 1){
	// 						alert('사용할 수 있는 이메일 입니다.');
	// 						emoverChk= true;
	// 					}else{
	// 						alert('이미 사용중인 이메일 입니다.');

	// 					}
	// 				}
	// 				,error:function(e){
	// 					console.log(e);
	// 				}
	// 			});				
	// 		});	

	var overChk = false;
	$("#overlay").click(function() {
		let memId = $('#member_id').val();
		$.ajax({
			type : 'post',
			url : '/IdCheck',
			data : {
				memId : memId
			},
			dataType : 'JSON',
			success : function(obj) {
				console.log(obj);
				console.log(obj.cnt);

				if (obj.cnt != 1) {
					console.log(obj);
					alert('사용할 수 있는 아이디 입니다.');
					overChk = true;
				} else {
					alert('이미 사용중인 아이디 입니다.');
					overChk = false;
				}
			},
			error : function(e) {
				console.log(e);
			}
		});
	});

	var idc = false;
	var pwc = false;
	var pwc2 = false;
	var phonec = false;
	var namec = false;
	var emailc = false;
	var birthJ = false;

	//모든 공백 체크 정규식
	var empJ = /\s/g;
	//아이디 정규식
	var idJ = /^[a-z0-9]{5,20}$/;
	// 비밀번호 정규식
	var pwJ = /^[a-z0-9]{6,20}$/;
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

	$('#pw2ch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
	$('#pw2ch').css('color', 'red')
	$("#pw").focusout(function() {
		if ($('#pw').val() == "") {

			$('#pw2ch').text('*필수 정보입니다.');
			$('#pw2ch').css('color', 'red');
			return false;

		} else if (!pwJ.test($(this).val())) {
			$('#pw2ch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
			$('#pw2ch').css('color', 'red')
			return false;
		} else {
			pwc2 = true;
			$('#pw2ch').hide();
			return true;
		}
	});

	$("#pw2").keyup(function() {

		if ($(this).val() != $("#pw").val()) {
			$("#pwch").html("비밀번호가 다릅니다");
			$("#pwch").css("color", 'red');
			pwc = false;

		} else {
			$("#pwch").html("비밀번호가 일치합니다");
			$("#pwch").css("color", 'blue');
			pwc = true;
		}
	});

	$("#pw").keyup(function() {

		if ($(this).val() != $("#pw2").val()) {
			$("#pwch").html("비밀번호가 다릅니다");
			$("#pwch").css("color", 'red');
			pwc = false;

		} else {
			$("#pwch").html("비밀번호가 일치합니다");
			$("#pwch").css("color", 'blue');
			pwc = true;
		}
	});

	$("#email").focusout(function() {
		if ($('#email').val() == "") {

			$('#emch').text('*필수 정보입니다.');
			$('#emch').css('color', 'red');
			$(this).focus();
			return false;
		} else {
			emailc = true;
			return true;
		}
	});

	$("#phone").focusout(function() {
		if ($('#phone').val() == "") {
			$('#phonech').text('*필수 정보입니다.');
			$('#phonech').css('color', 'red');

		} else {
			phonec = true;
		}
	});

	function execPostCode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var roadAddr = data.roadAddress; // 도로명 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							data.bname;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

						var guideTextBox = document.getElementById("guide");
						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							guideTextBox.innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
							guideTextBox.style.display = 'block';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							guideTextBox.innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ') ' + ' 주소를 다시 선택해주세요';
							guideTextBox.style.display = 'block';
						} else {
							guideTextBox.innerHTML = '';
							guideTextBox.style.display = 'block';
						}
					}

				}).open();

	}
	function regist() {

		var pw = $("#pw").val();
		var pw2 = $("#pw2").val();
		var phone = $("#phone").val();
		var email = $("#email").val();
		var addr = $("#sample4_jibunAddress").val();

		if (pwc == false || pw2 === "" || pwc2 == false) {
			alert('비밀번호를 확인 해 주세요')
		} else if (addr == "") {
			alert('주소를 선택해주세요')
		} else if (emailc == false || email === "") {
			alert('이메일을 입력해주세요')
		} else if (emoverChk == false) {
			alert('이메일을 중복 검사를 해주세요')
		} else if (phonec == false || phone === "") {
			alert('전화번호를 입력해주세요.')
		} else {
			$('form').submit();
		}
	};
</script>
<%
		if (msg == null || msg.equals("")) {
	%>
	<%
		} else {
	%>

	<script>
		alert("<%=msg%>");
	</script>
	<%
		}
	%>
</html>