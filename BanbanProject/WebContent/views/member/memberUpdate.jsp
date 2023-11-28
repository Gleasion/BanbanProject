<%-- <%@page import="kr.or.ddit.vo.AtchFileVO"%> --%>
<%@page import="java.sql.Date"%>
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
%>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>회원정보 수정</title>
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
}

.form-control {
	display: inline;
	height: 40px;
	width: 250px;
	padding: 5px;
	font-size: 16px;
	margin-left: 40px;
}

.fixed-MemId {
	margin-left: 100px;
}

#email {
	padding: 10px;
	font-size: 16px;
	width: 250px;
	margin-left: 94px;
}

.check {
	font-size: 16px;
	margin-left: 100px;
}

.card-title {
	text-align: center;
}

#pw2 {
	margin-left: 12px;
}

#nmspace {
	margin-left: 120px;
}

#nicspace {
	margin-left: 95px;
}

#phone {
	margin-left: 80px;
}

#birspace {
	margin-left: 80px;
}

#sample4_postcode {
	margin-left: 114px;
	width: 200px;
}

#postbt {
	width: 100px;
	height: 30px;
	font-size: 12px;
}

.text {
	margin-left: 100px;
	font-size: 20px;
}

#sample4_jibunAddress {
	margin-left: 258px;
}
</style>
</head>
<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0"
	width="100%" height="100%">

	<div class="card" style="width: 40rem;">
		<div class="card-title" style="margin-top: 30px;">

			<a href="/Index.jsp">
				<h2 class="card-title" style="color: #e4932b;">
					<img src="/img/임지.png" width="300px"/>
				</h2>
			</a>
		</div>
		<div class="card-body">

			<form action="<%=request.getContextPath()%>/MemberUpdate"
				method="post" enctype="multipart/form-data">
				<hr>
				<p class="text">
					아이디 <span class="fixed-MemId"><%=mv.getMemId()%></span>
				</p>
				<hr>
				<p class="text">
					새 비밀번호 &nbsp;&nbsp;<input type="password" name="memPw" id="pw"
						class="form-control" value="<%=mv.getMemPw()%>">
					<%-- 						<input hidden="" style="display: none;" name=""> <%if("#memPw" == null){ --%>
					<%-- 						%><%=mv.getMemPw()%> --%>
					<%-- 					<%	}	%> --%>

				</p>
				<p id="pw2ch" class="check"></p>
				<p class="text">
					새 비밀번호 확인<input type="password" id="pw2" class="form-control"
						value="<%=mv.getMemPw()%>">
				</p>
				<p id="pwch" class="check"></p>
				<hr>
				<p class="text">
					<span class="label"> 이름 </span> <span id="nmspace"><%=mv.getMemNm()%></span>
				</p>
				<hr>
				<p class="text">
					닉네임 <input type="text" name="memNic" id="nicspace"
						class="form-control" placeholder="<%=mv.getMemNic()%>"
						value="<%=mv.getMemNic()%>">
				</p>
				<!-- 				<input type="hidden" name="memNic2" style="display: none;">  -->
				<hr>
				<p class="text">
					전화번호<input type="text" name="memTel" id="phone"
						class="form-control" placeholder="<%=mv.getMemTel()%>"
						value="<%=mv.getMemTel()%>">
				</p>
				<hr>
				<%
					String strBir = mv.getMemBir();
				%>
				<p class="text">
					<span class="label"> 생년월일 </span> <span id="birspace">
 					<%=mv.getMemBir()%>
 					</span>
				</p>
				<hr>
				<p class="text">
					이메일 <input type="email" name="memEmail" id="email"
						class="form-control" placeholder="<%=mv.getMemEmail()%>"
						value="<%=mv.getMemEmail()%>">
				</p>

				<hr>
				<p class="text">
					주소 <input type="text" class="text" id="sample4_postcode"
						placeholder="우편번호" readonly="readonly"> <input
						type="button" id="postbt" onclick="execPostCode()" value="우편번호 찾기">
				</p>
				<input type="text" class="form-control" id="sample4_jibunAddress"
					name="memAddr" value="<%=mv.getMemAddr()%>"
					placeholder="<%=mv.getMemAddr()%>" readonly="readonly"> <span
					id="guide" style="color: #999; display: block"></span>
				<hr>
				<input id="btn_memupdate" class="btn btn-lg btn-primary"
					type="submit" value="수정완료" style="width: 200px; margin-left: 200px;">
			</form>
		</div>
	</div>
	
	<script>
		var pwc = false;
		var pwc2 = false;
		var phonec = false;
		var emailc = false;

		//모든 공백 체크 정규식
		var empJ = /\s/g;
		//아이디 정규식
		var idJ = /^[a-z0-9]{5,20}$/;
		// 비밀번호 정규식
		var pwJ = /^[a-z0-9]{6,20}$/;
		// 휴대폰 번호 정규식
		var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

		if ('#pw' != null) {
			$('#pw2ch').text('6~20자의 영문 소문자, 숫자만 사용가능합니다')
			$('#pw2ch').css('color', 'red')
			$("#pw").focusout(function() {
				if (!pwJ.test($(this).val())) {
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
		}
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
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
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
										+ expJibunAddr + ') '
										+ ' 주소를 다시 선택해주세요';
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
			var name = $("#name").val();
			var email = $("#email").val();
			var addr = $("#sample4_jibunAddress").val();
			var birth = $("#birth_date").val();

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
	
</body>
</html>