<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>        

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>상품 목록조회</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
	
		function linkButtons(){
			$("a.btn.btn-primary").on("click" , function() {
				var prodNo = $(this).data('param1');
				self.location = "/purchase/addPurchase?prod_no="+prodNo;
			});	
			
			$("a.btn.btn-default").on("click" , function() {
				var prodNo = $(this).data('param1');
				self.location = "/product/getProduct?prodNo="+prodNo+"&menu=search";
			});	
		}
		
		function showInputField(){
			$('#searchKeyword').val('');
			$('#minPrice').val('');
			$('#maxPrice').val('');
			if ($("#searchCondition").val() == '1'){
				$("#priceInput").removeAttr("style").hide();
				$("#searchKeyword").parent().removeClass("invisible");
			}
			
			if ($("#searchCondition").val() == '2'){
				$("#priceInput").show();
				$("#searchKeyword").parent().addClass("invisible");
			}
		}
		
		function checkPriceInput(){
			if ($("#searchCondition").val() != '2') {
				fncGetItemList('1');
				return;
			}
			
			if ($("#minPrice").val() != null && $("#minPrice").val().length>0 &&
					$("#maxPrice").val() != null && $("#maxPrice").val().length>0
					&& $("#minPrice").val()<=$("#maxPrice").val()) {
				$("#searchKeyword").val($("#minPrice").val()+"-"+$("#maxPrice").val());
				fncGetItemList('1');
				return;
			}
			
			alert("알맞은 가격 범위를 지정해주세요");
		}		
		
		function fncGetItemList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method","POST").attr("action","/product/listProduct").submit();
		}
		
		var currentPage = ${resultPage.currentPage};
		function getNextItems() {
			if ($(window).scrollTop() == $(document).height() - $(window).height()) {
				$.ajax({
						url : "/product/json/listProduct",
						method : "POST",
						data : JSON.stringify({
									currentPage:currentPage+1,
									filterCondition:$("#filterCondition").val(),
									sortCondition:$("#sortCondition").val(),
									searchCondition:$("#searchCondition").val(),
									searchKeyword:$("#searchKeyword").val()
								}),
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {						
							var list = JSONData["list"];
							currentPage++;
						
							list.forEach(function (item, index, array) {
								var tranCode = item['proTranCode']==null ? "판매중":"재고없음";
								var active = item['proTranCode']!=null ? " disabled":"";
								var purchaseButton = "<a href='#' class='btn btn-primary"+active+"' role='button' data-param1="+item['prodNo']+">바로구매</a><a href='#' class='btn btn-default"+active+"' role='button' data-param1="+item['prodNo']+">상세보기</a>";
								$($(".col-sm-6.col-md-4").last()).after("<div class='col-sm-6 col-md-4'><div class='thumbnail'><img src='/images/uploadFiles/"+item['fileName']+"' alt='Oops! Image is not ready :P'><div class='caption'><h3>"+item['prodName']+"</h3><p>가격: "+item['price']+"</p><p>상세정보: "+item['prodDetail']+"</p><p>"+tranCode+"</p><p>"+purchaseButton+"</p></div></div></div>");
								linkButtons();
							});
						}
				});	
			}
		}
		
		function scrollToTop() {
		    if ($(window).scrollTop() > 200) {
		        $('.totop').removeClass('invisible');
		    } else {
		    	$('.totop').addClass('invisible');
		    }
		}
		
		$(function(){
			$('.totop').on("click", function(){
				window.scrollTo(0, 0);
			});
			
			$("#filterCondition, #sortCondition").on("change" , function() {
				fncGetItemList('1');
			});
			
			$("#searchCondition").on("change" , function() {
				showInputField();
			});
			
			$("button.btn.btn-default").on("click" , function() {
				checkPriceInput();
			});	
			
			$("#searchKeyword").autocomplete({ 
				source: function( request, response ){
					$.ajax({
						url : "/product/json/autoComplete",
						method : "POST",
						data: {keyword:$("#searchKeyword").val()},
						dataType: "json",
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData, status) {
							response(JSONData);
						}
					});	
				}, 
				minLength: 1
			});
						
			linkButtons();
			
			var no_scrollbar = setInterval(function checkVariable() {
				if($(window).height() >= $(document).height() && ${resultPage.totalCount}>$(".col-sm-6.col-md-4").length) {
					getNextItems();
				} else {
					clearInterval(no_scrollbar);
				}
			}, 30);
			
			$(window).scroll(function() {
				scrollToTop();
				getNextItems();
			});
			
		})
	</script>
	
	<style>
		body {position:relative; padding-top : 50px;}
		.thumbnail img {width:300px;height:200px}
		.col-md-6.text-right {
			width:60%;
			margin-bottom:10px;
		}
		.col-md-6.text-left {width:40%}
		.row.bg-danger{margin:30px; border:}
		h4 {
			padding-bottom:10px;
			padding-top:15px;
		}
		
		.totop{
			position: fixed;
			bottom: 50px;
			right: 25px;
		}
	</style>

</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
		<div class="page-header text-info">
	       <h3>상품검색</h3>
	    </div>
	    <div class="row bg-danger">
	     	<h4 class="text-center text-danger"><strong>추천상품</strong></h4>
			<c:set var="i" value="0" />
			<c:forEach var="product" items="${random}">
			<c:set var="i" value="${ i+1 }" />
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="/images/uploadFiles/${product.fileName}" alt="Oops! Image is not ready :P">
					<div class="caption">
						<h3>${product.prodName}</h3>
						<p>가격: ${product.price}</p>
						<p>상세정보: ${product.prodDetail}</p>
						<p>${product.proTranCode == null ? '판매중':'재고 없음'}</p>
						<p>
							<a href="#" class="btn btn-primary <c:if test="${product.proTranCode != null}">disabled</c:if>" role="button" data-param1="${product.prodNo}">바로구매</a>
							<a href="#" class="btn btn-default <c:if test="${product.proTranCode != null}">disabled</c:if>" role="button" data-param1="${product.prodNo}">상세보기</a>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
       	</div>
	    <div class="row">
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount} 건수
		    	</p>
		    </div>

			<div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">

				<input type="hidden" id="menu" name="menu" value="${param.menu}"/>

				<div class="form-group">
				    <select class="form-control" id="filterCondition" name="filterCondition" >
						<option value="4" ${!empty search.filterCondition && search.filterCondition == "4" ? 'selected' : ''}>모든 상품</option>
						<option value="0" ${!empty search.filterCondition && search.filterCondition == "0" ? 'selected' : ''}>판매중</option>
					</select>
				</div>
				<div class="form-group">
				    <select class="form-control" id="sortCondition" name="sortCondition" >
						<option value="0" ${!empty search.sortCondition && search.sortCondition == "0" ? 'selected' : ''}>신상품순</option>
						<option value="1" ${!empty search.sortCondition && search.sortCondition == "1" ? 'selected' : ''}>낮은가격순</option>
						<option value="2" ${!empty search.sortCondition && search.sortCondition == "2" ? 'selected' : ''}>높은가격순</option>
					</select>
				</div>
				<div class="form-group">
				    <select class="form-control" id="searchCondition" name="searchCondition" >
						<option value="1" ${!empty search.searchCondition && search.searchCondition == "1" ? 'selected' : ''}>상품명</option>
						<option value="2" ${!empty search.searchCondition && search.searchCondition == "2" ? 'selected' : ''}>상품가격</option>
					</select>
				</div>
				<div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				</div>
				<div id="priceInput" style="display:${!empty search.searchKeyword && search.searchCondition == '2' ? 'inline' : 'none'}" align="right">
					<input type="text" name="minPrice" id="minPrice" value="${!empty search.searchKeyword ? fn:split(search.searchKeyword, '-')[0] : ''}" class="form-control"/>
					-
					<input type="text" name="maxPrice" id="maxPrice" value="${!empty search.searchKeyword ? fn:split(search.searchKeyword, '-')[1] : ''}" class="form-control"/>
				</div>
				
				<button type="button" class="btn btn-default">검색</button>
				<input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>  
			</div>
		</div>
		<div class="row">
			<c:set var="i" value="0" />
			<c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<div class="col-sm-6 col-md-4">
				<div class="thumbnail">
					<img src="/images/uploadFiles/${product.fileName}" alt="Oops! Image is not ready :P">
					<div class="caption">
						<h3>${product.prodName}</h3>
						<p>가격: ${product.price}</p>
						<p>상세정보: ${product.prodDetail}</p>
						<p>${product.proTranCode == null ? '판매중':'재고 없음'}</p>
						<p>
							<a href="#" class="btn btn-primary <c:if test="${product.proTranCode != null}">disabled</c:if>" role="button" data-param1="${product.prodNo}">바로구매</a>
							<a href="#" class="btn btn-default <c:if test="${product.proTranCode != null}">disabled</c:if>" role="button" data-param1="${product.prodNo}">상세보기</a>
						</p>
					</div>
				</div>
			</div>
			</c:forEach>
       	</div> 		
	</div>
	<div class="col-sm-2 col-md-1 totop invisible" >
		<button class="btn btn-primary" type="button">
			<span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span>
		</button>
	</div>
</body>
</html>