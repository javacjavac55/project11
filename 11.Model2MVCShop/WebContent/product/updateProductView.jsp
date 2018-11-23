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
		function fncAddProduct(){
			var name = $("input[name='prodName']").val();
			var detail = $("input[name='prodDetail']").val();
			var manuDate = $("input[name='manuDate']").val();
			var price = $("input[name='price']").val();
		
			if(name == null || name.length<1){
				alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(detail == null || detail.length<1){
				alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
				return;
			}
			if(manuDate == null || manuDate.length<1){
				alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
			if(price == null || price.length<1){
				alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
				return;
			}
				
			$('form[name="detailForm"]').attr("method","post").attr("enctype","multipart/form-data").attr("action","/product/updateProduct").submit();
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
			$("input[name='manuDate']").datepicker( {dateFormat: 'yy-mm-dd'});
			$("button.btn.btn-primary").on("click" , function() {
				fncAddProduct();
			});
			
			$("button.btn.btn-default").on("click" , function() {
				$("form")[0].reset();
			});
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
		<div class="page-header text-center">
	       <h3 class=" text-info">��ǰ����</h3>
	    </div>

		<form name="detailForm" class="form-horizontal">

			<input type="hidden" name="prodNo" value="${product.prodNo}">
			
			<div class="form-group">
				<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}" placeholder="��ǰ��">
			    </div>
			</div>
			
			<div class="form-group">
				<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}" placeholder="��ǰ������">
			    </div>
			</div>
			
			<div class="form-group">
				<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}" placeholder="��������" readonly>
			    </div>
			</div>
			
			<div class="form-group">
				<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    	<div class="col-sm-4">
					<input type="text" class="form-control" id="price" name="price" value="${product.price}" placeholder="����">
			    </div>
			</div>
			
			<div class="form-group">
				<label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    	<div class="col-sm-4">
					<input type="file" class="form-control" id="uploadFile" name="uploadFile">
			    </div>
			</div>
			
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