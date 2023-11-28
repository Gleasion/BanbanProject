<%@page import="kr.or.ddit.board.vo.AnswerVO"%>
<%@page import="kr.or.ddit.board.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	AnswerVO av = (AnswerVO) request.getAttribute("av");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반:반-하다</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<div style="text-align: center;">
    <a href="/Index.jsp">
        <img id="mainlogo" src="<%= request.getContextPath() %>/views/donation/임지.png" alt="mainlogo">
    </a>
</div>
	<form action="answerUpdate.do?bdAnswerNo=<%=av.getBdAnswerNo()%>&bdNo=<%=av.getBdNo() %>" id="test" method="post">
	<input type="hidden" name="bdNo" value="<%=av.getBdNo()%>">
		<div class="board_wrap">
			<div class="board_title">
				<strong>답변 수정</strong>
				<p>답변을 수정할 수 있습니다.</p>
			</div>
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="cont">
						<textarea placeholder="수정할 내용 입력" name="bdCont"></textarea>
					</div>
				</div>
				<div class="bt_wrap">
                	<a class="test" type="submit" class="on" onclick="document.getElementById('test').submit();" >답변 수정</a>
                	<a href="javascript:history.go(-1)">취소</a>
            	</div>
			</div>
		</div>
	</form>
</body>
</html>