<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>��ǰ����</title>
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
		    prevText: '���� ��',
		    nextText: '���� ��',
		    monthNames: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		    monthNamesShort: ['1��', '2��', '3��', '4��', '5��', '6��', '7��', '8��', '9��', '10��', '11��', '12��'],
		    dayNames: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		    dayNamesShort: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		    dayNamesMin: ['��', '��', 'ȭ', '��', '��', '��', '��'],
		    showMonthAfterYear: true,
		    yearSuffix: '��'
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
	       <h3 class=" text-info">������������</h3>
	    </div>
		
		<form name="updatePurchase" class="form-horizontal">
			<input type="hidden" name="buyer.userId" value="${purchase.buyer.userId}">
			
			<div class="form-group">
				<label class="col-sm-3 control-label">������ ���̵�</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchase.buyer.userId}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="paymentOption" class="col-sm-3 control-label">���Ź��</label>
				<select class="form-control selectcustom" id="paymentOption" name="paymentOption" >
					<option value="1" ${purchase.paymentOption == "1" ? 'selected':''}>���ݱ���</option>
					<option value="2" ${purchase.paymentOption == "2" ? 'selected':''}>�ſ뱸��</option>
				</select>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="receiverName" class="col-sm-3 control-label">������ �̸�</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="������ �̸�">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="receiverPhone" class="col-sm-3 control-label">������ ����ó</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" placeholder="������ ����ó">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyAddr" class="col-sm-3 control-label">������ �ּ�</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr}" placeholder="������ �ּ�">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyRequest" class="col-sm-3 control-label">���ſ�û����</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}" placeholder="���ſ�û����">
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyDate" class="col-sm-3 control-label">����������</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyDate" name="divyDate" value="${purchase.divyDate}" placeholder="����������" readonly>
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<div class="col-sm-offset-4  col-sm-4 text-center">
					<button type="button" class="btn btn-primary"  >�� &nbsp;��</button>
					<button type="button" class="btn btn-default"  >�� &nbsp;��</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>