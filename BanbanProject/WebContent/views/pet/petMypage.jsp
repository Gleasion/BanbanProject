<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.banban.vo.PetVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<%
	List<PetVO> petList = (List<PetVO>) request.getAttribute("petList");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주민등록증</title>
<style>
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css")
	;

* {
	/*    margin: 0; */
	/*    padding: 0; */
	box-sizing: border-box;
}

.flip {
	position: relative;
	perspective: 1100px;
}

.resident-cards {
	width: 500px;
	height: 380px;
	margin-left: 600px;
	margin-top: 50px;
	border-radius: 10px;
	position: relative;
	box-sizing: border-box;
	background-color: rgb(239, 239, 239);
	transition: .6s;
	transform-style: preserve-3d;
}

.resident-cards:first-child {
	margin-top: 500px;
}

.front, .back {
	position: absolute;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
	display: flex;
	justify-content: center;
	align-items: center;
	color: #fff;
	box-shadow: 2px 2px 5px rgba(20, 20, 15, 1.5);
	border-radius: 10px;
}

.back {
	transform: rotateY(180deg);
}

.resident-cards.flipped {
	transform: rotateY(180deg);
}

.title {
	position: absolute;
	height: 40px;
	margin-left: 165px;
	margin-top: 15px;
	color: black;
}

.photo {
	position: absolute;
	width: 150px;
	height: 150px;
	margin-left: 60px;
	margin-top: 70px;
	background-color: #eaeaea;
}

.front-info1-container {
	position: absolute;
	width: 260px;
	margin-left: 230px;
	margin-top: 60px;
	line-height: 0.7;
	color: black;
}

.front-info2-container {
	position: absolute;
	width: 400px;
	margin-top: 225px;
	margin-left: 60px;
	line-height: 0.7;
	color: black;
}

.logo1 {
	width: 280px;
	height: 140px;
	position: absolute;
	margin-top: 250px;
	margin-left: 56px;
}

.logo2 {
	width: 70px;
	height: 70px;
	position: absolute;
	margin-top: 300px;
	margin-left: 290px;
}

.back-info-container {
	position: absolute;
	color: black;
	line-height: 0.7;
}

.back-add-info {
	color: black;
	width: 380px;
	margin-right: 90px;
	margin-bottom: 600px;
	font-style: italic;
	font-size: 15px;
}
.kan{
	background-color: rgba(225,217,217);
	margin-right: 60px;
	width: 400px;
	height: 180px;
}
.add-pet-container {
	position: absolute;
	margin-top: 300px;
}

.separator {
	position: absolute;
	margin-bottom: 0px;
	/* 선과 반반등록증 사이의 간격 설정 */
	width: 850px;
	/* 선의 길이를 변경할 수 있습니다 */
	height: 3px;
	background-color: rgba(52, 152, 219, 0.5);
	margin-top: 50px;
	margin-left: calc(40% - 425px);
	/* 선을 가운데로 위치시키기 위해 왼쪽 여백 설정 */
	left: 10%;
}

.button-container1 {
	position: absolute;
	top: 0px;
	right: -100px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	height: 18%;
}

.button1 {
	position: absolute;
	top: 30px;
	right: 20px;
	transform: translateY(-50%);
	margin-right: 0;
	padding: 0;
	width: 60px;
	height: 60px;
	background-color: rgb(108, 189, 240);
	border: none;
	border-radius: 50%;
	color: #fff;
	font-weight: bold;
	font-size: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.button1:hover {
	background-color: rgb(242, 198, 10);
	cursor: pointer;
}

.button2:hover {
	background-color: rgb(242, 198, 10);
	cursor: pointer;
}

.button-container2 {
	position: absolute;
	top: 10px;
	right: -100px;
	display: flex;
	justify-content: flex-end;
	align-items: center;
	height: 18%;
}

.button2 {
	position: absolute;
	top: 90px;
	right: 20px;
	transform: translateY(-50%);
	margin-right: 0;
	padding: 0;
	width: 60px;
	height: 60px;
	background-color: rgb(108, 189, 240);
	border: none;
	border-radius: 50%;
	color: #fff;
	font-weight: bold;
	font-size: 40px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.add-pet-button-container {
	margin-bottom: 40px;
}

.add-pet-button {
	position: absolute;
	margin-left: 835px;
	margin-top: 170px;
	justify-content: center;
	align-items: center;
	width: 60px;
	height: 60px;
	background-color: rgb(108, 189, 240);
	border: none;
	border-radius: 50%;
	color: #fff;
	font-weight: bold;
	font-size: 40px;
	text-decoration: none;
	transition: background-color 0.3s;
	text-align: center;
}

.add-pet-button:hover {
	background-color: rgb(242, 198, 10);
}
</style>
</head>

<body>
	<a href="/Index.jsp"> <img src="../img/임지.png" alt="logo"
		style="position: absolute; top: 113.5px; left: 50%; transform: translateX(-50%); width: 150px; height: 150px;">
	</a>
	<div data-obj-id="Ce4a9" data-obj-type="element"
		data-text-editable="true" class=""
		style="position: absolute; top: 331px; left: 50%; transform: translateX(-150%); width: 300px; height: 60px; text-align: center;">
		<div data-text-content="true"
			style="font-weight: bold; font-size: 40px;" class="">반려동물 정보</div>
	</div>
	<div data-obj-id="Tra7u" data-obj-type="element"
		data-text-editable="true" class=""
		style="position: absolute; top: 405px; left: 50%; transform: translateX(-80%); width: 800px; height: 29px; text-align: center;">
		<div data-text-content="true"
			style="font-weight: normal; font-size: 19px;" class="">나의 반려동물
			정보를 확인 할 수 있습니다.</div>
	</div>
	<div data-obj-id="6t4Sd" data-obj-type="element"
		data-text-editable="true" class=""
		style="position: absolute; top: 442px; left: 50%; transform: translateX(-50%); width: 850px; height: 10px; text-align: center;">
		<div data-text-content="true"
			style="font-size: 16px; border-width: 0px 0px 3px; border-style: solid; border-color: rgba(52, 152, 219, 0.5); color: rgb(0, 0, 0);"
			class=""></div>
	</div>


	<%
		for (PetVO pv : petList) {
	%>
	<div class="flip">
		<div class="resident-cards" onclick="toggleFlip(this)">
			<div class="front">
				<form style="width: 500px; height: 380px;"
					action="<%=request.getContextPath()%>/PetUpdate" method="get"
					enctype="multipart/form-data">
					<input type="hidden" name="petNo" value="<%=pv.getPetNo()%>"
						style="display: none;">
					<h1 class="title">반반등록증</h1>
					<div class="photo">
						<img src="/img/petImg/<%=pv.getPetAtchFileName()%>" alt="펫 사진"
							id="petImg" width="150px" height="150px">
					</div>
					<div class="front-info1-container">
						<p>
							이름 :
							<%=pv.getPetNm()%></p>
						<p>
							반려인 :
							<%=pv.getMemNm()%></p>
						<p>
							등록번호:
							<%=pv.getPetRegno()%></p>
						<p>
							출생일:
							<%
							if (pv.getPetBir() == null) {
							out.print("0000-00-00");
						} else {
							out.print(pv.getPetBir());
						}
						%>
						</p>
						<p>
							성별:
							<%
							String gender = pv.getPetGender();
						String neu = pv.getPetNeu();
						if (gender.equals("M")) {
						%>남
							<%
							if (neu.equals("Y")) {
						%>
							(중성화 완)
							<%
							} else if (neu.equals("N")) {
						%>
							(중성화 미완)
							<%
							} else {
						%>(알 수 없음)
							<%
							}
						} else if (gender.equals("F")) {
						%>여
							<%
							if (neu.equals("Y")) {
						%>
							(중성화 완)
							<%
							} else if (neu.equals("N")) {
						%>
							(중성화 미완)
							<%
							} else {
						%>(알 수 없음)
							<%
							}
						} else {
						%>(알 수 없음)
							<%
							if (neu.equals("Y")) {
						%>
							(중성화 완)
							<%
							} else if (neu.equals("N")) {
						%>
							(중성화 미완)
							<%
							} else {
						%>(알 수 없음)<%
							}
						}
						%>
						</p>
					</div>
					<div class="front-info2-container">
						<p>
							종류 :
							<%=pv.getPetKind()%>
						</p>
						<p>
							주소 :
							<%=pv.getMemAddr()%>
						</p>
					</div>
					<img class="logo1" src="../img/(배경없음)로고자체만.png" alt="로고 이미지"
						id="logo1" width="300px" /> <input type="hidden" name="petNo"
						value="<%=pv.getPetNo()%>" style="display: none;"> <img
						class="logo2" src="../img/로고그림.png" alt="로고 이미지" id="logo2"
						width="120px" />
			</div>
			<div class="back">
				<div class="kan">
					<div class="back-add-info">
						<h3>반려동물을 기르는 당신의 다짐</h3>
						<ol>
							<li>반려동물을 함부로 버리지 않겠습니다.</li>
							<li>반려동물을 상처입히지 않겠습니다.</li>
							<li>반려동물을 내 가족처럼 대하겠습니다.</li>
							<li>반려동물을 내 소중한 친구처럼 대하겠습니다.</li>
							<li>반려동물을 내 아이처럼 소중히 대하겠습니다.</li>
						</ol>
					</div>
				</div>
				<div class="back-info-container">
					<p>
						칩 여부 :
						<%=pv.getPetChip()%></p>
					<p>
						특징 :
						<%=pv.getPetEtc()%></p>
				</div>
				<!-- 					<img class="logo1" src="../img/(배경없음)로고자체만.png" alt="로고 이미지" -->
				<!-- 						id="logo1" width="300px" style="margin-right: 170px; margin-top: 260px;"/><img -->
				<!-- 						class="logo2" src="../img/로고그림.png" alt="로고 이미지" id="logo2" -->
				<!-- 						width="120px" style="margin-right: 140px; margin-bottom: 20px;" /> -->
			</div>

			</form>


			<div class="button-container1">
				<input type="submit" class="button1" value="+" />
			</div>
			<div class="button-container2">
				<button type="button" class="button2" value="<%=pv.getPetNo()%>"
					onclick="deleteBtnClicked('<%=pv.getPetNo()%>')">─</button>
			</div>
		</div>
	</div>

	<div class="separator"></div>

	<%
		}
	%>

	<div class="add-pet-container">
		<a href="<%=request.getContextPath()%>/InsertPet"
			class="add-pet-button">+</a>
	</div>
	<script>
    function toggleFlip(card) {
      card.classList.toggle("flipped");
    }
  </script>
	<%
		if (msg == null || msg.equals("")) {
	%>
	<%
		} else {
	%>

	<script>
      alert("<%=msg%>
		");
	</script>
	<%
		}
	%>

	<script>
		function deleteBtnClicked(petNo) {
			window.location.href = '/DeletePet?petNo=' + petNo;
		}
	</script>
</body>
</html>