<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/kids/diary.css">
</head>
<body>
	<form action="/kids/insert" method="post">
	<input type="hidden">
    <div class="diary">
    <div class="drawing">
        <span id="text">���� ������ �߳���?</span>
    </div>
    <canvas id="jsCanvas" class="canvas"></canvas>
    <div class="controls">
        <div class="controls_range">
            <input type="range" id="jsRange" min="0.1" max="5.0" value="2.5" step="0.1">
        </div>
        <div class="controls_btns">
            <button id="jsMode">Fill</button>
            <button id="jsErase">Erase</button>
            <button id="jsSave">Save</button>
        </div>
        <div class="controls_colors" id="JSColors">
            <div class="controls_color jsColor" style="background-color: black;"></div>
            <div class="controls_color jsColor" style="background-color: white;"></div>
            <div class="controls_color jsColor" style="background-color: red;"></div>
            <div class="controls_color jsColor" style="background-color: orange;"></div>
            <div class="controls_color jsColor" style="background-color: yellow;"></div>
            <div class="controls_color jsColor" style="background-color: green;"></div>
            <div class="controls_color jsColor" style="background-color: blue;"></div>
            <div class="controls_color jsColor" style="background-color: navy;"></div>
            <div class="controls_color jsColor" style="background-color: purple;"></div>
        </div>
    </div>
    <div class="btn_group">
        <button id="send_btn">�ڶ��ϱ�</button>
        <button id="success_btn">�ۼ��Ϸ�</button>
    </div>
    </div>
    <div class="modal hidden">
        <div class="bg"></div>
        <div class="modalBox">
          <p id="modal_text">���� ��̴� �Ӹ�</p>
        <div class="modal_Btn">
          <button class="stickerBtn" onclick="location.href='/kids/sticker'">Ī����ƼĿ</button>
          <button class="mainBtn" onclick="location.href='/kids/main'">��������</button>
        </div>
        </div>
      </div>
      </form>
    <script src="/resources/js/kids/diary.js"></script>
</body>
</html>