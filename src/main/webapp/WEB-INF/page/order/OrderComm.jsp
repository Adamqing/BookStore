<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>我的订单</title>
<link type="text/css" rel="stylesheet"
	href="${base}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${base}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${base}/css/animate.css" />
</head>
<body>
<jsp:include page="/WEB-INF/page/comm/header.jsp"><jsp:param value="4" name="pIndex"/></jsp:include>


	<div id="datatable" class="container"></div>
	
<%@ include file="/WEB-INF/page/comm/footer.html"%>
	
	<script src="${base}/dist/js/jquery.min.js"></script>
		<script src="${base}/js/carousel.js" type="text/javascript"
			charset="utf-8"></script>
		<script src="${base}/dist/js/bootstrap.min.js"></script>
		<script src="${base}/js/wow.js"></script>
		
		<script type="text/javascript">
		
		if('${pageid}'==1){
			$("#datatable").load("${base}/permission/order/confirmOrder");
		}
		if('${pageid}'==2){
			$("#datatable").load("${base}/permission/order/showOrder");
		}
		var pageSize="";
		var startDate="";
		var endDate="";
		var isOrder="";
		var status="";
		var orderNum="";
		//显示条数
		function displaySize(obj) {
			pageSize=obj.value;
			$("#datatable").load("/Book_Store/permission/order/showOrder?pageSize="+pageSize);
		}
		function nextPage(pageNow){
			var st="/Book_Store/permission/order/showOrder?pageNow="+pageNow+"&pageSize="+pageSize+"&orderNum="+orderNum
			+"&start="+startDate+"&end="+endDate+"&status="+status+"&isOrder="+isOrder
		
			$("#datatable").load(st);
		}
		
		function searchDay(start,end){
			orderNum="";
			isOrder="";
			status="";
			startDate=start;
			endDate=end;
			nextPage(1);
		}
		function searchStatus(stat){
			orderNum="";
			status=stat;
			isOrder="";
			startDate="";
			endDate="";
			nextPage(1);
		}
		function searchOrderBy(order){
			isOrder=order;
			nextPage(1);
		}
		function searchOrderNum(order){
			orderNum=document.getElementById("orderNumber").value;
			isOrder="";
			status="";
			startDate="";
			endDate="";
			nextPage(1);
		}
		
		</script>
</body>
</html>