<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>문서</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	
	
<style>
#mainlogo {
	width: 15%;
	height: 15%;
}

#doMain {
	width: 70%;
	height: 70%;
	opacity: 70%;
}

#span1 {
	background-color: skyblue;
	font-size: 50px;
	
	color: gold;
}

#span2 {
	background-color: rgb(72, 154, 186);
	font-size: 20px;
	font-style: italic;
	color: gold;
}

#logo {
	width: 50%;
	height: 50%;
}

#logo2{
	width:25%;
	height:25%;
}

.carousel-inner img {
  width: 40%;
  height: 40%;
}
</style>

</head>

<body>
	<center>
		<a href="Index.jsp"> <img id="mainlogo" src="views/donation/임지.png" alt="mainlogo">
		</a> <br> <br>
		<div>
			<span id="span1">후원하기</span><br>
			<br> <span id="span2">　반:반-하다와 함께 가는 길　</span>
		</div>
		<br> <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="2000">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
  
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <img src="views/donation/손길.jpg" alt="강아지">
      </div>
  
      <div class="item">
        <img src="views/donation/흑백.jpg" alt="강아지">
      </div>
  
      <div class="item">
        <img src="views/donation/유기견.jpg" alt="강아지 ">
      </div>
    </div>
  
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
  <br> 
  <span>
  			<img id="logo2" alt="반반하다는" src="views/donation/는까지 로고.jpg">
 			<h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp후원
			수익의 50%를 유기동물 보호소에 후원하고 있습니다.<br>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp또한,
			정기적으로 유기동물의 건강검진 및 환경 개선을 통하여<br>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp유기동물이
			건강하고 행복하게 지낼 수 있도록 지원하고 있습니다.</h3>
 <span>
  <br /> 
  <br />
		<form id="frm" name="frm" action="/PayCon" method="post">
			<input type="text" name="amount" id="donationAmt" required />
			<button type="submit" class="btn btn-info" role="button">후원하기</button>
		</form>
	</center>
	<br />
	<br />
	<br />
	<br />
	
	<script>
	
	function validateAmount() {
        var amountInput = document.getElementById("donationAmt");
        var amount = amountInput.value;

        if (amount <= 0) {
            amountInput.setCustomValidity("금액은 0보다 커야 합니다.");
        } else {
            amountInput.setCustomValidity("");
        }
    }
	
	
	$('button').on('click',function(){
		console.log("시작");
		let loginCode = '<%=session.getAttribute("loginCode")%>';
		let amount = $('#donationAmt').value();
		
		$.ajax({
			type : 'post',
			url : '/PayCon', //서버의 위치를 url로 지정(서블릿일때는 @webservlet 경로)
			data :{
				loginCode : loginCode,
				amount : amount
			} ,
			success : function(rst){
				console.log("응답확인 >>" , rst);
			},
			error : function(xhr){
				console.log(xhr.status);
			},
			dataType : 'json'
			
		});
		
		
		
	})
	
	</script>
</body>

</html>