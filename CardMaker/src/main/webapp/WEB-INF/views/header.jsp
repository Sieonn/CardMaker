<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: "Pretendard-Regular", sans-serif;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
          	margin:0 15%;
            background-color: #000; /* Optional: Add background color for better visibility */
        }

        .logo {
            animation: float 2s ease-in-out infinite;
            display: flex;
            align-items: center;
      
        }

        @keyframes float {
            0% { transform: translateY(5px); }
            50% { transform: translateY(1px); }
            100% { transform: translateY(5px); }
        }

        .logo img:hover {
            transform: scale(1.04);
        }

        .appName {
            font-size: 16px;
            font-weight: 900;
            color: var(--main-color);
          margin-bottom:5px
            
        }

        .home-container {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            margin-right: 4%;
        }

        .home, .grid {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 50px;
            height: 50px;
        }

        .home img, .grid img {
            width: 50px;
        }

        .home img:hover, .grid img:hover {
            transform: scale(1.03);
        }

        .gridcon {
            display: flex;
            justify-content: flex-end;
        }

        hr {
            margin: 0;
            border: 1px solid #333;
        }
    </style>
</head>

<body>
    <div class="header">
        <a href="${pageContext.request.contextPath}/">
            <div class="logo">
                <img src="${pageContext.request.contextPath}/image/thmb2.png" style="width: 60px;">
            </div>
                <div class="appName">CardMaker</div>
        </a>
        <div class="home-container">
            <a href="${pageContext.request.contextPath}/">
                <div class="home">
                    <img src="${pageContext.request.contextPath}/image/home.png">
                </div>
            </a>
        </div>
        <div class="gridcon">
            <a href="${pageContext.request.contextPath}/card/list">
                <div class="grid">
                    <img src="${pageContext.request.contextPath}/image/grid.png">
                </div>
            </a>
        </div>
    </div>
    <hr>
</body>

</html>
