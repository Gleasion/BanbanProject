<%@page import="kr.or.ddit.board.vo.AnswerVO"%>
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
	List<AnswerVO> answerList = (List<AnswerVO>) request.getAttribute("answerList");
	AnswerVO av = (AnswerVO) request.getAttribute("av");
	
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
			<strong>간단 진료 문의</strong>
			<p>간단한 진료 문의를 남길 수 있는 공간입니다.</p>
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
							<a href="./boardReportInsert.do?bdNo=<%=bv.getBdNo() %>&memId=<%=bv.getMemId()%>" id="bt_but" style="font-style: oblique; color: crimson;">신고하기</a>
						</dt>
					</dl>
				</div>
				<div class="cont" id="board_cont" id="board_cont" style="text-align:center;"><p><%=bv.getBdCont()%></p>
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
				<a href="./askUpdate.do?bdNo=<%=bv.getBdNo()%>">게시글 수정</a> 
				<a href="./askDelete.do?bdNo=<%=bv.getBdNo()%>">게시글 삭제</a>
		 	</div>
<%
	}
%>
		</div>
	</div>


<!-- 질문 답변 출력 -->
	<div class="board_wrap">
		<div class="board_title" >
			<strong id="answer">병원 답변</strong>
			<p id="answer">문의에 대한 답변 확인 가능합니다.</p>
		</div>
		<input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>">
<%
	int asSize = answerList.size();
		if(asSize == 0) {

		}else{
			int i = 1;
			for(AnswerVO aList : answerList){
%>
		<div class="board_view_wrap">
			<div class="board_view">
				<div class="title"><%=i++ %>. RE: <%=aList.getHospNm()%>에서 답변드립니다.</div>
				<div class="info">
					<dl>
						<dt>병원명</dt>
							<dd>
								<button onclick="window.open('/insertMsg.do?memId=<%=aList.getHospCd()%>',
								'_blank', 'toolbar=no, location=no, status=no, scrollbars=auto, width=800, height=600, top=10, left=10')"
								class="item" style="background-color: #ffffff; border: none;">
								<%=aList.getHospNm()%>
                  				</button>
                  		</dd>
					</dl>
					<%
						SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
					%>

					<dl>
						<dt>작성일</dt>
						<dd><%=sdf1.format(aList.getBdReg())%></dd>
					</dl>
					<dl>
					<dd class="bt_wrap" id="answer_but">
<%
	if(memId != null && memId.equals(aList.getHospCd())){
%>
				<a href="./answerUpdate.do?bdAnswerNo=<%=aList.getBdAnswerNo()%>&bdNo=<%=bv.getBdNo() %>">답변 수정</a>
				<a href="./answerDelete.do?bdAnswerNo=<%=aList.getBdAnswerNo()%>&bdNo=<%=bv.getBdNo() %>">답변 삭제</a>
<%
	}
%>
					</dd>
					</dl>
				</div>
				<div class="cont" id="board_cont" style="text-align:center; margin-bottom: 30px;""><p><%=aList.getBdCont()%></p>
				</div>
			</div>				
			

		
<%
			}
		}
%>
	</div>
	
</div>

<!-- 병원만 보이는 기능, 답변 입력 가능 -->
<%
	if (memId != null && memId.startsWith("hosp")){
		
%>
<form action="answerInsert.do"  id="test" method="post" enctype="multipart/form-data">
		<div class="board_wrap">
        <div class="board_title">
           	<strong>답변 등록</strong>
           	<p>답변을 작성 할 수 있습니다.</p>
        </div>
        <input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>">
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="cont">
                    <textarea placeholder="답변 입력" name="bdCont"></textarea>
                </div>
            </div>
            <div class="bt_wrap">
                <a class="test" type="submit" class="on" onclick="document.getElementById('test').submit();" >답변등록</a>
            </div>
        </div>
    </div>
	</form>
<%
	}
%>

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