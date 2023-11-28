<%@page import="kr.or.ddit.banban.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
 <head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>아이디 찾기</title>
    <style>
        @import url("http://fonts.googleapis.com/earlyaccess/nanumgothic.css");
	
	html {
		height: 100%;
	}
	
	body {
	    width:100%;
	    height:100%;
	    margin: 0;
  		padding-top: 200px;
  		padding-bottom: 40px;
  		font-family: "Nanum Gothic", arial, helvetica, sans-serif;
  		background-repeat: no-repeat;
	}
	
    .card {
        margin: 0 auto; /* Added */
        float: none; /* Added */
        margin-bottom: 10px; /* Added */
	}

    #btn-Yes{
        background-color: #e4932b;
        border: none;
    }
	
	.form-signin .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .card-title{
        margin-left: 30px;
    }
	 .links{
        text-align: center;
        margin-bottom: 10px;
    }

    a{ 
    	color: #f58b34; text-decoration: none; 
    }
    .text2{
    	color : blue;
    }
    #findlogo{
        width: 150px;
        height: 150px;
        display: block;
        margin: 0 18%; 
    }
    </style>
    <%
    	String memId = (String)request.getAttribute("memId");
  
  
    %>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#f58b34;">
			<a href="Index.jsp">
			<img src="views/donation/임지.png" id="findlogo"/>
			</a>
			</h2>
		</div>
        
		<div class="card-body">
      <form action="findId" class="form-signin" method="POST">
  		 <p class="text2"> ${findid2}</p>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required autofocus><BR>
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>
        	<br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button">아 이 디 찾 기</button>
      </form>
		</div>
        <div class="links">
            <a href="/FindPw">비밀번호 찾기</a> | <a href="/Login">로그인</a> | <a href="/Signup">회원가입</a>

        </div>
	</div>
   
  </body>
  <script type="text/javascript">
	
  		$("#name").focusout(function(){
  			
	     if($('#name').val() == ""){
	   		$('#check').text('이름을 입력해주세요.');
	   	  	$('#check').css('color', 'red');
	   
	     }else{
	    	 $('#check').hide();
	     }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#check').text('이메일을 입력해주세요');
	   	  	$('#check').css('color', 'red');
	     }else{
	    	 $('#check').hide();
	     }
	     });
  		
	$('#btn-Yes').on('click',function(){
		
  			let memNm = $('#name').val();
  			let memEmail = $('#email').val();

  	$.ajax({
  			type : 'post',
  			url : '/FindId',
  			data :{
  				memNm : memNm,
  				memEmail : memEmail
  				},
  			success : function(rst){
  				console.log("응답확인>>",rst.memId)
  				alert("요청 ID정보 >> "+rst.memId)
  						
  				
  			},
  			error : function(xhr){
  				alert(xhr.status)
  			},
  			dataType : 'json'
  			
  		});
	})  		
  
  </script>
</html>