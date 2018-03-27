<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>提示</title>
<link type="text/css" rel="stylesheet"
	href="${base}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${base}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${base}/css/animate.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/page/comm/header.jsp"></jsp:include>
	<div class="container">
		<div class="text-primary" style="font-size:80px">
			${hint}
		</div>
	</div>
	<div class="container">
		<a href="${base}/book/index" class="col-sm-12 col-md-6" style="font-size:40px">要回到首页吗？</a>
	</div>


	<%@ include file="/WEB-INF/page/comm/footer.html"%>
	<script src="${base}/dist/js/jquery.min.js"></script>
	<script src="${base}/dist/js/bootstrap.min.js"></script>
</body>
</html>