<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>   
<html lang="ko">
<head>
	<title>상품상세조회</title>
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
			if (${param.menu == 'manage'}){
				$("button.btn.btn-primary").on("click" , function() {
					self.location = "/product/listProduct?menu=manage";
				});
			} else if (${param.menu == 'search'}) {
				if (${!empty user}) {
					$("button.btn.btn-primary").on("click" , function() {
						var prodNo = $(this).data("param1");
						self.location = "/purchase/addPurchase?prod_no="+prodNo;
					});
				}
				
				$("button.btn.btn-default").on("click" , function() {
					window.history.back();
				});
			}
		});
	</script>

	<style>
		body {
            padding-top : 50px;
        }
        
        .col-sm-offset-4.col-sm-4.text-center {
        	padding-bottom : 30px;
        }
    </style>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
		<div class="page-header text-center">
	       <h3 class=" text-info">상품상세조회</h3>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodNo}</div>
		</div>
		
		<hr/>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		
		<hr/>
				
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${product.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품이미지</strong></div>
			<div class="col-xs-8 col-md-4"><img src="/images/uploadFiles/${product.fileName}"/></div>
		</div>
		
		<hr/>
		
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
				<c:if test="${param.menu == 'manage'}">
					<button type="button" class="btn btn-primary" >확&nbsp;인</button>
				</c:if>
				<c:if test="${param.menu == 'search'}">
					<c:if test="${!empty user}">
						<button type="button" class="btn btn-primary" data-param1="${product.prodNo}">구&nbsp;매</button>
					</c:if>	
						<button type="button" class="btn btn-default" >이&nbsp;전</button>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>