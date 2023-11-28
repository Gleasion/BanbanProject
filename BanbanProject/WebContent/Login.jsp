<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    
    <link href="https://cdn.jsdelivr.net/npm/daisyui@3.2.1/dist/full.css" rel="stylesheet" type="text/css" />
	<script src="https://cdn.tailwindcss.com"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>로그인 폼</title>
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
	
	.login .form-control {
  		position: relative;
  		height: auto;
  		-webkit-box-sizing: border-box;
     	-moz-box-sizing: border-box;
        	 box-sizing: border-box;
  		padding: 10px;
  		font-size: 16px;
	}
    .checkbox{
        margin-right: 20px;
        text-align: right;
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
    .check{
    	color : red;
    }
    </style>
    
    <% 
    String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
    session.removeAttribute("msg");
    %>
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin: 10px 0 0 80px; text-align: center">
				<h2 class="card-title" style="color:#f58b34; "><img src="/img/intrologo.png"/></h2>
		</div>
      <form action="/Login" class="login" method="post">
<!--         <div class="checkbox"> -->
<!--             <label> -->
<!--             <input type="radio" name="mode" value="admin"> 관리자 -->
<!-- 			&nbsp;&nbsp; -->
<!-- 			<input type="radio" name="mode" value="member" checked> 일반회원 -->
<!--             </label> -->
<!--           </div> -->
		<div class="card-body">
  
        <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디" autofocus required><BR>
        <input type="password" name="userPw" id="userPw" class="form-control" placeholder="비밀번호"  required><br>
         <p id="check" class="check">${login_msg}</p><br/>
        <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="로 그 인">
      </form>
    
		</div>
        <div class="links">
            <a href="/FindId">아이디 찾기</a> | <a href="/FindPw">비밀번호 찾기</a> | <a href="/Signup.jsp">회원가입</a>

        </div>
	</div>
	
	<%
		if (msg == null || msg.equals("")) {
	%>
	<%
		} else {
	%>

	<div class="toast toast-center toast-middle">
  		<div class="alert alert-error" style="color: white;">
    		<span><%=msg%></span>
  		</div>
	</div>

<script>
var count = 2;
setInterval(function(){
    count -= 1;
    if (count > 0) {
        $('#time').html(count);
    } else {
        $('.alert').fadeOut();
    }
}, 1000);
</script>

<%
		}
%>
  </body>
</html>