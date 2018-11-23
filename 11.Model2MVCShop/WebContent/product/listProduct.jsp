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
				<h3>��ǰ ����</h3>
			</c:if>
			<c:if test="${param.menu == 'search'}">
				<h3>��ǰ ��� ��ȸ</h3>
			</c:if>
	    </div>
	    
	    <div class="row">
	    
	    	<div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
		    	<form class="form-inline" name="detailForm">

					<input type="hidden" id="menu" name="menu" value="${param.menu}"/>
					
					<div class="form-group">
						<select class="form-control" id="filterCondition" name="filterCondition" >
							<option value="4" ${!empty search.filterCondition && search.filterCondition == "4" ? 'selected' : ''}>��� ��ǰ</option>
							<option value="0" ${!empty search.filterCondition && search.filterCondition == "0" ? 'selected' : ''}>�Ǹ���</option>
							<option value="1" ${!empty search.filterCondition && search.filterCondition == "1" ? 'selected' : ''}>���ſϷ�</option>
							<option value="2" ${!empty search.filterCondition && search.filterCondition == "2" ? 'selected' : ''}>�����</option>
							<option value="3" ${!empty search.filterCondition && search.filterCondition == "3" ? 'selected' : ''}>��ۿϷ�</option>
						</select>
					</div>
					
					<div class="form-group">
						<select class="form-control" id="searchCondition" name="searchCondition" >
							<option value="0" ${!empty search.searchCondition && search.searchCondition == "0" ? 'selected' : ''}>��ǰ��ȣ</option>
							<option value="1" ${!empty search.searchCondition && search.searchCondition == "1" ? 'selected' : ''}>��ǰ��</option>
							<option value="2" ${!empty search.searchCondition && search.searchCondition == "2" ? 'selected' : ''}>��ǰ����</option>
						</select>
					</div>
					  
					<div class="form-group">
						<label class="sr-only" for="searchKeyword">�˻���</label>
					    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
					    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
					</div>
					
					<button type="button" class="btn btn-default">�˻�</button>
					
					<input type="hidden" id="currentPage" name="currentPage" value=""/>
				</form>
			</div>
		</div>
		
		<table class="table table-hover table-striped" >
			<thead>
				<tr>
		            <th align="center">No</th>
		            <th align="left">��ǰ��</th>
		            <th align="left">����</th>
		            <th align="left">�����</th>
		            <th align="left">�������</th>
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
						<c:if test="${product.proTranCode == null}">�Ǹ���</c:if>
						<c:if test="${product.proTranCode == '1'}">
							���ſϷ�
							<c:if test="${param.menu == 'manage'}">
								<span id="divy" data-param1="${product.prodNo}">����ϱ�</span>
							</c:if> 
						</c:if>
						<c:if test="${product.proTranCode == '2'}">�����</c:if>
						<c:if test="${product.proTranCode == '3'}">��ۿϷ�</c:if>
					</td>
				</tr>
          		</c:forEach>
        	</tbody>
        </table>
	</div>
	
	<jsp:include page="../common/pageNavigator.jsp"/>
	
</body>
</html>