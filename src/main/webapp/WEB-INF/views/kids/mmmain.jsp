<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Ű�����</title>
<link rel="stylesheet" href="/resources/css/kids/mmmain.css">
</head>
<body>
	<p>������ �ϰ� ����?</p>
	<form action="/kids/sticker" method="post" id="diaryForm">
	<input type="hidden" name="user_id" id="user" value="user01">
	<input type="hidden" name="kids_no" id="kids" value=1>
    <div class="flex_container">
    <div class="kids_main" id="puzzle">
        <img src="/resources/image/kids/img1.png" id="img1" onclick="location.href='/kids/puzzle'">
        <div id="text1">
            <b>���� ���߱�</b><br>
            <span>�ų��� ���� ���߱�</span>
            </div>
    </div>
    <div class="kids_main" id="draw">
        <img src="/resources/image/kids/img2.png" id="img2" onclick="location.href='/kids/diary'">
        <div id="text2">
            <b>�׸��ϱ�</b><br>
            <span>���� �־��� ����<br>�׸����� �׷�����</span>
            </div>
    </div>
    <div class="kids_main" id="sticker">
        <input type="image" src="/resources/image/kids/img3.png" id="img3">
        <div id="text3">
            <b>Ī�� ��ƼĿ</b><br>
            <span>���� ���� Ī�� ��ƼĿ</span>
            </div>
    </div>
    <div class="kids_main" id="mail">
        <img src="/resources/image/kids/img4.png" id="img4">
        <div id="text4">
            <b>��Ÿ ������</b><br>
            <span>�� ������ ��Ÿ�Ҿƹ�����<br>���� �������?</span>
            </div>
    </div>
    </div>
    </form>
</body>
</html>