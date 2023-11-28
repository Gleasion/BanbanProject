<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String loginCd = (String) session.getAttribute("loginCode");
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
		session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>반반하다</title>
		<meta name="description" content="AOS - Animate On Scroll library using CSS3">
		<meta name="keywords" content="AOS, animate on scroll, css3 scroll animations, simple scroll animations">
		<meta name="viewport" content="width=device-width">
		
		<link href="https://cdn.jsdelivr.net/npm/daisyui@3.2.1/dist/full.css" rel="stylesheet" type="text/css" />
		<script src="https://cdn.tailwindcss.com"></script>
		<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
		<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
		<!-- <link rel="stylesheet" href="http://localhost:3002/dist/aos.css" /> -->
		<link rel="stylesheet" href="dist/css/styles.css" />
	
	<style type="text/css">
	.introduceimg {
		width: 1000px; 
		height: 700px;
	}
	
	.btn{
  		border: 0px solid #60a5fa;
  	}
  	.btn:before {
  		background: initial;
   	{
  }
	</style>
	
	</head>
	<body>
		<div class="backgrounds overlay">
			<div class="background" data-aos="fade-in" data-aos-duration="1500" data-aos-anchor=".section--hero" style="background-image: url(img/Main2.jpg);"></div>
		</div>
		<header class="hero">
			<div class="hero-right" data-aos="fade-down" data-aos-easing="ease" data-aos-delay="1000" >
<!-- 				<h1 class="hero__logo" data-aos="zoom-in">반반하다</h1> -->
<!-- 				<h2 class="hero__text" data-aos="fade-up" data-aos-easing="ease" data-aos-delay="400">반려동물과 반려인을 연결해주는 소통 플랫폼</h2> -->
					<img alt="" src="img/Logo배경없음.png">
			</div>
			<span class="hero__scroll" data-aos="fade-up" data-aos-easing="ease" data-aos-delay="2000">
				Scroll down <br>
				<i class="chevron bottom"></i>
			</span>
<!-- 			<a href="http://github.com/michalsnik/aos" target="_blank" class="octocat" data-aos="zoom-out" data-aos-delay="1500"> -->
<!-- 				<img src="img/임지.png" alt=""> -->
<!-- 			</a> -->

			<!-- 메뉴 -->
	<div class="drawer drawer-end octocat z-10" style=" position: fixed; top: 20px; text-align: right;">
		<input id="my-drawer-4" type="checkbox" class="drawer-toggle" />
		<div class="drawer-content" style="margin-right: 50px">
			<!-- Page content here -->
			<label style="width: 75px; height: 75px; padding: 28px 0 0 3px;" for="my-drawer-4" class="drawer-button btn btn-circle bg-blue-400 text-bottom text-sm font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-blue-500 z-10" >Menu</label>
		</div>
		<div class="drawer-side z-20" >
			<label for="my-drawer-4" class="drawer-overlay"></label>
			<ul class="menu p-4 w-80 h-full bg-base-200 text-base-content">
				<!-- Sidebar content here -->
<% 
	if(loginCd != null){
		
		if(loginCd.equals("admin")){
%>
			<li>
			<div class="dropdown dropdown-left dropdown-hover ">
				<label tabindex="0" class="btn m-1" style="display: none;"></label>관리자메뉴
				<ul tabindex="0"
					class="dropdown-content z-[1] menu p-2 shadow bg-base-100 rounded-box w-52">
					<li><a href="/admin/ADMemberList">회원관리</a></li>
					<li><a href="/getAllHosp.do">병원관리</a></li>
					<li><a href="https://desk.channel.io/#/channels/139623/user_chats/64b4ed7ea3cc022794e4">고객센터관리</a></li>
					<li><a href="/admin/ADdonationList.do">후원자리스트</a></li>
					<li><a href="/admin/showBlackList.do">블랙리스트</a></li>
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
%>				<li>
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
				<li><a href="./Map.html">병원검색/예약하기</a></li>
				<li><a href="./donation.jsp">후원하기</a></li>
			</ul>
		</div>
	</div>

<!-- //메뉴 -->

		</header>

		<section class="section section--code">
			<div class="container" >
				<h2 class="section-title">Introduce</h2>
				
				<div data-aos="fade-up-left" data-aos-anchor-placement="top-center">
						<img style="margin: 60px auto;" class="introduceimg" alt="" src="img/메인.jpg">
				</div>
				<div data-aos="fade-up-right" data-aos-anchor-placement="top-center">
						<img style="margin: 60px auto;" class="introduceimg" alt="" src="img/메인2.jpg">
				</div>
				<div data-aos="fade-up-left" data-aos-anchor-placement="top-center">
						<img style="margin: 60px auto;" class="introduceimg" alt="" src="img/intro1.png">
				</div>
				<div data-aos="fade-up-right" data-aos-anchor-placement="top-center">
						<img style="margin: 60px auto;" class="introduceimg" alt="" src="img/intro2.png">
				</div>
				<div data-aos="fade-up-left" data-aos-anchor-placement="top-center">
						<img style="margin: 60px auto;" class="introduceimg" alt="" src="img/intro3.png">
				</div>
				<div data-aos="fade-up-right" data-aos-anchor-placement="top-center">
						<img style="margin: 60px auto;" class="introduceimg" alt="" src="img/intro4.png">
				</div>
			</div>
		</section>

<!-- 		<section class="section section--code"> -->
<!-- 			<div class="container"> -->
<!-- 				<h2 class="section-title">Flip</h2> -->
<!-- 				<div class="code code--small code--left" data-aos="flip-left"> -->
<!-- 					<pre><code>&lt;div data-aos="flip-left">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--right" data-aos="flip-right"> -->
<!-- 					<pre><code>&lt;div data-aos="flip-right">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--left" data-aos="flip-up"> -->
<!-- 					<pre><code>&lt;div data-aos="flip-up">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--right" data-aos="flip-down"> -->
<!-- 					<pre><code>&lt;div data-aos="flip-down">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->

<!-- 		<section class="section section--code"> -->
<!-- 			<div class="container"> -->
<!-- 				<h2 class="section-title">Zoom</h2> -->
<!-- 				<div class="code code--small code--left" data-aos="zoom-in"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-in">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--right" data-aos="zoom-in-up"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-in-up">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--left" data-aos="zoom-in-down"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-in-down">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--right" data-aos="zoom-in-left"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-in-left">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--left" data-aos="zoom-in-right"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-in-right">&lt;/div></code></pre> -->
<!-- 				</div> -->

<!-- 				<div class="code code--small code--right" data-aos="zoom-out"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-out">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--left" data-aos="zoom-out-up"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-out-up">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--right" data-aos="zoom-out-down"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-out-down">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--left" data-aos="zoom-out-right"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-out-right">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--small code--right" data-aos="zoom-out-left"> -->
<!-- 					<pre><code>&lt;div data-aos="zoom-out-left">&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->

<!-- 		<section class="section section--code"> -->
<!-- 			<div class="container"> -->
<!-- 				<h2 class="section-title">Different settings examples</h2> -->
<!-- 				<div class="code code--left" data-aos="fade-up" data-aos-duration="3000"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="3000">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--right" data-aos="fade-down" data-aos-easing="linear" data-aos-duration="1500"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-down"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="linear"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="1500">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div id="example-anchor" class="code code--left" data-aos="fade-right" data-aos-offset="300" data-aos-easing="ease-in-sine"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-right"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-offset="300"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="ease-in-sine">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--right" data-aos="fade-left" data-aos-anchor="#example-anchor" data-aos-offset="500" data-aos-duration="500"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-left"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor="#example-anchor"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-offset="500"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="500">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--left" data-aos="fade-zoom-in" data-aos-easing="ease-in-back" data-aos-delay="300" data-aos-offset="0"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-zoom-in"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="ease-in-back"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-delay="300"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-offset="0">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--right" data-aos="flip-left" data-aos-easing="ease-out-cubic" data-aos-duration="2000"> -->
<!-- 					<pre><code>&lt;div data-aos="flip-left"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-easing="ease-out-cubic"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-duration="2000">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</section> -->

<!-- 		<section class="section section--code"> -->
<!-- 			<div class="container"> -->
<!-- 				<h2 class="section-title">Anchor placement</h2> -->

<!-- 				<div class="code code--wider code--left" data-aos="fade-up" data-aos-anchor-placement="top-bottom"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="top-bottom">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--wider code--right" data-aos="fade-up" data-aos-anchor-placement="center-bottom"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="center-bottom">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--wider code--left" data-aos="fade-up" data-aos-anchor-placement="bottom-bottom"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="bottom-bottom">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->

<!-- 				<div class="code code--wider code--right" data-aos="fade-up" data-aos-anchor-placement="top-center"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="top-center">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--wider code--left" data-aos="fade-up" data-aos-anchor-placement="center-center"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="center-center">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->
<!-- 				<div class="code code--wider code--right" data-aos="fade-up" data-aos-anchor-placement="bottom-center"> -->
<!-- 					<pre><code>&lt;div data-aos="fade-up"&#13;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;data-aos-anchor-placement="bottom-center">&#13;&lt;/div></code></pre> -->
<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</section> -->

		<section class="section section--more">
			<div class="container">
				<div class="section-group" style="position: relative; height: 200px;">
<!-- 					<h3>Get it</h3> -->
					<a style="position: absolute; top: 70px; left: 45%;" href="#" class="btn"><span style="top: 8px;">최상단으로 이동하기</span></a>
<!-- 					<a href="https://github.com/michalsnik/aos" target="_blank" class="btn"><span>View on github</span></a> -->
				</div>

<!-- 				<div class="section-group"> -->
<!-- 					<h3>Install using Yarn, Npm, Bower</h3> -->

<!-- 					<pre><code>yarn add aos</code></pre> -->

<!-- 					<pre><code>npm install aos --save</code></pre> -->

<!-- 					<pre><code>bower install aos --save</code></pre> -->
<!-- 				</div> -->

<!-- 				<div class="section-group"> -->
<!-- 					<h3>CDN sources</h3> -->
<!-- 					<h4>CSS</h4> -->
<!-- 					<pre><code>&lt;link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet"></code></pre> -->

<!-- 					<h4>JS</h4> -->
<!-- 					<pre><code>&lt;script src="https://unpkg.com/aos@2.3.1/dist/aos.js">&lt;/script></code></pre> -->
<!--         		</div> -->

<!-- 				<div class="section-group"> -->
<!-- 					<h3>footer</h3> -->
<!-- 					<pre><code>푸터푸터</code></pre> -->
<!-- 				</div> -->

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
			
		</section>

		<footer class="footer">
			<div class="container">

			</div>
		</footer>

		<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.6/highlight.min.js"></script>

		<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
		<!-- <script src="http://localhost:3002/dist/aos.js"></script> -->

		<script>
			AOS.init({
				easing: 'ease-out-back',
				duration: 1000
			});
		</script>

		<script>
			hljs.initHighlightingOnLoad();

			$('.hero__scroll').on('click', function(e) {
				$('html, body').animate({
					scrollTop: $(window).height()
				}, 1200);
			});
		</script>
		
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
