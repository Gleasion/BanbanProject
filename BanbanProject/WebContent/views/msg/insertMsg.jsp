<%@page import="kr.or.ddit.banban.vo.MsgVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	MsgVO msgvo = (MsgVO) request.getAttribute("msgvo");
    String loginId = String.valueOf(session.getAttribute("loginCode"));
    
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="<%=request.getContextPath()%>/css/css.css" rel="stylesheet" type="text/css">
<title> 쪽지 보내기 </title>
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>쪽지 상세보기</strong>
		</div>
	
		<div class="board_list_wrap">
			<div class="board_list">
	               <div id="write_msg">
	                   <ul>
	                       <li>
	                           <span class="col1">보낸사람  </span>
	                           <span class="col2" name="memId"><%=loginId%></span>
	                       </li>
	                       <li>
	                           <span class="col1">받는사람  </span>
	                           <span class="col2"><input type="text" id="wmReceiveId"></span>
	                       </li>
	                       <li id="textarea">
	                           <span class="col1">내용  </span>
	                           <span class="col2"><textarea id="wmMsg"></textarea></span>
	                       </li>                                
	                   </ul>
	                   <div class="btn">
	                   		<input type="button" value="쪽지보내기" onClick="f_chk()">
		                   	<input type="button" value="뒤로" onClick="history.go(-1)" />
	                   		<input type="button" value="메인" onClick="location.href='Index.jsp'">
	                   </div>
	               </div>
            </div>
        </div>
    </div>
    
    <script>
	function f_chk(){
		var wmReceiveId = document.getElementById("wmReceiveId").value;
        var wmMsg = document.getElementById("wmMsg").value;

        const form = document.createElement('form'); // form 태그 생성
        form.setAttribute('method', 'post'); // 전송 방식 결정 (get or post)
        form.setAttribute('action', "<%=request.getContextPath() %>/insertMsg.do"); // 전송할 url 지정
        
        const data_2 = document.createElement('input'); // input 태그 생성
        data_2.setAttribute('type', 'hidden'); // type = hidden
        data_2.setAttribute('name', 'wmReceiveId'); // 데이터의 key
        data_2.setAttribute('value', wmReceiveId); // 데이터의 value (여기서는 data1)
        const data_3 = document.createElement('input'); // input 태그 생성
        data_3.setAttribute('type', 'hidden'); // type = hidden
        data_3.setAttribute('name', 'wmMsg'); // 데이터의 key
        data_3.setAttribute('value', wmMsg); // 데이터의 value (여기서는 data1)
        
        form.appendChild(data_2);
        form.appendChild(data_3);
        document.body.appendChild(form);
        form.submit();
	}
	</script>
</body>
</html>