<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!doctype html>
<html lang="ko">
<head>
	<meta charset="EUC-KR">
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
	<style>
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
</head>
<body>
	<!-- <div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
   	</div>
	<div class="container">
   		<div class="row">
   			<form class="form-horizontal">
				<div class="form-group">
					<label for="userId" class="col-sm-4 control-label">아 이 디</label>
					<div class="col-sm-6">
						<input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" >
					</div>
				</div>
					  
				<div class="form-group">
					<label for="password" class="col-sm-4 control-label">패 스 워 드</label>
					<div class="col-sm-6">
						<input type="password" class="form-control" name="password" id="password" placeholder="패스워드" >
					</div>
				</div>
					  
				<div class="form-group">
					<div class="col-sm-offset-4 col-sm-6 text-center">
						<button type="button" class="btn btn-primary"  >로 &nbsp;그 &nbsp;인</button>
						<a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
					</div>
				</div>
			
			</form>
		</div>
	</div> -->

<script type="text/javascript">
  //var naver_id_login = new naver_id_login("wglB2_fOPgVdVEVOhiG3", "http://192.168.0.45:8080/naverLoginSupport.jsp");
  // 접근 토큰 값 출력
  alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
	alert(naver_id_login.getProfileData('id'));
    alert(naver_id_login.getProfileData('email'));
    alert(naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age'));
    
  }
</script>
</body>
</html>