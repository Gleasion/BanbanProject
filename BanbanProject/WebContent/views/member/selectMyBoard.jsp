<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<BoardVO> selectMyBoard = (List<BoardVO>) request.getAttribute("selectMyBoard");
String memId = (String) session.getAttribute("loginCode");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"
	type="text/css">
<title>반:반-하다</title>
</head>

<div style="text-align: center;">
    <a href="/Index.jsp">
        <img id="mainlogo" src="<%= request.getContextPath() %>/views/donation/임지.png" alt="mainlogo">
    </a>
</div>

<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>내가 작성한 게시글</strong>
			<p>내 아이디로 작성된 글 목록입니다.</p>
		</div>

		<div class="board_list_wrap">
			<div class="board_list">
				<div class="top">
					<div class="num">글번호</div>
					<div class="title">제목</div>
					<div class="writer">작성자</div>
					<div class="date">작성일</div>
				</div>

				<%
					int myListSize = selectMyBoard.size();
				if (myListSize == 0) {

				} else {
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

					int i = 1;
					for (BoardVO bv : selectMyBoard) {
				%>

				<div>
					<div class="num"><%=i++%></div>
					<div class="title">
						<%-- 						<a href="./noticeDetail.do?bdNo=<%=bv.getBdNo()%>&bdCateNo=<%=bv.getBdCateNo() %>"><%=bv.getBdTitle()%></a> --%>
						<a href="/board/noticeDetail.do?bdNo=<%=bv.getBdNo()%>"><%=bv.getBdTitle()%></a>
<!-- 						일단은 공지로 했는데 자유게시판 생기면 차후 수정 예정 -->
					</div>
					<div class="writer"><%=bv.getMemNic()%></div>
					<div class="date"><%=sdf.format(bv.getBdReg())%></div>
				</div>

				<%
					}
				}
				%>

			</div>
			
			<div class="bt_wrap">
				<a href="javascript:history.go(-1)">뒤로</a>
				<a href="Index.jsp" class="on">메인</a> 
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
	alert("<%=msg%>");
	</script>
	<%
		}
	%>

</body>
</html>