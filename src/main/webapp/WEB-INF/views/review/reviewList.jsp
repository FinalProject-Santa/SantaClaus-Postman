<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>reviewList</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
		
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" 
		integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" 
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" 
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<!--<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/theme.css" />	
	-->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poor+Story&display=swap" rel="stylesheet">
	
	<style>
		* {
			font-family: 'Poor Story', cursive !important;
		}
		

	</style>
	
</head>
<body>

	<jsp:include page="" />
	
	<div class="container-fluid" >

        <!-- Page Heading 
        <h1 class="h3 mb-2 text-gray-800">Tables</h1>
        <p class="mb-4">
            DataTables is a third party plugin that is used to generate the demo table below.
            For more information about DataTables, please visit the 
            <a target="_blank" href="https://datatables.net">official DataTables documentation</a>.
        </p>
        -->

        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h4 class="">후기 목록</h4>

                        <div class="row">
                            <div class="col-sm-12">
                                <table class="table table-bordered dataTable" id="dataTable" width="100%"
                                    cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                                    <thead>
                                        <tr role="row" style="text-align: center;">                                            
                                            <th>게시판 번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>별점</th>
                                            <th>조회수</th>
                                            <th>작성일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    	<c:forEach items="${reviewlist }" var="review">
                                    		<tr onclick="location.href='/review/reviewDetail/${review.review_no}'">
                                    			<td style="text-align: center;"><c:out value="${review.review_no }" /></td>
                                    			<td>
                                    					<c:out value="${review.review_title }" />
                                    			</td>
                                          <td style="text-align: center;"><c:out value="${review.user_id}" /></td> 
                                          <td style="text-align: center;"><small class="text-muted ${review.review_best}"></small></td> 
                                    	  <td style="text-align: center;"><c:out value="${review.review_count }" /></td> 
                                          <td style="text-align: center;"><fmt:formatDate pattern="yyyy-MM-dd" value="${review.review_date }"/></td>
                                    			                                   			
                                    		</tr>
                                    	</c:forEach>                                                                       
                                    </tbody>
                                    		<tr>
			<td colspan="4" align="right">
				<input type="button" value="글작성"
				onclick="location.href='/review/reviewinsertform'">
			</td>
		</tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="col-sm-12 col-md-7">
                                <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
                                    <ul class="pagination">
                                        
                                        <c:if test="${pageMaker.prev }">
                                        	<li class="pagination_button page-item previous">
                                        		<a href="${pageMaker.startpage - 1 }" class="page-link">&lt;</a>
                                        	</li>                                        	
                                        </c:if>
                                        
                                        <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
                                        	<li class="pagination_button page-item ${pageMaker.det.pageNum == num ? 'active' : '' }">
                                        		<a href="${num }" class="page-link"></a>
                                        	</li>
                                        </c:forEach>
                                        
                                        <c:if test="${pageMaker.next }">
                                        	<li class="pagination_button page-item next">
                                        		<a href="${pageMaker.startpage + 1 }" class="page-link">&gt;</a>
                                        	</li>                                        	
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            
                            
                            
                            <!--<%--
                           		페이징을 위한 처리
                            --%>-->
                            <form id="actionForm" action="/myhome4/board/list" method="get">
                            	<input type="hidden" name="pageNum" value="${pageMaker.det.pageNum }" />
                            	<input type="hidden" name="keyword" value="${pageMaker.det.keyword }" />  
                            	<input type="hidden" name="order" value="${pageMaker.det.order }" />                        
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
  
    <script>
    $(".1").html("&#9733; &#9734; &#9734; &#9734; &#9734;");
    $(".2").html("&#9733; &#9733; &#9734; &#9734; &#9734;");
    $(".3").html("&#9733; &#9733; &#9733; &#9734; &#9734;");
    $(".4").html("&#9733; &#9733; &#9733; &#9733; &#9734;");
    $(".5").html("&#9733; &#9733; &#9733; &#9733; &#9733;"); 
  
  
    	$(document).ready(function () {
    		
    		var actionForm = $("#actionForm");
    		
    		$("li.pagination_button > a").on("click", function (e) {
    			e.preventDefault();
    			
    			console.log("paging a tag click");
    			
    			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    			
    			actionForm.submit();
    		});
    		
    		
    		
    		// 게시글의 제목 클릭 시 이동 이벤트 추가
    		$("a.move").on("click", function (e) {
    			e.preventDefault();
    			actionForm.append("<input type='hidden' name='num' value='" + $(this).attr("href") + "' />");    			
    			
    			actionForm.attr("action", "/myhome4/board/view");
    			actionForm.submit();
    		});  
    		
    		$("button#keywordBtn").on("click", function (e) {
    			let keyword = $("input#keyword").val();
    			
    			if (keyword == "") {
    				alert("검색어를 입력하세요.");
    				return;
    			}
    			
    			actionForm.find("input[name='keyword']").val(keyword);
    			actionForm.find("input[name='pageNum']").val("1");
    			
    			actionForm.submit();
    		});
    		
    		$("input#keyword").on("keyup", function (e) {
    			if (e.keyCode == 13) {
    				$("button#keywordBtn").trigger("click");
    			}
    		})
    		
    		$("button#resetListBtn").on("click", function (e) {
    			location.href = "/myhome4/board/list";
    		});
    		
    		$("select#order").on("change", function (e) {
    			actionForm.find("input[name='order']").val($(this).val());
    			actionForm.find("input[name='pageNum']").val("1");
    			
    			actionForm.submit();
    		});		
    	});
    </script>
	
</body>
</html>