<%@page import="kr.or.ddit.banban.vo.MemberVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.banban.vo.DonationListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<MemberVO> mbList = (List<MemberVO>)request.getAttribute("mbList");
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>신고 회원 조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
<link href="../css/css.css" rel="stylesheet" type="text/css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<style>
#mainlogo {
	width: 15%;
	height: 15%;
}
</style>

</head>
<body>
	<center>
	<a href="../Index.jsp"> <img id="mainlogo" src="/views/donation/임지.png" alt="mainlogo"></a>
	</center>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
	<center>
	<h2>신고회원 조회</h2>
	</center> 
	<br>
	<br>
	<br>
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>아이디</th>
					<th>닉네임</th>
					<th>이름</th>
					<th>신고횟수</th>
				</tr>
			</thead>
			<tbody>
<%
					
					int ncSize = mbList.size();
					if (ncSize == 0) {
						
					} else {
						
					int i = 1;
					for (MemberVO mv : mbList) {
%>
				<tr>
					<td><%= i++ %></td>
					<td>
					<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
									<%=mv.getMemId()%> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="./insertBlackList.do?memId=<%=mv.getMemId()%>">블랙리스트 추가</a></li>
								</ul>
							</div>
					 </td>
					<td><%=mv.getMemNic()%></td>
					<td><%=mv.getMemNm()%></td>
					<td><%=mv.getMemRepCnt()%></td>
				</tr>
<%
					}
				} 
%>
			</tbody>
		</table>
	</div>
	<div class="board_page">
				<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
				<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
					href="#" class="num">3</a> <a href="#" class="num">4</a> <a
					href="#" class="num">5</a> <a href="#" class="bt next">></a> <a
					href="#" class="bt last">>></a>
			</div>
</body>
</html>