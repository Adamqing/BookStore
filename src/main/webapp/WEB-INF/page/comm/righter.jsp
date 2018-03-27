<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<!--右边-->
		<div class="col-md-4 col-sm-3 col-xs-8">
			<ol class="breadcrumb ">
				<li><a href="${base}/permission/cart/showCart" class="text-success "><span
						class="glyphicon glyphicon-shopping-cart "></span>我的购物车</a></li>
				<li><a href="${base}/permission/cart/showCart">${empty cart.count?0:cart.count}个商品</a></li>
				<li><a href="${base}/permission/cart/showCart"></a>总价${empty cart.total?0:cart.total}元</li>
			</ol>

			<!--猜您喜欢-->
			<div>
				<span class="text-info"><span
					class="glyphicon glyphicon-heart"></span><span
					style="font-size: 20px;">猜您喜欢</span></span>
				<div class="row" id="love">
					<div class="col-sm-12 col-md-12">
						<div class="thumbnail">
							<a href="${base}/book/detail?id=1"><img
								src="${base}/images/xiaodaolifencunzhijian.jpg "
								style="height: 200px;" alt="通用的占位符缩略图 "></a>
							<div class="caption ">
								<h3>小道理：分寸之间</h3>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-12">
						<div class="thumbnail ">
							<a href="${base}/book/detail?id=2"><img
								src="${base}/images/NO SECRETS.jpg " style="height: 200px;"
								alt="通用的占位符缩略图 "></a>
							<div class="caption ">
								<h3>名创优品没有秘密</h3>
							</div>
						</div>
					</div>
					<div class="col-sm-12 col-md-12">
						<div class="thumbnail ">
							<a href="${base}/book/detail?id=3"><img
								src="${base}/images/maichanpinjiushimaiziji.jpg"
								style="height: 200px;" alt="通用的占位符缩略图 "></a>
							<div class="caption ">
								<h3>卖产品就是卖自己</h3>
							</div>
						</div>
					</div>
					<div>
						<ul class="pager ">
							<li><a href="# " onclick="pageUp() ">&larr;上一页</a> <a
								href="# " onclick="pageDown() ">下一页 &rarr;</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>