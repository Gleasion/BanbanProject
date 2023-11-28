<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.banban.vo.DonationListVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<DonationListVO> dcList = (List<DonationListVO>)request.getAttribute("dcList");
// 	String memId = (String) session.getAttribute("loginCode");
	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>기부자 조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
<!-- <link href="../css/css.css" rel="stylesheet" type="text/css"> -->
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
		<h2>기부 조회</h2>
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>기부번호</th>
					<th>기부자</th>
					<th>기부일</th>
					<th>기부금액</th>
				</tr>
			</thead>
			<tbody>
<%
					
					int ncSize = dcList.size();
					if (ncSize == 0) {
						
					} else {
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					
					int i = 1;
					for (DonationListVO dv : dcList) {
%>
				<tr>
					<td><%= i++ %></td>
				<td><%=dv.getDpNo()%></td>
					<td>
					<button onclick="window.open('/insertMsg.do?memId=<%=dv.getMemId()%>', '_blank', 'toolbar=no, location=no, status=no, scrollbars=auto, width=800, height=600, top=10, left=10')" class="item" style="background-color: #ffffff; border: none;">
                  		<%=dv.getMemId()%></button>
					</td>
					<td><%=sdf.format(dv.getDpDate())%></td>
					<td><%=dv.getDpAmt()%>원</td>
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