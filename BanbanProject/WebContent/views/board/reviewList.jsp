<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	List<BoardVO> bdList = (List<BoardVO>) request.getAttribute("list");
String memId = (String) session.getAttribute("loginCode");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<script>
  (function(){var w=window;if(w.ChannelIO){return w.console.error("ChannelIO script included twice.");}var ch=function(){ch.c(arguments);};ch.q=[];ch.c=function(args){ch.q.push(args);};w.ChannelIO=ch;function l(){if(w.ChannelIOInitialized){return;}w.ChannelIOInitialized=true;var s=document.createElement("script");s.type="text/javascript";s.async=true;s.src="https://cdn.channel.io/plugin/ch-plugin-web.js";var x=document.getElementsByTagName("script")[0];if(x.parentNode){x.parentNode.insertBefore(s,x);}}if(document.readyState==="complete"){l();}else{w.addEventListener("DOMContentLoaded",l);w.addEventListener("load",l);}})();

  ChannelIO('boot', {
    "pluginKey": "2387f2e2-a8ef-4c5a-99e6-95f2c37e6632"
  });
</script>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"
	type="text/css">
<title>반:반-하다</title>

<style type="text/css">
.titlereview {
	width: 50%;
}

.star {
	width: 10%;
}
</style>

<link href="https://cdn.jsdelivr.net/npm/daisyui@3.2.1/dist/full.css"
	rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
	<div style="margin-top: 50px;">
		<a href="/Index.jsp"> <img  style="margin: 0 auto;" id="mainlogo"
			src="<%=request.getContextPath()%>/views/donation/임지.png"
			alt="mainlogo">
		</a>
	</div>
	<div class="board_wrap">
		<div class="board_title">
			<strong>병원리뷰</strong>
			<p>병원 리뷰를 남길 수 있는 공간입니다.</p>
		</div>

		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">글번호</div>
					<div class="star">별점</div>
					<div class="titlereview">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일시</div>
				</div>

				<%
					int bdSize = bdList.size();
				if (bdSize == 0) {

				} else {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

					for (BoardVO bv : bdList) {
				%>

				<div>
					<div class="num"><%=bv.getRnum()%></div>
					<div class="star">
						<%
							switch (bv.getBdRating()) {
							case "1" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "2" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "3" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "4" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "5" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "6" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "7" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "8" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "9" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" checked/> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" />
						</div>
						<%
							break;
						case "10" :
						%>
						<div class="rating rating-md rating-half">
							<input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-1"
								disabled="disabled" /> <input type="checkbox" name="rating-10"
								class="bg-orange-500 mask mask-star-2 mask-half-2"
								disabled="disabled" checked/>
						</div>
						<%
							break;
						}
						%>

					</div>
					<div class="titlereview">
						<a href="./reviewDetail.do?bdNo=<%=bv.getBdNo()%>"><%=bv.getBdTitle()%></a>
					</div>
					<div class="writer"><%=bv.getMemNic()%></div>
					<div class="date"><%=sdf.format(bv.getBdReg())%></div>
				</div>

				<%
					}
				}
				%>

			</div>

			<div class="board_page">
				<c:forEach var="pNo" begin="${requestScope.sPage}"
					end="${requestScope.ePage}" step="1">
					<a href="/board/paging?bdCateNo=${param.bdCateNo}&page=${pNo}"
						class='num 
					<c:if test="${param.page==pNo}">on</c:if>'>${pNo}</a>
				</c:forEach>
			</div>

			<div class="bt_wrap">
				<a href="<%=request.getContextPath()%>/Index.jsp">메인으로</a>
				<%
					if (!memId.startsWith("hosp") && !memId.equals("admin")) {
				%>
				<a href="reviewInsert.do">게시글 작성</a>
				<%
					}
				%>
			</div>
		</div>
	</div>

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

</body>
</html>