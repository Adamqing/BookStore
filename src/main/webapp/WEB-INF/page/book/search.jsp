<%@ page contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>图书列表</title>
<link type="text/css" rel="stylesheet"
	href="${base}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${base}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${base}/css/animate.css" />
</head>
<body>
	<jsp:include page="/WEB-INF/page/comm/header.jsp"><jsp:param value="2" name="pIndex"/></jsp:include>


	<div id="datatable" class="container"></div>


	<%@ include file="/WEB-INF/page/comm/footer.html"%>
	
	<script src="${base}/dist/js/jquery.min.js"></script>
		<script src="${base}/js/carousel.js" type="text/javascript"
			charset="utf-8"></script>
		<script src="${base}/dist/js/bootstrap.min.js"></script>
		<script src="${base}/js/wow.js"></script>
		<script type="text/javascript">
		var size=4;
			
		$("#datatable").load(
					"${base}/book/showSearch?now=1&size=4&cateStr=${cateStr}&search=${search}");
			
			function changeSize(pageSize){
				size=pageSize;
				$("#datatable").load(
				"${base}/book/showSearch?now=1&size="+size+"&cateStr=${cateStr}&search=${search}");
			}
			
			function nextPage(pageNow){
			
				$("#datatable").load(
				"${base}/book/showSearch?now="+pageNow+"&size="+size+"&cateStr=${cateStr}&search=${search}");
			}
		</script>
</body>
</html>