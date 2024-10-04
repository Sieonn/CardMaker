<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CardMaker| 목록</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/default.css">
<style type="text/css">
.gallery {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: flex-start;
	max-width: 1000px;
	margin: auto;
}

.card {
	width: calc(33.33% - 20px);
	height: 350px;
	position: relative;
	transition: transform 0.1s;
	transform-style: preserve-3d;
	overflow: hidden;
	box-shadow: 0 0 15px 3px rgba(0, 0, 0, 0.4);
	border-radius: 10px;
}

.blink:hover {
	animation: blinking 2s alternate infinite;
}

@keyframes blinking {
	from { box-shadow:0 0 15px 7px #c5ffb0; }
	50% { box-shadow:0 0 5px var(--main-color); }
	to { box-shadow: 0 0 7px 5px #dcf8d2; }
	from { box-shadow: 0 0 7px 10px #b2fd96; }
}

.card img {
	width: 100%;
	height: 100%;
	object-fit: cover;
	border-radius: 4px;
	pointer-events: none;
	box-shadow: 0 0 15px 3px rgba(0, 0, 0, 0.4);
}


.cardimg {
	width: 100%;
	height: 100%;
	overflow: hidden;
}

.shine {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 60%);
	pointer-events: none;
	transition: background 0.3s;
}

.card:hover .shine {
	background: radial-gradient(circle, rgba(255, 255, 255, 0.2) 0%, transparent 60%);
}

.addB img {
	transition: transform 0.5s ease;
}

.addB img:hover {
	transform: rotateZ(180deg);	
}

.hr2 {
	border-bottom: 2px solid var(--main-color);
	width: 30%;
	height: 0.7px;
	margin: 0 auto; /* Center alignment */
	margin-top:5px;
}
</style>
</head>

<body>
<%@ include file="header.jsp" %>
	<div class="bg">
		<div style="margin: auto; text-align:center; justify-content: center;">
			<div style="font-weight: 900; font-size: 32px; margin: 30px 0 10px 0;">
				<span style="font-weight: 900; letter-spacing: 10px;">목록보기</span>
				<div class="hr2"></div>
			</div>
			<div class="addB" style="margin-left:900px; color: #ffffff;">
				<a href="/card/form?writer=${card.writer}"><img src="${pageContext.request.contextPath}/image/plus.png" style="width:40px"></a>
				<div style="font-size:12px;">추가</div>
			</div>
			<div class="gallery">
				<c:forEach items="${cards}" var="card">
					<div class="card blink">
						<a href="${pageContext.request.contextPath}/card/detail?id=${card.id}">
							<div class="cardimg">
								<img src="${pageContext.request.contextPath}${card.imagePath}" alt="${card.title}">
							</div>
							<div class="shine"></div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<footer></footer>
	</div>
	<script src="${pageContext.request.contextPath}/css/effect2.js"></script>
</body>
</html>
