<%@page import="kr.or.ddit.board.vo.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반:반-하다</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/daisyui@3.2.1/dist/full.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.tailwindcss.com"></script>

</head>
<body>
<div style="margin-top: 50px;">
    <a href="/Index.jsp">
        <img style="margin: 0 auto;" id="mainlogo" src="<%= request.getContextPath() %>/views/donation/임지.png" alt="mainlogo">
    </a>
</div>

	<form action="reviewInsert.do"  id="test" method="post"  enctype="multipart/form-data">
		<div class="board_wrap">
        <div class="board_title">
			<strong>병원리뷰</strong>
			<p>병원 리뷰를 남길 수 있는 공간입니다.</p>
        </div>
        <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                        <dt>카테고리</dt>
                        <dd>
                        	<select name="bdCateNo" >
                        		<option value="300">리뷰</option>
                        		<option value="100">공지사항</option>
                        		<option value="200">진료문의</option>
                        		<option value="400">나눔</option>
                        		<option value="500">자유</option>
                        		<option value="600">홍보</option>
                        	</select>
                        </dd>
                    </dl>
                </div>
                <div class="info">
                    <dl>
                        <dt>제목</dt>
                        <dd><input type="text" placeholder="제목 입력" name="bdTitle"></dd>
                    </dl>
                    <dl>
                        <dt style="margin-bottom: 20px; width: 50px;">별점</dt>
                        <div class="rating rating-lg rating-half">
<!-- 						  <input type="radio" name="rating-10" class="rating-hidden" /> -->
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-1" value="1" checked/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-2" value="2"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-1" value="3"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-2" value="4"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-1" value="5"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-2" value="6"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-1" value="7"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-2" value="8"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-1" value="9"/>
						  <input type="radio" name="bdRating" class="bg-orange-500 mask mask-star-2 mask-half-2" value="10"/>
						</div>
                    </dl>
                </div>
                <div class="cont">
                    <textarea placeholder="내용 입력" name="bdCont"></textarea>
                </div>
                <div class="file">
                	<br><br>
                    <dl>
                        <dt>첨부파일</dt>
                        
                        <button class="btn-xl">
                        <input style="font-size: initial;" type="file" name="atchFile" placeholder="첨부파일" multiple="multiple">파일선택
                        </button>
<!--                         <dd><input type="file" name="atchFile" placeholder="첨부파일"  multiple="multiple">파일선택</dd> -->
                    </dl>
                </div>
            </div>
            <div class="bt_wrap">
                <a class="test" type="submit" class="on" onclick="document.getElementById('test').submit();" >등록</a>
                <a href="reviewInsert.do">취소</a>
            </div>
        </div>
    </div>
	</form>
</body>
</html>