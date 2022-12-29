<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/kids/puzzle_1level.css">
</head>
<body>
    <div class="wrap-all">
        <div class="puzzle_text">
            <span id="text_1">��Ÿ ���� ���߱� ����</span><br>
            <span id="text_2">���� ������ �ϼ����� �ּ���</span>
        </div>
        <ul class="image-container">
        </ul>
        <progress value="0" max="5" id="progressBar"></progress>
        <p class="game-text">����!</p>
    </div>
        <div class="button-group">
        <button class="mix-button">mix</button>
        <button class="restart-button">restart</button>
        <button class="main-button" onclick="location.href='/kids/main'">main</button>
        </div>
    <script src="/resources/js/kids/puzzle_1level.js"></script>
</body>
</html>