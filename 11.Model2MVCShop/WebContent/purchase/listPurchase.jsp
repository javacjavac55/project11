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
			$('form[name="detailForm"]').attr("method","post").attr("action","/purchase/listPurchase");
			 
			$("td:nth-child(1)").on("click", function(){
				var tranNo = $(this).data('param1');
				self.location = "/purchase/getPurchase?tranNo="+tranNo;
			})
			 
			$("td:nth-child(2)").on("click", function(){
				var prodNo = $(this).data('param1');
				self.location = "/product/getProduct?prodNo="+prodNo+"&menu=view";
			})
			 
			$("td:nth-child(3)").on("click", function(){
				var userId = $(this).data('param1');
				self.location = "/user/getUser?userId="+userId;
			})
			 
			$("#divy").on("click", function(){
				var tranNo = $(this).data('param1');
				self.location = "/purchase/updateTranCode?tranNo="+tranNo+"&tranCode=3";
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
			<h3>���� �����ȸ</h3>
	    </div>
	
		<div class="row">
		
			<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
		    	<form class="form-inline" name="detailForm">
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				</form>
			</div>
		</div>
			
		<table class="table table-hover table-striped" >
			<thead>
				<tr>
					<th align="center">No</th>
					<th align="left">��ǰ��</th>
					<th align="left">ȸ����</th>
					<th align="left">�����ڸ�</th>
					<th align="left">��ȭ��ȣ</th>
					<th align="left">�����Ȳ</th>
					<td align="left">��������</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="i" value="0" />
				<c:forEach var="purchase" items="${list}">
				<c:set var="i" value="${i+1}" />
				<tr>
					<td align="center" data-param1="${purchase.tranNo}">${i}</td>
					<td align="left" data-param1="${purchase.purchaseProd.prodNo}">${purchase.purchaseProd.prodName}</td>
					<td align="left" data-param1="${purchase.buyer.userId}">${purchase.buyer.userName}</td>
					<td align="left">${purchase.receiverName}</td>
					<td align="left">${purchase.receiverPhone}</td>
					<td align="left">
						���� 
						<c:if test="${purchase.tranCode == '1'}">���ſϷ�</c:if>
						<c:if test="${purchase.tranCode == '2'}">�����</c:if>
						<c:if test="${purchase.tranCode == '3'}">��ۿϷ�</c:if>
						���� �Դϴ�.
					</td>
					<td align="left">
						<c:if test="${purchase.tranCode == '2'}">
							<span id="divy" data-param1="${purchase.tranNo}">���ǵ���</span>
						</c:if>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<jsp:include page="../common/pageNavigator.jsp"/>

</body>
</html>