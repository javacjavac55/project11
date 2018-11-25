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
		function fncAddPurchase() {
			$('form[name="addPurchase"]').attr("method","post").attr("action","/purchase/addPurchase").submit();
		}

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
				fncAddPurchase();
			});
			
			$("button.btn.btn-default").on("click" , function() {
				history.go(-1);
			});
		});
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
	       <h3 class=" text-info">��ǰ����</h3>
	    </div>

		<form name="addPurchase" class="form-horizontal">
			<input type="hidden" name="prodNo" value="${purchaseProd.prodNo}" />
			<input type="hidden" name="buyerId" value="${user.userId}" />
		
			<div class="form-group">
				<label class="col-sm-3 control-label">��ǰ��ȣ</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchaseProd.prodNo}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">��ǰ��</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchaseProd.prodName}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">��ǰ������</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchaseProd.prodDetail}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">��������</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchaseProd.manuDate}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">�������</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchaseProd.regDate}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">����</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${purchaseProd.price}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label class="col-sm-3 control-label">������ ���̵�</label>
			    <div class="col-sm-9">
					<p class="form-control-static">${user.userId}</p>
				</div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="paymentOption" class="col-sm-3 control-label">���Ź��</label>
				<select class="form-control selectcustom" id="paymentOption" name="paymentOption" >
					<option value="1" selected="selected">���ݱ���</option>
					<option value="2">�ſ뱸��</option>
				</select>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="receiverName" class="col-sm-3 control-label">������ �̸�</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverName" name="receiverName" value="${user.userName}" placeholder="������ �̸�" >
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="receiverPhone" class="col-sm-3 control-label">������ ����ó</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${user.phone}" placeholder="������ ����ó" >
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyAddr" class="col-sm-3 control-label">������ �ּ�</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${user.addr}" placeholder="������ �ּ�" >
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyRequest" class="col-sm-3 control-label">���ſ�û����</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyRequest" name="divyRequest" placeholder="���ſ�û����" >
			    </div>
			</div>
			
			<hr/>
			
			<div class="form-group">
				<label for="divyDate" class="col-sm-3 control-label">����������</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="divyDate" name="divyDate" placeholder="����������" readonly>
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