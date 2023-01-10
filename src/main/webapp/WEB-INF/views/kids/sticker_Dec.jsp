<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/kids/sticker.css">
</head>
<body>
	<c:forEach items="${Date }" var="date">
		<c:out value="${date }"></c:out>
	</c:forEach>
	<div class="santa_img" id="month">
        <img id="santa" src="/resources/image/kids/img6.png">
    </div>
    <div class="sticker">
        <div class="num" id="day1" value="1">1</div>
        <div class="num" id="day2" value="2">2</div>
        <div class="num" id="day3" value="3">3</div>
        <div class="num" id="day4" value="4">4</div>
        <div class="num" id="day5" value="5">5</div>
        <div class="num" id="day6" value="6">6</div>
        <div class="num" id="day7" value="7">7</div>
        <div class="num" id="day8" value="8">8</div>
        <div class="num" id="day9" value="9">9</div>
        <div class="num" id="day10" value="10">10</div>
        <div class="num" id="day11" value="11">11</div>
        <div class="num" id="day12" value="12">12</div>
        <div class="num" id="day13" value="13">13</div>
        <div class="num" id="day14" value="14">14</div>
        <div class="num" id="day15" value="15">15</div>
        <div class="num" id="day16" value="16">16</div>
        <div class="num" id="day17" value="17">17</div>
        <div class="num" id="day18" value="18">18</div>
        <div class="num" id="day19" value="19">19</div>
        <div class="num" id="day20" value="20">20</div>
        <div class="num" id="day21" value="21">21</div>
        <div class="num" id="day22" value="22">22</div>
        <div class="num" id="day23" value="23">23</div>
        <div class="num" id="day24" value="24">24</div>
        <div class="num" id="day25" value="25">25</div>
        <div class="num" id="day26" value="26">26</div>
        <div class="num" id="day27" value="27">27</div>
        <div class="num" id="day28" value="28">28</div>
        <div class="num" id="day29" value="29">29</div>
        <div class="num" id="day30" value="30">30</div>
        <div class="num" id="day31" value="31">31</div>
    </div>
</body>
</html>