<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<!DOCTYPE html>

<html lang="ko">

<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		$(function(){
			$('form[name="detailForm"]').attr("method","post").attr("action","/product/listProduct");
			$("#filterCondition").on("change" , function() {
				fncGetItemList('1');
			});
			
			$(".btn.btn-default").on("click" , function() {
				fncGetItemList('1');
			});
			
			$("td:nth-child(2)").on("click", function(){
				var prodNo = $(this).data('param1');
				if (${param.menu == 'manage'}) {
					self.location = "/product/updateProduct?prodNo="+prodNo+"&menu=${param.menu}";
				} else {
					if (${user.role == 'admin'}){
						self.location = "/product/getProduct?prodNo="+prodNo+"&menu=${param.menu}";
					} 
				}
			})
			
			$("td:nth-child(2)").tooltip( {
				items:'[data-photo]',
				content: function(){
					var fileName = $(this).data('photo');
					return '<img src="/images/uploadFiles/'+fileName+'" width="300px;" height="300px;"/>';
				}
			} );
			
			$("#divy").on("click", function(){
				var prodNo = $(this).data('param1');
				self.location = "/purchase/updateTranCodeByProd?prodNo="+prodNo+"&tranCode=2";
			})
		
		})
	</script>
	
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-info">
			<c:if test="${param.menu == 'manage'}">
				<h3>상품 관리</h3>
			</c:if>
			<c:if test="${param.menu == 'search'}">
				<h3>상품 목록 조회</h3>
			</c:if>
	    </div>
	    
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
		    	<form class="form-inline" name="detailForm">

					<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
					
					<div class="form-group">
						<select class="form-control" id="filterCondition" name="filterCondition" >
							<option value="4" ${!empty search.filterCondition && search.filterCondition == "4" ? 'selected' : ''}>모든 상품</option>
							<option value="0" ${!empty search.filterCondition && search.filterCondition == "0" ? 'selected' : ''}>판매중</option>
							<option value="1" ${!empty search.filterCondition && search.filterCondition == "1" ? 'selected' : ''}>구매완료</option>
							<option value="2" ${!empty search.filterCondition && search.filterCondition == "2" ? 'selected' : ''}>배송중</option>
							<option value="3" ${!empty search.filterCondition && search.filterCondition == "3" ? 'selected' : ''}>배송완료</option>
						</select>
					</div>
					
					<div class="form-group">
						<select class="form-control" id="searchCondition" name="searchCondition" >
							<option value="0" ${!empty search.searchCondition && search.searchCondition == "0" ? 'selected' : ''}>상품번호</option>
							<option value="1" ${!empty search.searchCondition && search.searchCondition == "1" ? 'selected' : ''}>상품명</option>
							<option value="2" ${!empty search.searchCondition && search.searchCondition == "2" ? 'selected' : ''}>상품가격</option>
						</select>
					</div>
					  
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label>
					    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>
					
					<button type="button" class="btn btn-default">검색</button>
					
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				</form>
			</div>
		</div>
		
		<table class="table table-hover table-striped" >
			<thead>
				<tr>
		            <th align="center">No</th>
		            <th align="left">상품명</th>
		            <th align="left">가격</th>
		            <th align="left">등록일</th>
		            <th align="left">현재상태</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="product" items="${list}">
				<c:set var="i" value="${i+1}" />
				<tr>
					<td align="center">${i}</td>
					<td align="left" data-param1="${product.prodNo}" data-photo="${product.fileName}">${product.prodName}</td>
					<td align="left">${product.price}</td>
					<td align="left">${product.regDate}</td>
					<td align="left">
						<c:if test="${product.proTranCode == null}">판매중</c:if>
						<c:if test="${product.proTranCode == '1'}">
							구매완료
							<c:if test="${param.menu == 'manage'}">
								<span id="divy" data-param1="${product.prodNo}">배송하기</span>
							</c:if> 
						</c:if>
						<c:if test="${product.proTranCode == '2'}">배송중</c:if>
						<c:if test="${product.proTranCode == '3'}">배송완료</c:if>
					</td>
				</tr>
          		</c:forEach>
        	</tbody>
        </table>
	</div>
	
	<jsp:include page="../common/pageNavigator.jsp"/>
	
</body>
</html>