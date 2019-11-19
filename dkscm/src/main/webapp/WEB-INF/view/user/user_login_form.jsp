<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Angel采购供应链</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />
	<meta name="keywords" content=""
	/>
	<script>
		addEventListener("load", function () {
			setTimeout(hideURLbar, 0);
		}, false);

		function hideURLbar() {
			window.scrollTo(0, 1);
		}
	</script>
	<!-- Meta tag Keywords -->
	<!-- css files -->
	<link rel="stylesheet" href="../static/css/style.css" type="text/css" media="all" />
	<!-- Style-CSS -->
	<link rel="stylesheet" href="../static/css/fontawesome-all.css">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->
	<!-- web-fonts -->
	  
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i" rel="stylesheet">
	<link href="http://maxcdn.bootstrapcdn.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	
	<!-- //web-fonts -->
	</head>
	<body>
	<!-- bg effect -->
	<div id="bg">
		<canvas></canvas>
		<canvas></canvas>
		<canvas></canvas>
	</div>
	<!-- //bg effect -->
	<!-- title -->
	<h1>Angel采购供应链</h1>
	<!-- //title -->
	<!-- content -->
	<div class="sub-main-w3">
		<form action="login" method="post">
			<h2>登录
				<i class="fas fa-level-down-alt"></i>
			</h2>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-user"></i>
					用户手机
				</label>
				<input placeholder="请输入您的手机号码" name=username type="text" >
			</div>
			<div class="form-style-agile">
				<label>
					<i class="fas fa-unlock-alt"></i>
					登录密码
				</label>
				<input placeholder="请输入您的登录密码" name="password" type="password">
			</div>
			<!-- checkbox -->
			<div class="wthree-text">
			
				<ul>
				<!-- 
					<li>
						<label class="anim">
							<input type="checkbox" class="checkbox" required="">
							<span>Stay Signed In</span>
						</label>
					</li>
				-->
					<li>
						<a href="#">忘记密码</a>
					</li>
				</ul>
				 
			</div>
			<!-- //checkbox -->
			
			<input type="submit" value="进入系统">
			
		</form>
	</div>
	<!-- //content -->

	<!-- copyright -->
	<div class="footer">
		<p>Copyright &copy; 2019.Angel procurement supplier chain management
		<!-- <a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a> --></p>
	</div>
	<!-- //copyright -->

	<!-- Jquery -->
	<script src="../static/js/jquery-3.3.1.min.js"></script>
	<!-- //Jquery -->

	<!-- effect js -->
	<script src="../static/js/canva_moving_effect.js"></script>
	<!-- //effect js -->

</body>
</html>