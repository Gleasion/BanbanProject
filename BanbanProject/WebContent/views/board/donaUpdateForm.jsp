<%@page import="kr.or.ddit.board.vo.AtchFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	BoardVO bv = (BoardVO) request.getAttribute("bv");
	List<AtchFileVO> atchFileList = (List<AtchFileVO>) request.getAttribute("atchFileList");
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
	<form action="donaUpdate.do?bdNo=<%=bv.getBdNo()%>" id="test" method="post"  enctype="multipart/form-data">
		<input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>">
		<input type="hidden" name="bafId" value="<%=bv.getBafId()%>">
		<div class="board_wrap">
			<div class="board_title">
			<strong>나눔게시판</strong>
			<p>반려동물의 물건을 나눔할 수 있는 공간입니다.</p>
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
                	<br><br>
                    <dl>
                        <dt>기존첨부파일</dt>
                        	<dd>
<%
	if(atchFileList != null){
		for(AtchFileVO fileVO : atchFileList){
%>
								<a href="<%=request.getContextPath() %>/board/download.do?bafId=<%=fileVO.getBafId()%>&bafdNo=<%=fileVO.getBafdNo()%>" id="img_download"><%=fileVO.getBafdOrinm() %></a>
								

<%
		}
	}
%>
                    </dl>
                    </div>
				<div class="file">
                	<br><br>
                    <dl>
                        <dt>첨부파일</dt>
                        <dd>
                        	<input type="file" name="atchFile" placeholder="첨부파일" multiple="multiple">
                        </dd>
                    </dl>
                </div>
				<div class="bt_wrap">
                	<a class="test" type="submit" class="on" onclick="document.getElementById('test').submit();" >게시글 수정</a>
                	<a href="donaList.do">취소</a>
            	</div>
			</div>
		</div>
	</form>
</body>
</html>