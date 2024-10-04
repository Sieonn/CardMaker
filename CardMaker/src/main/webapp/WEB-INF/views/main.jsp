<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CardMaker</title>
<link rel="stylesheet" type="text/css"
    href="${pageContext.request.contextPath}/css/default.css">
<link href="mycss.css" rel="stylesheet" type="text/css" />
<style>
.bg{
min-height: 100vh;
}
.con {
    display: inline-block;
    align-items: center;
    text-align: center;
    margin: auto;
    width: 600px;
    justify-content: center;
}

.logo {
    margin: 20px auto;
    text-align: center;
    margin-bottom: 30px;
    width: 250px;
}

.floimg {
    animation: float 2s ease-in-out infinite;
}

@keyframes float {
    0% {
        transform: translateY(0);
    }
    50% {
        transform: translateY(-10px);
    }
    100% {
        transform: translateY(0);
    }
}
.inp {
    margin: auto;
    display: grid;
    gap: 10px;
}

.inp2 {
    width: 350px;
    height: 40px;
    border-radius: 10px;
    margin: 0 auto;
    border: none;
    padding: 0 20px;
}

.inp2:focus{
    box-shadow: 0 0 10px 3px var(--main-color);
}

.bnt {    
    font-weight: 900;    
    margin: 0 auto;
    width: 390px;
    height: 50px;
    background-color: var(--main-color);
    border-radius: 30px;
    border: none;
    font-size: 18px;
    letter-spacing: 1px;
}
.bnt2 {    
    color: #ffffff;
    font-weight: 900;    
    margin: 0 auto;
    width: 390px;
    height: 50px;
    background-color: #222222;
    border-radius: 30px;
    border: none;
    font-size: 18px;
    letter-spacing: 1px;
    text-decoration: none; /* 링크 스타일 제거 */
    display: flex;
    align-items: center;
    justify-content: center;
}

input:focus {
    outline: none;
    box-shadow: inset 0px 0px 7px #d8f39e;
}

button:hover, .bnt2:hover {
    transform: scale(1.02);
    cursor: pointer;
}

a {
    text-decoration: none;
    color: inherit;
}

a:visited {
    color: black;
    text-decoration: none;
}

.logo img:hover {
    width: 250px;
    content: url("${pageContext.request.contextPath}/image/thmb2.png");
}

.inp2::placeholder {
    text-align: center;
    font-size: 16px;
    font-family: "GangwonEduSaeeum_OTFMediumA";
    letter-space: 5px;
}
.onecard{
    font-weight:900;
    font-size: 40px;
    text-align: center;
    margin-top: 10px;
    color: var(--main-color);
    letter-spacing: 2px;
}

#msg {
    color: #fff36e;
    margin: 10px 0;
    font-size: 14px;
    letter-spacing: 1px;
}

</style>

<body>
    <div class="bg">
        <div class="con">
            (👉 ͡° ͜ʖ ͡°)👉애정하는 사진을 자랑해봐⭐<br>
        <div class="onecard">Card Maker</div>
            <div class="logo">
                <img src="${pageContext.request.contextPath}/image/thmb1.png"
                    class="floimg" style="width: 250px;"> 
            </div>

            <form id="cardForm" action="${pageContext.request.contextPath}/card/form"
                method="get">
                <div id="msg"></div>
                <div class="inp">
                    <input class="inp2" type="text" id="name" name="writer"
                        placeholder="닉네임을 알려주세요." />
                    <button class="bnt" type="submit">시작하기</button>
                </div>
            </form>
            <a href="${pageContext.request.contextPath}/card/list" class="bnt2" style="color:#ffffff; margin-top: 10px;">카드 보러가기</a>
        </div>
    </div>

    <script>
        document.getElementById('cardForm').addEventListener('submit', function(e) {
            var nameInput = document.getElementById('name');
            var msgDiv = document.getElementById('msg');
            if (nameInput.value.trim() === '') {
                e.preventDefault();
                msgDiv.textContent = '👇🏻닉네임을 입력해주세요.👇🏻';
                nameInput.focus(); // input에 커서 focus하기
            }
        });
    </script>

</body>

</html>
