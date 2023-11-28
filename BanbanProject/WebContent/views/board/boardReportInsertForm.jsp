<%@page import="kr.or.ddit.board.vo.ReportVO"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%
  	BoardVO bv = (BoardVO) request.getAttribute("bv");
  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고하기</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<form action="boardReportInsert.do?memId=<%=bv.getMemId()%>&bdNo=<%=bv.getBdNo()%>"  id="test" method="post">
		<input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>">
		<input type="hidden" name="memId" value="<%=bv.getMemId()%>">
		<div class="board_wrap">
        <div class="board_title">
            <strong >신고하기</strong>
            <p style="font-style: oblique; color: crimson;">해당 글 및 회원을 신고할 수 있습니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>신고 카테고리</dt>
                        <dd>
                        	<select name="repCate">
                        		<option value="스팸홍보/도배글">스팸홍보/도배글</option>
                        		<option value="음란물">음란물</option>
                        		<option value="불법정보">불법정보 포함</option>
                        		<option value="욕설/혐오/차별적 표현">욕설/혐오/차별적 표현</option>
                        		<option value="미성년자에게 유해함">미성년자에게 유해함</option>
                        		<option value="명예훼손/생명경시">명예훼손/생명경시</option>
                        		<option value="개인정보 노출">개인정보 노출</option>
                        	</select>
                        </dd>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="(필수)자세한 신고내용을 입력하세요." name="bllstRsn"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <a class="test" type="sumit" class="on" onclick="document.getElementById('test').submit();" >신고하기</a>
                <a href="javascript:history.go(-1)">취소</a>
            </div>
        </div>
    </div>
	</form>
</body>
</html>