<%@page import="kr.or.ddit.banban.controller.SelectMsgController"%>
<%@page import="kr.or.ddit.banban.vo.MsgVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	MsgVO msgvo = (MsgVO) request.getAttribute("msgVO");
/* SelectMsgController smcon = request.getAttribute("vo"); */
%>
<!DOCTYPE html>
<%-- <html>
<head>
<meta charset="UTF-8">
<title> 받은 쪽지 </title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/insertMsg.do" method="post">
	    보낸사람 : <input type="text" name="memId" value = "<%=loginId%>" readonly><br>
	    받는사람 : <input type="text" name="wmReceiveId"><br>
   	    내용: <textarea rows="10" cols="30" name="wmMsg"></textarea> <br>
    <input type="submit">쪽지 보내기</input>
	</form>	
	<a href="../../Msg.html"><button>메인</button></a>
</body>
</html> --%>

<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
<title>쪽지 상세보기</title>
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
	 <div class="board_wrap">
		<div class="board_title">
			<strong>쪽지 상세보기</strong>
		</div>
	
		<div class="board_list_wrap">
			<div class="board_list">
				<form action="" method="post">
	               <div id="write_msg">
	                   <ul>
	                       <li>
	                           <span class="col1">보낸사람  </span>
	                           <span class="col2"><%=msgvo.getWmReceiveId()%></span>
	                       </li>
	                       <li>
	                           <span class="col1">받는사람  </span>
	                           <span class="col2"><%=msgvo.getMemId()%></span>
	                       </li>
	                       <li id="textarea">
	                           <span class="col1">내용  </span>
	                           <span class="col2"><textarea readonly><%=msgvo.getWmMsg()%></textarea></span>
	                       </li>                                
	                   </ul>
	                   <div class="btn">
		                   	<input type="button" value="뒤로" onClick="history.go(-1)" />
	                   		<input type="button" value="메인" onClick="location.href='Index.jsp'">
	                   </div>
	               </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>