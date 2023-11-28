<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.CommentVO"%>
<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	BoardVO bv = (BoardVO) request.getAttribute("bv");
	List<CommentVO> cmList = (List<CommentVO>) request.getAttribute("cmList");
	

	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
	
	bv.getBdCateNo();
%>
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<title>반:반-하다</title>
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
</head>
<body>
	<div class="board_wrap">
		<div class="board_title">
			<strong>신고게시글 확인</strong>
				<input type="hidden" name="bvNo" value="<%=bv.getBdNo()%>"></dd>
				<input type="hidden" name="bdCateNo" value="<%=bv.getBdCateNo()%>"></dd>
			<p>신고게시글을 확인해주세요</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title"><%=bv.getBdTitle()%></div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
						<dd>
							<div class="dropdown">
								<button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">
									<%=bv.getMemId()%> <span class="caret"></span>
								</button>
								<ul class="dropdown-menu">
									<li><a href="./insertBlackList.do?memId=<%=bv.getMemId()%>">블랙리스트 추가</a></li>
									<li><a href="../insertMsg.do?memId<%=bv.getMemId()%>">쪽지보내기</a></li>
								</ul>
							</div>
						</dd>
					</dl>
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					%>
					<dl>
						<dt>작성일</dt>
						<dd><%=sdf.format(bv.getBdReg())%></dd>
					</dl>
					<dl>
						<dt>조회수</dt>
						<dd><%=bv.getBdHits()%></dd>
					</dl>
					<dl>
						<dt>신고누적수</dt>
						<dd><%=bv.getBdRepCnt()%></dd>
					</dl>
					<dl>
						<dt>첨부파일</dt>
						<dd><%=bv.getBafId()%></dd>
					</dl>
				</div>
				<div class="cont"><%=bv.getBdCont()%></div>
			</div>
			<div class="bt_wrap">
				<a href="./blackListCheck.do" class="on">목록</a> 
				<a href="./deleteNotice.do?bdNo=<%=bv.getBdNo()%>&bdCateNo=<%=bv.getBdCateNo()%>">게시글 삭제</a>
			</div>
		</div>
	</div>

	<!-- 여기부터 댓글 리스트-->
	<div class="board_wrap">
		<div class="board_title" id="t_span">
			<br>
			<span>댓글</span>
		</div>

		<%
			int cmSize = cmList.size();
			if (cmSize == 0) {

			} else {
				for (CommentVO cv : cmList) {
		%>
		<div class="board_view_wrap">
			<dl>
				<dd type="hidden" name="bdCateNo" value="<%=cv.getBdComNo()%>"></dd>
				<dd type="hidden" name="bdNo" value="<%=cv.getBdNo()%>"></dd>
			</dl>
			<div class="board_view" id="bt_line">
				<div class="info" id="bt_right2">
					<dl>
						<dt id="fts">작성자</dt>
						<dd id="fts"><%=cv.getMemNic()%></dd>
					</dl>
					<dl>
						<dt id="fts">작성일</dt>
						<dd id="fts"><%=sdf.format(cv.getBdComReg())%></dd>
					</dl>
					<dl>
						<dt id="fts">신고누적수</dt>
						<dd id="fts"><%=cv.getBdComRepcnt()%></dd>
					</dl>
					<div class="bt_wrap" id="bt_but">
						<a
							href="./commentNoticeDelete.do?bdComNo=<%=cv.getBdComNo()%>&memId<%=bv.getMemId()%>&bdNo=<%=cv.getBdNo()%>"
							id="bt_but">댓글삭제</a>
						<!--             		<a class="test" id="bt_but" type="submit" class="on" onclick="document.getElementById('test').submit();" >댓글삭제</a> -->
						<%-- 					<input type="button" value="댓글작성" id="bt_comment"><a href="./noticeDetail.do?bdNo=<%=bv.getBdNo()%>"></a> --%>
					</div>
				</div>
				<%-- 				<div class="cont"><%=cv.getBdComCont()%></div> --%>
				<div class="cont" id="cont_padding"><%=cv.getBdComCont()%></div>
			</div>
		</div>
		<%
				}
			}
		%>
	</div>

	<!-- 여기서부터 댓글 작성 -->
	<form action="commentNoticeInsert.do" id="test" method="post">
			<div class="board_wrap">
			<div class="board_write_wrap">
				<div class="board_write" id="ct_line">
					<input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>">
					<input type="hidden" name="bdCateNo" value="<%=bv.getBdCateNo()%>">
					<input type="hidden" name="memId" value="<%=bv.getMemId()%>">
					<div class="cont">
						<textarea id="bt_cont" placeholder="댓글을 작성하세요." name="bdComCont"></textarea>
					</div>
				</div>
				<div class="bt_wrap" id="bt_button">
					<a class="test" id="bt_but2" type="submit" class="on"
						onclick="document.getElementById('test').submit();">댓글등록</a>
					<%-- 					<input type="button" value="댓글작성" id="bt_comment"><a href="./noticeDetail.do?bdNo=<%=bv.getBdNo()%>"></a> --%>
				</div>
			</div>
		</div>
	</form>

	<%
		if (msg == null || msg.equals("")) {
	%>
	<%
		} else {
	%>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
			$('.dropdown-toggle').dropdown();
		});
	</script>
	<%
		}
	%>
</body>
</html>