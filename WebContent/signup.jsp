<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="euc-kr">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>회원 가입</title>
    <script type="text/javascript">
    function Inputcheck() {
    	frm = document.signFrm;
    	if (frm.email.value == "") {
    		alert("이메일을 입력해주세요.");
    		frm.email.focus();
    		return;
    	}
    	
    	var str=document.signFrm.email.value;      
        var atPos = str.indexOf('@');
        var atLastPos = str.lastIndexOf('@');
        var dotPos = str.indexOf('.'); 
        var spacePos = str.indexOf(' ');
        var commaPos = str.indexOf(',');
        var eMailSize = str.length;
        if (atPos > 1 && atPos == atLastPos && 
           dotPos > 3 && spacePos == -1 && commaPos == -1 
           && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
        else {
              alert('E-mail을 확인해주세요.');
              document.signFrm.email.focus();
              return;
        }
    	
    	if (frm.pass.value == "") {
    		alert("패스워드를 입력해주세요.");
    		frm.pass.focus();
    		return;
    	}
    	
    	if (frm.passcheck.value == "") {
            alert("패스워드를 확인해주세요.");
            frm.passcheck.focus();
            return;
        }
    	
    	if (frm.name.value == "") {
            alert("이름을 입력해주세요.");
            frm.name.focus();
            return;
        }
    	
    	document.signFrm.submit();
    }
    
    function back() {
    	history.back();
    }
    </script>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">나의 메모장</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">
    <form method="post" action="signupProc.jsp" name="signFrm">
      <div class="starter-template">
        <h1 style="text-align:left">회원 가입</h1><hr>
		<div class="row">
			<div class="form-group col-md-3">&nbsp;</div>
			<div class="form-group col-md-6" >
				<label for="Email">이메일 주소(ID)</label>
				<input type="email" class="form-control" name="email" placeholder="Email">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-3">&nbsp;</div>
			<div class="form-group col-md-6" >
				<label for="Password">비밀번호</label>
				<input type="password" class="form-control" name="pass" placeholder="Password">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-3">&nbsp;</div>
			<div class="form-group col-md-6"  >
				<label for="Passwordcheck">비밀번호 확인</label>
				<input type="password" class="form-control" name="passcheck" placeholder="Password Check">
			</div>
		</div>
		<div class="row">
			<div class="form-group col-md-3">&nbsp;</div>
			<div class="form-group col-md-6" >
				<label for="Name">이름</label>
				<input type="text" class="form-control" name="name" placeholder="Name">
			</div>		
		</div>
		<div class="row">
			<div class="form-group col-md-4">&nbsp;</div>
			<div class="col-md-2">		
				<button class="btn btn-lg btn-primary btn-block" type="button" onclick="Inputcheck()">Sign up  <span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button>
			</div>
			
			<div class="col-md-2">
				<button class="btn btn-lg btn-danger btn-block" type="button" onclick="back()">Cancel  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
			</div>
			
			</div>
      </div>
      </form>

    </div><!-- /.container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>
