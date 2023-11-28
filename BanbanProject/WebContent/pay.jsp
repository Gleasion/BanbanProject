<%@page import="kr.or.ddit.banban.vo.DonationListVO"%>
<%@page import="kr.or.ddit.banban.service.DonationServiceImpl"%>
<%@page import="kr.or.ddit.banban.service.IDonationService"%>
<%@page import="kr.or.ddit.banban.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%


	MemberVO mv = (MemberVO)request.getAttribute("mv");
	
	int amount =(int) request.getAttribute("amount");
	System.out.println("amount : " + amount);
	
	

	%>

	<form id="pgForm" name="pgForm" action="Index.jsp" method ="get">
		<input type="hidden" name="Amt" value="<%=amount%>"> 
		<input type="hidden" name="BuyerName" value="<%=mv.getMemNm()%>">
		<input type="hidden" name="BuyerId" value="<%=mv.getMemId()%>">
		<input type="hidden" name="BuyerAMT" value="<%=amount%>">
	
		<input type="hidden" name="OrderName" value="결제테스트">
	</form>

	<!-- 포트원 결제 -->
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<!-- jQuery -->
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript"
		src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<!-- 포트원 결제 -->
	<script type="text/javascript">
	$(function(){
		IMP.init('imp27188358');
		IMP.request_pay({
			pg : 'kakaopay',
			name : '반반하다 후원',
			amount : <%=amount%>,
			buyer_email : '<%=mv.getMemEmail()%>',
			buyer_name : '<%=mv.getMemNm()%>',
			buyer_tel : '<%=mv.getMemTel()%>',
			buyer_addr : '<%=mv.getMemAddr()%>'
			}, function(response) { // callback 로직
				if (response.success) { //결제 성공
					console.log(response);
					$('#pgForm').submit();
				 	alert('귀하의 후원에 감사드립니다.');
				} else {
					alert('결제실패 : ' + response.error_msg);
					 $('#pgForm').submit();
				}
			});
		
		
		});

	let mId = '<%=mv.getMemId()%>';
	let amount = <%=amount%>
	
 	$.ajax({
 		
 		type : 'post',
 		url : '/DonationList'
 		,
 		data : {
 			 mId : mId,
 			amount : amount
 		},
 		success : function(rst){
 			console.log("응답확인 >>" , rst);
 		},
 		error : function(xhr){
 			console.log(xhr.status);
 		},
 		dataType :'json'

 	});
 	
 	
	</script>

</body>
</html>