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


    a{ 
    	color: #f58b34; text-decoration: none; 
    }

    .links{
        text-align: center;
        margin-bottom: 10px;
    }
    
    .checks{
    	color : red;
    }
    #findlogo{
        width: 150px;
        height: 150px;
        display: block;
        margin: 0 18%; 
    }
    </style>
    <%
    	String memPw = (String)request.getAttribute("memPw");
    
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
      <form action="findPw" class="form-signin" method="POST">
        <input type="text" name="memId" id="memId" class="form-control" placeholder="아이디" required><br>
        <input type="text" name="name" id="name" class="form-control" placeholder="이름" required><BR>
        <input type="email" name="email" id="email" class="form-control" placeholder="이메일" required><br>
        <br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="button">비밀번호 찾기</button>
      </form>
		</div>
        <div class="links">
            <a href="/FindId">아이디 찾기</a> | <a href="/Login">로그인</a> | <a href="/Signup.jsp">회원가입</a>

        </div>
	</div>
  
  </body>
    <script type="text/javascript">

	
	  	//아이디 정규식
		var idJ = /^[a-z0-9]{5,20}$/;
		
  		$("#memId").focusout(function(){
	     if($('#memId').val() == ""){
	   		$('#checks').text('아이디를 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  		
  		$("#memId").focusout(function(){
  			if(!idJ.test($(this).val())){
  			$('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
  			$('#checks').css('color', 'red');
  		}
  		 });
  		
  		$("#name").focusout(function(){
	     if($('#name').val() == ""){
	   		$('#checks').text('이름을 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#checks').text('이메일을 입력해주세요');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  		
  		$('#btn-Yes').on('click',function(){
  			
  			let memId = $('#memId').val();
  			let memEmail = $('#email').val();
  			let memNm = $('#name').val();

  		$.ajax({
  			type : 'post',
  			url : '/FindPw',
  			data :{
  				memId : memId,
  				memNm : memNm,
  				memEmail : memEmail
  				
  				},
  			success : function(rst){
  				console.log("응답확인>>",rst.memPw)
  				alert(rst.memPw)
  				
  			},
  			error : function(xhr){
  				alert(xhr.status)
  			},
  			dataType : 'json'
  			
  		});
	})  		
  		
  		
  		
  		
  		
  
  </script>
</html>