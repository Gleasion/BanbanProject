<%@page import="kr.or.ddit.banban.vo.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<MemberVO> memList = (List<MemberVO>) request.getAttribute("memList");
int pageSize = 7; // 한 페이지당 회원 수
int totalSize = memList.size(); // 전체 회원 수
int totalPages = (int) Math.ceil((double) totalSize / pageSize); // 총 페이지 수

String pageParam = request.getParameter("page");
int currentPage = (pageParam == null) ? 1 : Integer.parseInt(pageParam); // 현재 페이지

int startIdx = (currentPage - 1) * pageSize; // 페이지의 시작 인덱스
int endIdx = Math.min(startIdx + pageSize, totalSize); // 페이지의 마지막 인덱스 (페이지당 회원 수를 초과하지 않도록)

List<MemberVO> currentPageMembers = memList.subList(startIdx, endIdx); // 현재 페이지에 표시할 회원들

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>전체 회원 조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"
	type="text/css">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">

<style>
#mainlogo {
	width: 15%;
	height: 15%;
}

.board_page {
	text-align: center;
}
</style>

</head>
<body>
	<center>
		<a href="../Index.jsp"> <img id="mainlogo"
			src="/views/donation/임지.png" alt="mainlogo"></a>
	</center>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<h2>회원 조회</h2>
		<table class="table">
			<thead>
				<tr>
					<th>회원아이디</th>
					<th>닉네임</th>
					<th>회원이름</th>
					<th>관리자 권한</th>
				</tr>
			</thead>
			<tbody>
				<%
					for (MemberVO mv : currentPageMembers) {
				%>
				<tr>
					<td><%=mv.getMemId()%></td>
					<td><%=mv.getMemNic()%></td>
					<td><%=mv.getMemNm()%></td>
					<td>
						<div class="dropdown">
							<button class="btn btn-primary dropdown-toggle" type="button"
								data-toggle="dropdown">
								권한 <span class="caret"></span>
							</button>
							<ul class="dropdown-menu">
								<li><a
									href="<%=request.getContextPath()%>/admin/ADMemberDetail?memId=<%=mv.getMemId()%>">회원정보 자세히 보기</a></li>
										<li><a href="<%=request.getContextPath()%>/admin/ADMemberDelete?memId=<%=mv.getMemId()%>">회원정보 삭제</a></li>
<!-- 								<li><h6>회원정보 삭제</h6></li> -->
<!-- 								<p class="py-4">진짜 탈퇴하시겠습니까?</p> -->
<!-- 								<div class="modal-action"> -->
<!-- 									if there is a button in form, it will close the modal -->
<!-- 									<button class="btn btn-md">아니오</button> -->
<!-- 									<button -->
<!-- 										class="btn btn-md inline-block cursor-pointer rounded-md bg-blue-400 px-4 py-3 text-center text-sm font-semibold uppercase text-white transition duration-200 ease-in-out hover:bg-blue-500"> -->
<%-- 										<a href="../../admin/MemberDelete?memId=<%=mv.getMemId()%>"> 예 </a> --%>
							</ul>
						</div>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
	<div class="board_page">
		<%
			if (currentPage > 1) {
		%>
		<a href="?page=<%=currentPage - 1%>" class="bt prev"><</a>
		<%
			}
		%>
		<%
			for (int i = 1; i <= totalPages; i++) {
		%>
		<a href="?page=<%=i%>" class="num <%=currentPage == i ? "on" : ""%>"><%=i%></a>
		<%
			}
		%>
		<%
			if (currentPage < totalPages) {
		%>
		<a href="?page=<%=currentPage + 1%>" class="bt next">></a>
		<%
			}
		%>
	</div>
</body>
</html>