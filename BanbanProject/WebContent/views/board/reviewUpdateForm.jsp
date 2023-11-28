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

<link href="https://cdn.jsdelivr.net/npm/daisyui@3.2.1/dist/full.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>

<body>
<div style="margin-top: 50px;">
    <a href="/Index.jsp">
        <img style="margin: 0 auto;" id="mainlogo" src="<%= request.getContextPath() %>/views/donation/임지.png" alt="mainlogo">
    </a>
</div>
	<form action="reviewUpdate.do" id="test" method="post">
		<input type="hidden" name="bdNo" value="<%=bv.getBdNo()%>">
		<input type="hidden" name="bafId" value="<%=bv.getBafId()%>">
		<div class="board_wrap">
			<div class="board_title">
			<strong>병원리뷰</strong>
			<p>병원 리뷰를 남길 수 있는 공간입니다.</p>
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
							
							<dt style="margin-bottom: 20px; width: 50px;">별점</dt>
                        <div style="margin: 10px 0 0 50px;" class="rating rating-lg rating-half">
                        
                        <%
							switch (bv.getBdRating()) {
							case "1" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "2" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "3" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "4" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "5" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "6" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "7" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "8" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "9" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 checked/> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 />
						</div>
						<%
							break;
						case "10" :
						%>
						<div class="rating rating-md rating-half">
							<input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="1"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"
								 /> <input type="radio" name="bdRating"
								class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"
								 checked/>
						</div>
						<%
							break;
						}
						%>
						  
						</div>
							
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
                        	<input style="font-size: initial;" type="file" name="atchFile" placeholder="첨부파일" multiple="multiple">
                        </dd>
                    </dl>
                </div>
				<div class="bt_wrap">
                	<a class="test" type="submit" class="on" onclick="document.getElementById('test').submit();" >수정</a>
                	<a href="noticeList.do">취소</a>
            	</div>
			</div>
		</div>
	</form>
</body>
</html>