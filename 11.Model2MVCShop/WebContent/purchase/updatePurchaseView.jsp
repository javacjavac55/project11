<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>상품구매</title>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		$.datepicker.setDefaults({
		    dateFormat: 'yy-mm-dd',
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		    showMonthAfterYear: true,
		    yearSuffix: '년'
		});
		
		$(function(){
			$("input[name='divyDate']").datepicker( {dateFormat: 'yy-mm-dd'});
			
			$("button.btn.btn-primary").on("click" , function() {
				$('form[name="updatePurchase"]').attr("method","post").attr("action","/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
			});
			
			$("button.btn.btn-default").on("click" , function() {
				history.go(-1);
			});
		})
	</script>
	
	<style>
		body {
            padding-top : 50px;
        }
        
        .selectcustom
		{
			width: 31% !important;
			margin-left: 307px;
		}
    </style>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	    </div>
		
		<form name="updatePurchase" class="form-horizontal">
			<input type="hidden" name="buyer.userId" value="${purchase.buyer.userId}">
			
			<div class="form-group">
				<label class="col-sm-3 control-label">구매자 아이디</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchase.buyer.userId}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="paymentOption" class="col-sm-3 control-label">구매방법</label>
				<select class="form-control selectcustom" id="paymentOption" name="paymentOption" >
					<option value="1" ${purchase.paymentOption == "1" ? 'selected':''}>현금구매</option>
					<option value="2" ${purchase.paymentOption == "2" ? 'selected':''}>신용구매</option>
				</select>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="receiverName" class="col-sm-3 control-label">구매자 이름</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="구매자 이름">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="receiverPhone" class="col-sm-3 control-label">구매자 연락처</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" placeholder="구매자 연락처">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyAddr" class="col-sm-3 control-label">구매자 주소</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}" placeholder="구매자 주소">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyRequest" class="col-sm-3 control-label">구매요청사항</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}" placeholder="구매요청사항">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyDate" class="col-sm-3 control-label">배송희망일자</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyDate" name="divyDate" value="${purchase.divyDate}" placeholder="배송희망일자" readonly>
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
					<button type="button" class="btn btn-default"  >취 &nbsp;소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>