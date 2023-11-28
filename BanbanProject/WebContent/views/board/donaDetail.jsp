<%@page import="kr.or.ddit.board.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.CommentVO"%>
<%@page import="javax.xml.stream.events.Comment"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	BoardVO bv = (BoardVO) request.getAttribute("bv");
	List<CommentVO> cmList = (List<CommentVO>) request.getAttribute("cmList");
	String memId = (String) request.getSession().getAttribute("loginCode");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");

	
	String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반:반-하다</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<div style="text-align: center;">
    <a href="/Index.jsp">
        <img id="mainlogo" src="<%= request.getContextPath() %>/views/donation/임지.png" alt="mainlogo">
    </a>
</div>
	<div class="board_wrap">
		<div class="board_title">
			<strong>나눔게시판</strong>
			<p>반려동물의 물건을 나눔할 수 있는 공간입니다.</p>
		</div>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title"><%=bv.getBdTitle()%></div>
				<div class="info">
					<dl>
						<dt>작성자</dt>
							<dd>
								<button onclick="window.open('/insertMsg.do?memId=<%=bv.getMemId()%>',
								'_blank', 'toolbar=no, location=no, status=no, scrollbars=auto, width=800, height=600, top=10, left=10')"
								class="item" style="background-color: #ffffff; border: none;">
								<%=bv.getMemNic()%>
                  				</button>
                  		</dd>
					</dl>
					<%
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					%>
					<dl>
						<dt>작성일시</dt>
						<dd><%=sdf.format(bv.getBdReg())%></dd>
					</dl>
					<dl>
						<dt>첨부파일수</dt>
						<dd>
						<%
						if(atchFileList!=null){
							out.print(atchFileList.size());
						}else{
							out.print("0");
						}
						%>
						</dd>
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
						<dt>
							<a href="./donaReportInsert.do?bdNo=<%=bv.getBdNo() %>&memId=<%=bv.getMemId()%>" id="bt_but" style="font-style: oblique; color: crimson;">신고하기</a>
						</dt>
					</dl>
				</div>
				<div class="cont" id="board_cont" style="text-align:center;"><p><%=bv.getBdCont()%></p>
<%
	if(atchFileList != null){
		for(AtchFileVO fileVO : atchFileList){
%>					
					<img src="<%=request.getContextPath() %>/board/download.do?bafId=<%=fileVO.getBafId()%>&bafdNo=<%=fileVO.getBafdNo()%>" style="width:500px;" />
<%
		}
	}
%>
					</div>
				
<%
	if(atchFileList != null){
		for(AtchFileVO fileVO : atchFileList){
%>					
					<a href="<%=request.getContextPath() %>/board/download.do?bafId=<%=fileVO.getBafId()%>&bafdNo=<%=fileVO.getBafdNo()%>" id="img_download"><%=fileVO.getBafdOrinm() %></a>
<%
		}
	}
%>
			</div>
			<div class="bt_wrap">
				<a href="paging?bdCateNo=<%=bv.getBdCateNo() %>" class="on">목록</a>
<%
	if(memId != null && memId.equals(bv.getMemId())){
%>				
				<a href="./donaUpdate.do?bdNo=<%=bv.getBdNo()%>">게시글 수정</a> 
				<a href="./donaDelete.do?bdNo=<%=bv.getBdNo()%>">게시글 삭제</a>
<%
	}
%>
		 	</div>
		 
		</div>
	</div>

<!-- 여기부터 댓글 리스트-->
	<div class="board_wrap">
		<div class="board_title" id="t_span">
			<br><span>댓글</span>
		</div>
		
<%
	int cmSize = cmList.size();
	if(cmSize == 0) {

	}else{
		for(CommentVO cv : cmList){
%>
		<div class="board_view_wrap">
			<input type="hidden" name="bdComNo" value="<%=cv.getBdComNo()%>">
			<input type="hidden" name="bdNo" value="<%=cv.getBdNo()%>">
			<input type="hidden" name="memId" value="<%=cv.getMemId()%>">
			<div class="board_view" id="bt_line">
				<div class="info" id="bt_right2">
					<dl>
						<dt id="fts">작성자</dt>
						<dd id="fts"><%=cv.getMemNic()%></dd>
					</dl>
					<dl>
						<dt id="fts">작성일시</dt>
						<dd id="fts"><%=sdf.format(cv.getBdComReg())%></dd>
					</dl>
					<dl>
						<dt id="fts">신고누적수</dt>
						<dd id="fts"><%=cv.getBdComRepcnt()%></dd>
					</dl>
					<dl>
						<dt>
							<a href="./commentReportInsert.do?bdNo=<%=cv.getBdNo() %>&memId=<%=cv.getMemId()%>&bdComNo=<%=cv.getBdComNo()%>&bdCateNo=<%=bv.getBdCateNo() %>" id="bt_but" style="font-style: oblique; color: crimson;">신고하기</a>
						</dt>
					</dl>
<%
	if(memId != null && memId.equals(cv.getMemId())){
%>	
					<div class="bt_wrap" id="bt_but">
					<a href="./commentDelete.do?bdComNo=<%=cv.getBdComNo()%>&memId=<%=cv.getMemId()%>&bdNo=<%=cv.getBdNo()%>&bdCateNo=<%=bv.getBdCateNo() %>"  id="bt_but">댓글삭제</a>
            		</div>
<%
	}
%>
				</div>
				<div class="cont" id="cont_padding"><%=cv.getBdComCont()%></div>
			
			</div>
		
		</div>
<%
		}
	}
		
%>
	</div>
	
<!-- 여기서부터 댓글 작성 -->
	<form action="commentInsert.do?bdCateNo=<%=bv.getBdCateNo() %>" id="test" method="post">
		<div class="board_wrap">
        	<div class="board_write_wrap">
            	<div class="board_write" id="ct_line">
            	<input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>">
            	<input type="hidden" name="bdCateNo" value="<%=bv.getBdCateNo()%>">
                	<div class="cont">
                    	<textarea id="bt_cont" placeholder="댓글을 작성하세요." name="bdComCont"></textarea>
                	</div>
            	</div>
<%
	if(memId != null){
%>	
            	<div class="bt_wrap" id="bt_button">
            		<a class="test" id="bt_but2" type="submit" class="on" onclick="document.getElementById('test').submit();">댓글등록</a>
            	</div>
<%
	}
%>
        	</div>
    	</div>
	</form>
	
<%
	if(msg == null || msg.equals("")) {
		%>
		<%
	}else{
%>

<script>
	alert("<%=msg%>");
</script>
<%
	} 
%>


</body>
</html>