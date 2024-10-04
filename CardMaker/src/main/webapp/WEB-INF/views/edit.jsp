<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>CardMaker| 수정하기</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/default.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/card.css">
<style>
.tempimg {
	width: 90%;
	height: 300px;
	background-color: #222222;
	display: flex;
	border-radius: 10px;
	justify-content: center;
	align-items: center;
	overflow: hidden;
	margin-bottom: 20px;
}

.tempimg img {
	max-width: 100%;
	max-height: 100%;
	width: auto;
	height: auto;
}

.ti2{
	background-color: white;
	color: #000000;
}
#filename::placeholder{
	color: #ffffff;
}
input:not(#filename),textarea:focus {
    outline: none;
    box-shadow: inset 0px 0px 7px #d8f39e;
}
</style>
</head>
	<%@ include file="header.jsp"%>
<body>
	<div class="bg">
		<form id="editForm"
			action="${pageContext.request.contextPath}/card/update" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="id" value="${card.id}">
			<div style="margin: 0 auto;">
				<div class="detitle">
					✅ <span style="color: var(--main-color);">${card.title}</span> <small>수정하기</small>
					<div class="hr2"></div>
				</div>
				<div class="card-detail blink" style="width: 70vh;">
					<div id="tempimg">
						<img src="${pageContext.request.contextPath}${card.imagePath}"
							alt="${card.title}">
					</div>
					<div class="hline2"></div>
				<div class="script">
				
					<div class="t">
						<span class="ti">제목</span> <input class="ti2" name="title"
							id="title" value="${card.title}">
					</div>
					<div class="t">
						<span class="ti">설명</span> <textarea class="ti2" name="content"
							id="content" value="${card.content}">${card.content}</textarea>
					</div>
					<div class="t">
						<span class="ti">작성자</span> <input class="ti2" name="writer"
							id="writer" value="${card.writer}">
					</div>
					<div class="t">
						<span class="ti">이미지</span> 
						<input type="text" id="filename" class="ti2" style="color:#ffffff;" placeholder="👉 클릭해서 파일 선택" readonly>
							<input type="file" id="file" name="file" hidden>
					</div>
						</div>
					<div class="actions">
						<button type="button" class="subbnt2"
							onclick="window.location.href='${pageContext.request.contextPath}/card/detail?id=${card.id}'">
							Cancel</button>
						<input type="hidden" name="id" value="${card.id}">
						<button type="submit" class="subbnt">Update</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<script>
		document.getElementById('filename').addEventListener('click',
				function() {
					document.getElementById('file').click();
				});

		document
				.getElementById('file')
				.addEventListener(
						'change',
						function(event) {
							const fileInput = event.target;
							const file = fileInput.files[0];
							if (file) {
								const fileName = file.name;
								document.getElementById('filename').value = fileName;

								const reader = new FileReader();
								reader.onload = function(e) {
									const img = document.createElement('img');
									img.src = e.target.result;
									img.alt = fileName;

									const tempimgDiv = document
											.getElementById('tempimg');
									tempimgDiv.innerHTML = '';
									tempimgDiv.appendChild(img);
								};

								reader.readAsDataURL(file);
							} else {
								document.getElementById('filename').value = '👉 클릭해서 파일 선택';
								document.getElementById('tempimg').innerHTML = '';
							}
						});
		document.getElementById('editForm').addEventListener(
						'submit',
						function(e) {
							const fileInput = document.getElementById('file');
							const titleInput = document.getElementById('title');
							const contentInput = document
									.getElementById('content');
							const writerInput = document
									.getElementById('writer');

							if (!fileInput.value
									&& !document.getElementById('tempimg').children.length) {
								alert('이미지를 선택해주세요.');
								e.preventDefault();
								return;
							}

							if (titleInput.value.trim() === '') {
								alert('이름을 입력해주세요.');
								titleInput.focus();
								e.preventDefault();
								return;
							}

							if (contentInput.value.trim() === '') {
								alert('설명을 입력해주세요.');
								contentInput.focus();
								e.preventDefault();
								return;
							}
							if (writerInput.value.trim() === '') {
								alert('작성자를 입력해주세요.');
								writerInput.focus();
								e.preventDefault();
								return;
							}
						});
		 document.addEventListener('DOMContentLoaded', (event) => {
	            const textarea = document.getElementById('autoResizeTextarea');

	            textarea.addEventListener('input', () => {
	                textarea.style.height = 'auto'; // 높이를 자동 조정
	                textarea.style.height = textarea.scrollHeight + 'px'; // scrollHeight에 맞춰 높이 설정
	            });

	            // 초기 로드 시 높이 조정
	            textarea.style.height = 'auto';
	            textarea.style.height = textarea.scrollHeight + 'px';
	        });
	
	</script>
</body>
</html>