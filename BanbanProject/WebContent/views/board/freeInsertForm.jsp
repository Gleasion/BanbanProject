<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반:반-하다</title>
<link href="../css/css.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div style="text-align: center;">
		<a href="/Index.jsp"> <img id="mainlogo"
			src="<%=request.getContextPath()%>/views/donation/임지.png"
			alt="mainlogo">
		</a>
	</div>
	<form action="freeInsert.do" id="test" method="post"enctype="multipart/form-data">
		<div class="board_wrap">
			<div class="board_title">
				<strong>자유게시판</strong>
				<p>자유로운 게시글을 남길 수 있는 공간입니다.</p>
			</div>
			<div class="board_write_wrap">
				<div class="board_write">
					<div class="title">
						<dl>
							<dt>카테고리</dt>
							<dd>
								<select name="bdCateNo">
									<option value="500">자유</option>
									<option value="100">공지사항</option>
									<option value="200">진료문의</option>
									<option value="300">리뷰</option>
									<option value="400">나눔</option>
									<option value="600">홍보</option>
								</select>
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>제목</dt>
							<dd>
								<input type="text" placeholder="제목 입력" name="bdTitle">
							</dd>
						</dl>
					</div>
					<div class="cont">
						<textarea placeholder="내용 입력" name="bdCont"></textarea>
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
				</div>
				<div class="bt_wrap">
					<a class="test" type="submit" class="on"
						onclick="document.getElementById('test').submit();">등록</a> <a
						href="freeList.do">취소</a>
				</div>
			</div>
		</div>
	</form>
</body>
</html>