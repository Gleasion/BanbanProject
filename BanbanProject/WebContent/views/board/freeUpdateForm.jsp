<%@page import="kr.or.ddit.board.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	BoardVO bv = (BoardVO) request.getAttribute("bv");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");

%>
<html>
<head>
<meta charset="UTF-8">
<title>반:반-하다</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div style="text-align: center;">
		<a href="/Index.jsp"> <img id="mainlogo"
			src="<%= request.getContextPath() %>/views/donation/임지.png"
			alt="mainlogo">
		</a>
	</div>
	<form action="freeUpdate.do" id="test" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>"> <input
			type="hidden" name="bafId" value="<%=bv.getBafId()%>">
		<div class="board_wrap">
			<div class="board_title">
				<strong>자유게시판</strong>
				<p>자유로운 게시글을 남길 수 있는 공간입니다.</p>
			</div>
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" placeholder="제목 입력" name="bdTitle"
									value="<%=bv.getBdTitle()%>">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea placeholder="내용 입력" name="bdCont"><%=bv.getBdCont()%></textarea>
					</div>
					<div class="file">
						<br>
						<br>
						<dl>
							<dt>기존첨부파일</dt>
							<dd>
								<%
								if (atchFileList != null) {
									for (AtchFileVO fileVO : atchFileList) {
								%>
								<a
									href="<%=request.getContextPath()%>/board/download.do?bafId=<%=fileVO.getBafId()%>&bafdNo=<%=fileVO.getBafdNo()%>"
									id="img_download"><%=fileVO.getBafdOrinm()%></a>


								<%
								}
								}
								%>
							
						</dl>
					</div>
					<div class="file">
						<br>
						<br>
						<dl>
							<dt>첨부파일</dt>
							<dd>
								<input type="file" name="atchFile" placeholder="첨부파일"
									multiple="multiple">
							</dd>
						</dl>
					</div>
					<div class="bt_wrap">
						<a class="test" type="submit" class="on"
							onclick="document.getElementById('test').submit();">게시글 수정</a>
						<a href="freeList.do">취소</a>
					</div>
				</div>
			</div>
	</form>
</body>
</html>