<%@page import="kr.or.ddit.banban.vo.HospitalVO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	List<HospitalVO> hospList = (List<HospitalVO>) request.getAttribute("hospList");
//    String memId = (String) session.getAttribute("loginCode");

String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>병원 목록 조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
#mainlogo {
	width: 15%;
	height: 15%;
}
#btn-Yes {
	background-color: rgb(250, 164, 3);
	border: none;
	border-radius:4mm;
	width: 15rem;
	margin: auto;
	font-weight: bold;
}
</style>

</head>
<body>
	<center>
		<a href="Index.jsp"> <img id="mainlogo"
			src="/views/donation/임지.png" alt="mainlogo"></a>
	</center>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
		<h2>병원목록 조회</h2>
		<table class="table">
			<thead>
				<tr>
					<th></th>
					<th>사업자등록번호</th>
					<th>병원이름</th>
					<th>병원 협약 시작 일시</th>
					<th>병원 협약 마감 일시</th>
					<th>병원 주소</th>
					<th>병원 연락처</th>
				</tr>
			</thead>
			<tbody>
				<%
					int ncSize = hospList.size();
				if (ncSize == 0) {

				} else {

					int i = 1;
					for (HospitalVO hv : hospList) {
				%>
				<tr>
					<td><%=i++%></td>
					<td><%=hv.getHospEntNo()%></td>
					<td><a href="./getHosp.do?hospCd=<%=hv.getHospCd()%>"><%=hv.getHospNm()%></a></td>
					<td><%=hv.getHospPsStart()%></td>
					<td><%=hv.getHospPsEnd()%></td>
					<td><%=hv.getHospAddr()%></td>
					<td><%=hv.getHospTel()%></td>
				</tr>
				<%
					}
				}
				%>
			</tbody>
		</table>
		<div style="text-align:center; margin-top: 20px;">
			<button id="btn-Yes">
				<a href="/views/hospital/hospSignUp.jsp">병원 회원가입</a>
			</button>
		</div>
	</div>
	<div class="board_page">
		<a href="#" class="bt first"><<</a> <a href="#" class="bt prev"><</a>
		<a href="#" class="num on">1</a> <a href="#" class="num">2</a> <a
			href="#" class="num">3</a> <a href="#" class="num">4</a> <a href="#"
			class="num">5</a> <a href="#" class="bt next">></a> <a href="#"
			class="bt last">>></a>
	</div>
		</div>
</body>
</html>