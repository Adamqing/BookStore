<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta charset="UTF-8">
<title>在线书城首页</title>
<link type="text/css" rel="stylesheet"
	href="${base}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${base}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${base}/css/animate.css" />
<title>在线书城</title>
</head>
<body>
	<jsp:include page="comm/header.jsp"><jsp:param  name="pIndex" value="1"/></jsp:include>

	<!--图书内容部分 begin-->
	<div class="container">
		<c:forEach var="cate" items="${cates}">
			<div id="datatable${cate.cateid}" class="container"></div>
		</c:forEach>
	</div>
	<%@ include file="comm/footer.html"%>

	<!--图书内容部分end-->


	<script src="${base}/dist/js/jquery.min.js"></script>
	<script src="${base}/js/carousel.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${base}/dist/js/bootstrap.min.js"></script>
	<script src="${base}/js/wow.js"></script>
	<script type="text/javascript">
		<c:forEach var="cate" items="${cates}">
		$("#datatable${cate.cateid}").load(
				"${base}/book/showData?now=1&size=4&cate=${cate.cateid}");
		</c:forEach>
	</script>
</body>
</html>