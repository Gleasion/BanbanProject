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
<title>받은쪽지함</title>
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
				<strong>받은쪽지함</strong>
			</div>

			<div class="board_list_wrap">
				<div class="board_list">
					<div class="top">
						<div class="" style="width: 3%"></div>
						<div class="num" style="width: 5%">번호</div>
						<div class="title" style="width: 50%">내용</div>
						<div class="writer" style="width: 8%">보낸사람</div>
						<div class="writer" style="width: 8%">받는사람</div>
						<div class="date">수신일</div>
					</div>
					<!-- <table border="1px solid">
		<tr>
			<th> </th>
			<th> 번호 </th>
			<th> 보낸사람 </th>
			<th> 받는사람 </th>
			<th> 내용 </th>
			<th> 발신일 </th>
		</tr>
		
		<tr> -->
					<%
						int msgSize = msgList.size();

					if (msgSize == 0) {
					%>
					<div style="display: flex; justify-content: center;">
						<div style="font-size: 18px;">받은쪽지가 없습니다.</div>
					</div>
					<%
						} else {
					int i = 1;
					for (MsgVO msg : msgList) {
					%>
					<div>
						<div style="width: 3%">
							<input type="checkbox" name="wmNo[]" value="<%=msg.getWmNo()%>">
						</div>
						<div class="num" style="width: 5%"><%=i++%></div>
						<div class="title" style="width: 50%">
							<a href="/selectMsg.do?wmNo=<%=msg.getWmNo()%>"> <%=msg.getWmMsg()%></a>
						</div>
						<div class="writer" style="width: 8%"><%=msg.getMemId()%></div>
						<div class="writer" style="width: 8%"><%=msg.getWmReceiveId()%></div>
						<div class="date"><%=msg.getWmMdate()%></div>
					</div>
					<%-- <td> <input type="checkbox" name="wmNo[]" value="<%=msg.getWmNo() %>"> </td>
			<td> <%=i++%> </td>
			<td> <%=msg.getMemId() %> </td>
			<td> <%=msg.getWmReceiveId() %> </td>
			<td><a href="/selectMsg.do?wmNo=<%=msg.getWmNo()%>"> <%=msg.getWmMsg() %></a> </td>
			<td> <%=msg.getWmMdate() %> </td>
		</tr> --%>
					<%
						}
					}
					%>
				</div>
				<div class="btn">
					<input type="button" value="뒤로" onClick="history.go(-1)" /> <input
						type="button" value="삭제" onclick="f_chk()">
				</div>


				<script
					src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
				<script>
					function f_chk() {
						var chk_arr = $("input[name='wmNo[]']");

						var chk_data = [];
						for (var i = 0; i < chk_arr.length; i++) {
							if (chk_arr[i].checked == true) {
								chk_data.push(chk_arr[i].value);
							}
						}
						console.log(chk_data);

						const form = document.createElement('form'); // form 태그 생성
						form.setAttribute('method', 'get'); // 전송 방식 결정 (get or post)
						form.setAttribute('action', "/deleteMsg.do"); // 전송할 url 지정

						const data_1 = document.createElement('input'); // input 태그 생성
						data_1.setAttribute('type', 'hidden'); // type = hidden
						data_1.setAttribute('name', 'checked'); // 데이터의 key
						data_1.setAttribute('value', chk_data); // 데이터의 value (여기서는 data1)

						form.appendChild(data_1);
						document.body.appendChild(form);
						form.submit();
					}
				</script>
</body>
</html>