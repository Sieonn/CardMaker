<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CardMaker|생성하기</title>
    <link href="mycss.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" type="text/css"
        href="${pageContext.request.contextPath}/css/card.css">
    <style>
        /* 스타일 설정 */
        .fileupload {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 380px;
            padding: 20px;
            padding-top: 40px;
            background-color: #222222;
            box-shadow: 0px 0px 10px rgba(255, 255, 254, 0.1);
            border-radius: 10px;
        }

        .tempimg {
            width: 300px;
            height: 350px;
            background-color: #313131;
            display: flex;
            border-radius: 10px;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            margin-bottom: 15px;
            cursor: pointer;
            padding: 10px;
        }

        .tempimg img {
            max-width: 100%;
            max-height: 100%;
            width: auto;
            height: auto;
        }

        .selfile {
            display: flex;
            text-align: center;
            align-items: center;
        }

        #file {
            display: none;
        }

        .subbnt {
            width: 100%;
            background: none;
            border: 2px solid var(--main-color);
            color: var(--main-color);
            border-radius: 5px;
            font-size: 18px;
            margin-top: 20px;
            font-weight: 900;
            transition: 0.8s;
        }

        .subbnt:hover {
            box-shadow: inset 0 3.25em 0 0 var(--main-color);
            color: black;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        a:visited {
            color: black;
            text-decoration: none;
        }

        input,
        textarea:focus {
            box-shadow: none;
        }

        .card-detail {
            width: 90%;
            margin: 0;
            margin-bottom: 0px;
            padding: 0px;
            border: none;
            border-radius: 8px;
            box-shadow: none;
            text-align: center;
            background-color: inherit;
        }

        .ti2 {
            background-color: white;
            color: #000000;
        }

        textarea {
            min-height: 230px;
        }
    </style>

</head>

<body>

    <%@ include file="header.jsp" %>
    <div class="bg">
        <div style="margin: auto;">
            <div style="font-weight: 900; font-size:32px;margin-bottom: 30px; text-align: center;"><span style="color: var(--main-color); font-weight:900; font-size:40px;">🃏나만의 카드</span> 만드는 중</div>
            <form id="uploadForm" action="/card/save" method="post" enctype="multipart/form-data">
                <!-- 숨겨진 입력 필드에 id 값을 추가 -->
                <input type="hidden" name="id" value="${card.id != null ? card.id : ''}">
                <div style="display: grid;">
                    <div style="display: flex; gap: 15px;">
                        <div class="fileupload">
                            <div class="tempimg" id="tempimg">
                                <img src="${pageContext.request.contextPath}/image/plus.png" style="width:30%;">
                            </div>
                            <div class="selfile">
                                <input type="text" id="filename" placeholder="👉 클릭해서 파일 선택" readonly>
                                <input type="file" name="file" id="file">
                            </div>
                        </div>

                        <div class="fileupload" style="display: flex; justify-content: center; flex: 1;">
                            <div class="card-detail">

                                <div class="t">
                                    <span class="ti">제목</span>
                                    <input type="text" name="title" class="ti2" id="title">
                                </div>
                                <div class="t">
                                    <span class="ti">설명</span>
                                    <textarea name="content" style="background-color: #fefefe;" id="content"
                                        class="ti2"></textarea>
                                </div>
                                <div class="t">
                                    <span class="ti">작성자</span>

                                    <input type="text" id="writer" name="writer" class="ti2"
                                        value="<%=request.getParameter("writer") != null ? request.getParameter("writer") : "" %>"
                                        style="background-color: #222222; color: var(--main-color); border: 0.5px solid rgb(189, 189, 189, 46%);">

                                </div>

                                <div>
                                    <input type="submit" value="Finish" class="subbnt">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        document.getElementById('filename').addEventListener('click', function () {
            document.getElementById('file').click();
        });
        document.getElementById('tempimg').addEventListener('click', function () {
            document.getElementById('file').click();
        });

        document.getElementById('file').addEventListener('change', function (event) {
            const fileInput = event.target;
            const file = fileInput.files[0];
            if (file) {
                const fileName = file.name;
                document.getElementById('filename').value = fileName;

                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.alt = fileName;

                    const tempimgDiv = document.getElementById('tempimg');
                    tempimgDiv.innerHTML = '';
                    tempimgDiv.appendChild(img);
                };

                reader.readAsDataURL(file);
            } else {
                document.getElementById('filename').value = '👉 클릭해서 파일 선택';
                document.getElementById('tempimg').innerHTML = '';
            }
        });

        document.getElementById('uploadForm').addEventListener('submit', function (e) {
            const fileInput = document.getElementById('file');
            const titleInput = document.getElementById('title');
            const contentInput = document.getElementById('content');
            const writerInput = document.getElementById('writer');

            if (!fileInput.value) {
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
        // 작성자 필드의 readonly 속성을 설정/해제하는 함수
        function setWriterReadonly(isReadonly) {
            const writerInput = document.getElementById('writer');
            if (isReadonly) {
                writerInput.setAttribute('readonly', 'readonly');
            } else {
                writerInput.removeAttribute('readonly');
            }
        }

        // 페이지 로드 시 또는 특정 조건에서 작성자 필드를 readonly로 설정
        window.addEventListener('DOMContentLoaded', function () {
            const writerValue = document.getElementById('writer').value.trim();
            if (writerValue) {
                setWriterReadonly(true);
            } else {
                setWriterReadonly(false);
            }
        });
    </script>
</body>

</html>
