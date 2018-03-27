<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>购物车</title>
<link type="text/css" rel="stylesheet"
	href="${base}/dist/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${base}/css/index.css" />
<link rel="stylesheet" type="text/css" href="${base}/css/animate.css" />
</head>
<body onload="changeNum()">

	<jsp:include page="/WEB-INF/page/comm/header.jsp"><jsp:param value="3" name="pIndex"/></jsp:include>

	<!--购物车 begin-->
	<!--外层div-->
	<div class="container">
		<!--左边-->
		<div class="col-md-8 col-sm-12">
			<!--左边-->
			<ol class="breadcrumb">
				<li><a href="#" class="text-success"><span
						class="glyphicon glyphicon-heart"></span>&nbsp;&nbsp;我的宝贝</a></li>
			</ol>

			<!--购物车表格 begin-->
			<div class="table-responsive" id="imgDiv">
				<table class="table table-hover table-striped"
					style="vertical-align: middle;">
					<thead>
						<tr class="text-success success">
							<th><input type="checkbox" id="selectAll"
								onclick="selectAll(this)"></th>
							<th id="sequence">ID号</th>
							<th>图片</th>
							<th>书名</th>
							<th>单价</th>
							<th>数量</th>
							<th>合计</th>
						</tr>
					</thead>
					<tbody id="tby">
						<c:forEach items="${cart.cart}" var="item">
							
							
							<tr>
								<td><input type="checkbox" name="cks"></td>
								<td>${item.book_isbn }</td>
								<td><img src="${base}/images/${item.book_url}"></td>
								<td>${item.book_name}</td>
								<td>${item.unit_price}元</td>
								<td>${item.count}</td>
								<td>${item.allPrice}元</td>
							</tr>

						</c:forEach>


					</tbody>
					<tfoot>
						<tr>
							<td colspan="5"></td>
							<td class="text-success">总价:</td>
							<td class="text-success" id="cartTotalMoneny">${cart.total}元</td>
						</tr>
						<tr style="background-color: white;">
							<td><a href="${base}/book/index" class="btn btn-info">&lt;&lt;继续购买</a>
							</td>
							<td><button class="btn btn-danger" data-toggle="modal"
									data-target="#delete" onclick="del()">删除商品</button></td>
							<td colspan="4"></td>
							<td><a href="${base}/permission/order/index?pageid=1" class="btn btn-warning">结算商品</a>
							</td>
						</tr>
					</tfoot>
				</table>
			</div>
			<!--购物车 end-->

			<!--删除提示模态框 begin-->
			<div class="modal fade" id="delete" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<!--如果没有选中任何一个商品的时候,出现-->
				<div id="first_del" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title text-warning" id="myModalLabel">抱歉!请您先选择商品!</h4>
							</div>
							<div class="modal-body">请选进行勾选!再执行删除!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
				</div>
				<!--first_del  end-->

				<!--如果没有选中了一个商品的时候,出现-->
				<div id="two_del" style="display: none;">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title text-warning" id="myModalLabel">删除商品,慎重操作!</h4>
							</div>
							<div class="modal-body">删除后数据将不可恢复!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-danger"
									onclick="delRows(this)">确定删除</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
				</div>
				<!--two_del  end-->
			</div>
			<!--删除提示模态框 end-->
		</div>

	<div id="rightData">
			<jsp:include page="/WEB-INF/page/comm/righter.jsp"></jsp:include>
		</div>
	
	</div>


	<%@ include file="/WEB-INF/page/comm/footer.html"%>
	<script src="${base}/dist/js/jquery.min.js"></script>
	<script src="${base}/js/wow.js"></script>
	<script src="${base}/js/carousel.js" type="text/javascript"></script>
	<script src="${base}/dist/js/bootstrap.min.js"></script>
	<script src="${base}/js/details.js" type="text/javascript"
		charset="utf-8"></script>
	<script src="${base}/js/cart.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))) {
			new WOW().init();
		};
	</script>
</body>
</html>