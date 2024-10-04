<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CardMaker|상세보기</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/card.css">
<style>
.subbnt2 img {
	width: 14px;
}

.subbnt2:hover img {
	background-color: rgb(234, 100, 42);
	content: url("${pageContext.request.contextPath}/image/delete2.png"); /* 변경할 이미지 경로 */
}
</style>
</head>
<%@ include file="header.jsp" %>
<body>
	<div class="bg">
	<div style="margin: 0 auto;">
		<div class="detitle">✅ <span style="color: var(--main-color);">${card.title}</span> <small>자세히 보기</small>	<div class="hr2"></div></div>
		<div class="card-detail blink" style="width:70vh;">
			<img src="${pageContext.request.contextPath}${card.imagePath}" alt="${card.title}">
			<span style="color: var(--main-color)">
				<h3>${card.title}</h3>	
				<hr>
			</span>
		<div class="script">
	
			<div class="t">
				<span class="ti">설명</span> <span class="ti2">${card.content}</span>
			</div>

			<div class="t">
				<span class="ti">작성자</span> <span class="ti2">${card.writer}</span>
			</div>
	</div>
			<div class="actions">
				<button class="subbnt" onclick="window.location.href='${pageContext.request.contextPath}/card/edit?id=${card.id}'">
					Edit
				</button>
				<form action="${pageContext.request.contextPath}/card/delete?id=${card.id}" method="post">
					<input type="hidden" name="id" value="${card.id}">
					<button type="submit" class="subbnt2">
						<img src="${pageContext.request.contextPath}/image/delete.png" style="width: 14px;"> Delete
					</button>
				</form>
			</div>
			<div class="footer"></div>
		</div>
		</div>
	</div>
</body>
</html>

