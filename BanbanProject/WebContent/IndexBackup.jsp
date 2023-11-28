<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String loginCd = (String) session.getAttribute("loginCode");
String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>

	<link href="https://cdn.jsdelivr.net/npm/daisyui@3.2.1/dist/full.css" rel="stylesheet" type="text/css" />
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
</head>
<body>
<!-- 메뉴 -->
	<div class="drawer drawer-end z-10" style="position: sticky; top: 0; text-align: left;">
		<input id="my-drawer-4" type="checkbox" class="drawer-toggle" />
		<div class="drawer-content" style="margin-right: 50px">
			<!-- Page content here -->
			<label style="width: 75px; height: 75px;" for="my-drawer-4" class="drawer-button btn btn-circle bg-blue-400 text-center text-sm font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-blue-500 z-10" >Menu</label>
		</div>
		<div class="drawer-side">
			<label for="my-drawer-4" class="drawer-overlay"></label>
			<ul class="menu p-4 w-80 h-full bg-base-200 text-base-content">
				<!-- Sidebar content here -->
<% 
	if(loginCd != null){
		
		if(loginCd.equals("admin")){
%>
			<li>
			<div class="dropdown dropdown-left dropdown-hover">
				<label tabindex="0" class="btn m-1" style="display: none;"></label>관리자메뉴
				<ul tabindex="0"
					class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
					<li><a href="/admin/ADMemberList">회원관리</a></li>
					<li><a href="/getAllHosp.do">병원관리</a></li>
					<li><a href="https://desk.channel.io/#/channels/139623/user_chats/64b4ed7ea3cc022794e4">고객센터관리</a></li>
					<li><a href="/admin/ADdonationList.do">후원자리스트</a></li>
					<li><a href="#">블랙리스트</a></li>
					<li><a href="/admin/blackListCheck.do">신고게시글관리</a></li>
					<li><a href="/admin/blackListMemberCheck.do">신고회원관리</a></li>
				</ul>
			</div>
		</li>
<%
		}else{
%>
				<li>
					<div class="dropdown dropdown-left dropdown-hover">
						<label tabindex="0" class="btn m-1" style="display: none;"></label>마이페이지
						<ul tabindex="0"
							class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
							<li><a href="./Mypage">내정보</a></li>
							<li><a href="./PetMypage">반려동물</a></li>
<!-- 							<li><a href="#">일정관리</a></li> -->
<!-- 							<li><a href="#">병원예약내역</a></li> -->
							<li><a href="/selectMyBoard.do?memId=<%=loginCd%>">작성글내역</a></li>
						</ul>
					</div>
				</li>
<%				
		}
%>
				<li><a href="./Msg.html">쪽지</a></li>
				<li style="border-bottom: 1px solid #ddd;"><a href="./Logout">로그아웃</a></li>
				
<!-- 				<li><a href="./Delete">회원탈퇴</a></li> -->
<%
	}else{
%>
				<li style="border-bottom: 1px solid #ddd;"><a href="./Login">로그인</a></li>
<%
	}
%>
							
				<li><a href="./Introduction.html">소개</a></li>
				<li>
					<div class="dropdown dropdown-left dropdown-hover">
						<label tabindex="0" class="btn m-1" style="display: none;"></label>게시판
						<ul tabindex="0"
							class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
							<li><a href="./board/noticeList.do">공지사항</a></li>
							<li><a href="./board/askList.do">간단진료문의</a></li>
							<li><a href="./board/reviewList.do">병원리뷰</a></li>
							<li><a href="./board/donaList.do">나눔</a></li>
							<li><a href="./board/freeList.do">자유게시판</a></li>
							<li><a href="./board/advList.do">홍보게시판</a></li>
						</ul>
					</div>
				</li>
				<li><a href="./Map.html">병원검색/예약하기</a></li>
				<li><a href="./donation.jsp">후원하기</a></li>
			</ul>
		</div>
	</div>

<!-- //메뉴 -->

	<img src="/img/logo.png" alt="" />

	<div class="carousel w-full">
		<div id="slide1" class="carousel-item relative w-full">
			<img src="../img/메인.jpg" class="w-full" />
			<div
				class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
				<a href="#slide4" class="btn btn-circle">❮</a> <a href="#slide2"
					class="btn btn-circle">❯</a>
			</div>
		</div>
		<div id="slide2" class="carousel-item relative w-full">
			<img src="../img/메인2.jpg" class="w-full" />
			<div
				class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
				<a href="#slide1" class="btn btn-circle">❮</a> <a href="#slide3"
					class="btn btn-circle">❯</a>
			</div>
		</div>
		<div id="slide3" class="carousel-item relative w-full">
			<img src="../img/소개1.jpg" class="w-full" />
			<div
				class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
				<a href="#slide2" class="btn btn-circle">❮</a> <a href="#slide4"
					class="btn btn-circle">❯</a>
			</div>
		</div>
		<div id="slide4" class="carousel-item relative w-full">
			<img src="../img/소개3.jpg" class="w-full" />
			<div
				class="absolute flex justify-between transform -translate-y-1/2 left-5 right-5 top-1/2">
				<a href="#slide3" class="btn btn-circle">❮</a> <a href="#slide1"
					class="btn btn-circle">❯</a>
			</div>
		</div>
	</div>


<!-- 알림 -->

	<%
		if (msg == null || msg.equals("")) {
	%>
	<%
		} else {
	%>

	<div class="toast toast-top toast-center">
  
  <div class="alert alert-info" style="color: white;">
    <span><%=msg%></span>
  </div>
  
</div>

<script>
var count = 2;
setInterval(function(){
    count -= 1;
    if (count > 0) {
        $('#time').html(count);
    } else {
        $('.alert').fadeOut();
    }
}, 1000);
</script>

	<%
		}
	%>
<!-- //알림 -->

<!-- 채팅 -->
	<script>
		(function() {
			var w = window;
			if (w.ChannelIO) {
				return w.console.error("ChannelIO script included twice.");
			}
			var ch = function() {
				ch.c(arguments);
			};
			ch.q = [];
			ch.c = function(args) {
				ch.q.push(args);
			};
			w.ChannelIO = ch;
			function l() {
				if (w.ChannelIOInitialized) {
					return;
				}
				w.ChannelIOInitialized = true;
				var s = document.createElement("script");
				s.type = "text/javascript";
				s.async = true;
				s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
				var x = document.getElementsByTagName("script")[0];
				if (x.parentNode) {
					x.parentNode.insertBefore(s, x);
				}
			}
			if (document.readyState === "complete") {
				l();
			} else {
				w.addEventListener("DOMContentLoaded", l);
				w.addEventListener("load", l);
			}
		})();

		ChannelIO('boot', {
			"pluginKey" : "2387f2e2-a8ef-4c5a-99e6-95f2c37e6632"
		});
	</script>
<!-- //채팅 -->

</body>
</html>
