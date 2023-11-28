<%@page import="kr.or.ddit.banban.vo.MsgVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"
	type="text/css">
<title>보낸쪽지함</title>
</head>
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
<body>
	<div style="text-align: center;">
		<a href="/Index.jsp"> <img id="mainlogo"
			src="/views/donation/임지.png" alt="mainlogo" style="width: 200px;">
		</a>
	</div>
	<div class="img">
		<%
			List<MsgVO> msgList = (List<MsgVO>) request.getAttribute("msgList");
		%>

		<div class="board_wrap">
			<div class="board_title">
				<strong>보낸쪽지함</strong>
			</div>

			<div class="board_list_wrap">
				<div class="board_list">
					<div class="top">
						<div class="num" style="width: 5%">번호</div>
						<div class="title" style="width: 50%">내용</div>
						<div class="writer" style="width: 8%">보낸사람</div>
						<div class="writer" style="width: 8%">받는사람</div>
						<div class="date">발신일</div>
					</div>
					<%
						int msgSize = msgList.size();

					if (msgSize == 0) {
					%>
					<div style="display: flex; justify-content: center;">
						<div style="font-size: 18px;">보낸쪽지가 없습니다.</div>
					</div>
					<%
						} else {
					int i = 1;
					for (MsgVO msg : msgList) {
					%>
					<div>
						<div class="num" style="width: 5%"><%=i++%></div>
						<div class="title" style="width: 50%">
							<a href="/selectMsg.do?wmNo=<%=msg.getWmNo()%>"> <%=msg.getWmMsg()%></a>
						</div>
						<div class="writer" style="width: 8%"><%=msg.getMemId()%></div>
						<div class="writer" style="width: 8%"><%=msg.getWmReceiveId()%></div>
						<div class="date"><%=msg.getWmMdate()%></div>
					</div>

					<%
						}
					}
					%>

				</div>
				<div class="btn">
					<input type="button" value="뒤로" onClick="history.go(-1)" />
				</div>
</body>
</html>