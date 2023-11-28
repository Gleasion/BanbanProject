<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<BoardVO> ncList = (List<BoardVO>) request.getAttribute("ncList");
	String searchWord = (String) session.getAttribute("searchWord");
	
	String memId = (String) session.getAttribute("loginCode");
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">

<style>
#mainlogo {
	width: 15%;
	height: 15%;
}
</style>

<title>게시글 신고 확인 목록</title>


</head>
<body>
<center>
	<a href="../Index.jsp"> <img id="mainlogo" src="/views/donation/임지.png" alt="mainlogo"></a>
	</center>
	<div class="board_wrap">
		<div class="board_title">
			<strong>게시글 신고 확인</strong>
			<p>신고글을 모아놓은 공간입니다.</p>
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
					int ncSize = ncList.size();
					if (ncSize == 0) {
					
					} else {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					int i = 1;
					for (BoardVO bv : ncList) {
%>

				<div>
					<div class="num"><%= i++ %></div>
					<div class="title">
						<a href="./blackListCheckDetail.do?bdNo=<%=bv.getBdNo()%>&bdCateNo=<%=bv.getBdCateNo() %>"><%=bv.getBdTitle()%></a>
<%-- 						<a href="./blackListCheckDetail.do?bdNo=<%=bv.getBdNo()%>bdNo=<%=bv.getBdNo()%>"><%=bv.getBdTitle()%></a> --%>
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
				<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
				<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="num">3</a> <a href="#" class="num">4</a> <a
					href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
					href="#" class="bt last">>></a>
			</div>
			<br>
			<br>
			<br>
			<center>
			<form method="post" action="./blackListCheck.do">
	<div class="col-lg-4">
	<input type="text" class="form-control pull-right" placeholder="Search" name="searchWord" />
	</div>
	<button class="btn btn-primary" type="submit" >
	<span class="glyphicon glyphicon-search">
	</span>
	</button>
</form>
			</center>
	</div>
		</div>
	</div>
	
<%
	if(msg == null || msg.equals("")) {
		%>
		<%
	}else{
%>

<script>
	alert("<%=msg%>");
</script>
<%
	} 
%>
	
</body>
</html>