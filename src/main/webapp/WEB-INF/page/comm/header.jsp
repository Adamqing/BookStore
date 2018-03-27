<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--导航部分  begin-->
<div class="container" style="margin-top: 5px;">
	<nav class="navbar navbar-default well-sm" style="padding-left: 0px;"
		role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">在线书城</a>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav pull-left">
					<li
						<c:if test="${param.pIndex eq '1'}">
				class="active"
				</c:if>><a
						href="${base}/book/index">首页</a></li>

					<li>
					<li
						<c:if test="${param.pIndex eq '2'}">
				class="active"
				</c:if>
						class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 图书类型 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="${base}/book/search?cateStr=1">精选图书</a></li>
							<li class="divider"></li>
							<li><a href="${base}/book/search?cateStr=2">推荐图书</a></li>
							<li class="divider"></li>
							<li><a href="${base}/book/search?cateStr=3">特价图书</a></li>
							<li class="divider"></li>
						</ul></li>

					<c:if test="${!empty user}" var="islogin">
						<li><a href="#">欢迎,${user.userName}</a></li>


						<li><a href="${base}/user/logout">安全退出</a></li>

					</c:if>

					<c:if test="${!islogin}" var="islogin">
						<li id="loginLi"><a href="#" data-toggle="modal"
							data-target="#myModal">登录</a></li>
						<li><a href="#" data-toggle="modal" data-target="#register">注册</a>
						</li>
					</c:if>





					<li
						<c:if test="${param.pIndex eq '4'}">
				class="active"
				</c:if>><a
						href="${base}/permission/order/index?pageid=2">我的订单</a></li>
					<li
						<c:if test="${param.pIndex eq '3'}">
				class="active"
				</c:if>><a
						href="${base}/permission/cart/showCart"><span
							class="glyphicon glyphicon-shopping-cart"> </span>我的购物车</a></li>
				</ul>
				<div class="input-group col-md-3 pull-right"
					style="positon: relative; padding: 7px;">
					<input type="text" id="searchText" class="form-control"
						placeholder="请输入图书名" /> <span class="input-group-btn">
						<button class="btn btn-info btn-search" onclick="doSearch()">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</span>
				</div>
			</div>
		</div>
	</nav>
</div>
<!--导航部分 end-->

<!--最顶端轮播图片 begin-->
<div id="gcarouse" class="container">
	<!--轮播-->
	<div id="myCarousel" class="carousel slide">
		<!-- 轮播（Carousel）指标 -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>
		<!-- 轮播（Carousel）项目 -->
		<div class="carousel-inner">
			<div class="item active">
				<a href="${base}/book/detail?id=5"><img
					src="${base}/images/book1_nav.jpg" class="pull-left"
					alt="First slide"></a>
					<a href="${base}/book/detail?id=11"><img
					src="${base}/images/book2_nav.jpg" class="pull-left"
					alt="First slide"></a>
					<a href="${base}/book/detail?id=1"><img
					src="${base}/images/book3_nav.jpg" 
					alt="Third slide"></a>

			</div>
			<div class="item">
				<a href="${base}/book/detail?id=4"><img
					src="${base}/images/book4_nav.jpg" class="pull-left"
					alt="First slide"></a>
					<a href="${base}/book/detail?id=18"><img
					src="${base}/images/book5_nav.jpg" class="pull-left"
					alt="First slide"></a>
					<a href="${base}/book/detail?id=16"><img
					src="${base}/images/book6_nav.jpg" 
					alt="Third slide"></a>

			</div>
			<div class="item">
				<a href="${base}/book/detail?id=6"><img
					src="${base}/images/book7_nav.jpg" class="pull-left"
					alt="First slide"></a>
					<a href="${base}/book/detail?id=10"><img
					src="${base}/images/book8_nav.jpg" class="pull-left"
					alt="First slide"></a>
					<a href="${base}/book/detail?id=14"><img
					src="${base}/images/book9_nav.jpg" 
					alt="Third slide"></a>

			</div>
		</div>

		<!-- 轮播（Carousel）导航 -->
		<a class="carousel-control left" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="carousel-control right" href="#myCarousel" data-slide="next">&rsaquo;</a>
	</div>
</div>
<!--最顶端轮播图片 end-->

<c:forTokens items="${cookie.loginCookie.value}" delims=":" var="str"
	varStatus="i">
	<c:if test="${i.count==1}">
		<c:set value="${str}" var="name"></c:set>
	</c:if>
	<c:if test="${i.count==2}">
		<c:set value="${str}" var="password"></c:set>
	</c:if>
</c:forTokens>

<!-- 登录模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">用户登录</h4>
			</div>
			<div class="modal-body">
				<!--登录的form表单-->
				<form class="form-horizontal" role="form" action="">
					<div class="form-group has-feedback">
						<label for="loginName" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="loginName"
								value="${name}" placeholder="请输入用户名"> <span
								class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label for="loginPassword" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" value="${password}"
								id="loginPassword" placeholder="请输入密码"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="col-sm-3" style="padding-top: 10px;">
							<label class="alert-danger" id="loginHint"></label>
						</div>
					</div>


					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input value="1" <c:if test="${!empty password}"> checked </c:if>  id="isRemember" type="checkbox">请记住我
								</label>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" id="closeMyModal"
							data-dismiss="modal">关闭</button>
						<input type="button" onclick="login()" class="btn btn-primary"
							value="登录">
					</div>
				</form>
				<!--form结束-->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
</div>
<!-- 登录modal end/.modal -->

<div class="modal fade" id="register" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">用户注册</h4>
			</div>
			<div class="modal-body">
				<!--注册的form表单-->
				<form action="${base}/user/register" class="form-horizontal"
					role="form" method="POST" onsubmit="return preSubmit()">
					<div class="form-group has-feedback">
						<label for="firstname" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" id="regName"
								name="username" onblur="checkName()" required
								placeholder="小写字母开头,不含中文."> <span
								class="glyphicon glyphicon-user form-control-feedback"></span>
						</div>
						<div class="col-sm-3" style="padding-top: 10px;">
							<label id="regHint"></label>
						</div>
					</div>
					<div class="form-group has-feedback">
						<label for="lastname" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="regPassword"
								required name="password" placeholder="密码长度6-8位" min="6"
								maxlength="8"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>

					</div>
					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">确认密码</label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="regPassword2"
								required onblur="checkPassword()" min="6" maxlength="8"
								placeholder="和密码保持一致"> <span
								class="glyphicon glyphicon-lock form-control-feedback"></span>
						</div>
						<div class="col-sm-3" style="padding-top: 10px;">
							<label id="regPasswordHint"></label>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">邮箱</label>
						<div class="col-sm-5">
							<input type="email" class="form-control" name="email" required
								placeholder="合法邮箱格式"> <span
								class="glyphicon glyphicon-envelope form-control-feedback"></span>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">电话</label>
						<div class="col-sm-5">
							<input type="tel" class="form-control" name="phone" required
								placeholder="合法手机格式"> <span
								class="glyphicon glyphicon-earphone form-control-feedback"></span>
						</div>
					</div>

					<div class="form-group has-feedback">
						<label class="col-sm-2 control-label">公司</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" name="company" required
								placeholder="请输入公司地址"> <span
								class="glyphicon glyphicon-home form-control-feedback"></span>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<input id="regBut" type="submit" class="btn btn-primary"
							value="注册">
					</div>
				</form>
				<!--form结束-->
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
</div>
<script type="text/javascript">
	function preSubmit() {
		if (rightPassword && rightName) {
			return true;
		} else {
			alert('有情况 不对');
			return false;
		}

	}

	function checkPassword() {
		if (regPassword2.value == regPassword.value) {

			rightPassword = true;
			regPasswordHint.innerHTML = "<b style='color:green'>√</b>"
		} else {
			rightPassword = false;
			regPassword2.value = "";
			regPasswordHint.innerHTML = "<b style='color:red'>密码不一致</b>";

		}
	}
	var rightName = false;
	var rightPassword = false;
	function checkName() {
		//1.创建AJAX处理对象(兼容性)
		var xmlhttp;
		if (window.XMLHttpRequest) {
			//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp = new XMLHttpRequest();
		} else {
			// IE6, IE5 浏览器执行代码
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		//2.注册回调函数
		xmlhttp.onreadystatechange = function() {
			//判断(当readystate值是4表示ajax请求发送完毕并且http状态码是200,表示发送成功OK)
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				//AJAX业务处理,获取后台返回的数据

				if (xmlhttp.responseText == 1) {
					rightName = true;
					regHint.innerHTML = "<b style='color:green'>√</b>"
				} else {
					rightName = false;
					regHint.innerHTML = "<b style='color:red'>用户名已经存在</b>"
				}
			}
		};
		//3.设置AJAX请求
		//3-1.POST方式
		xmlhttp.open("post", "${base}/user/checkName", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		//4.发送请求
		//注意:如果是post请求,则send方法中需要提供发送的参数,并且在上面设置post请求发送
		var username = document.getElementById("regName").value;

		xmlhttp.send("username=" + username);

	}

	function doSearch() {
		if (searchText.value != "") {
			window.location.href = "${base}/book/search?search="
					+ searchText.value;
		}
	}

	function login() {

		var xmlhttp;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		} else {

			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		//2.注册回调函数
		xmlhttp.onreadystatechange = function() {
			//判断(当readystate值是4表示ajax请求发送完毕并且http状态码是200,表示发送成功OK)
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				//AJAX业务处理,获取后台返回的数据

				if (xmlhttp.responseText != 0) {
					//location.href="${base}/book/index";
					closeMyModal.click();
					loginLi.innerHTML = "<a>欢迎," + xmlhttp.responseText
							+ "</a>";
				} else {
					loginHint.innerHTML = "<b>用户名或密码错误!</b>";
				}
			}
		};
		//3.设置AJAX请求
		//3-1.POST方式
		xmlhttp.open("post", "${base}/user/login", true);
		xmlhttp.setRequestHeader("Content-type",
				"application/x-www-form-urlencoded");
		//4.发送请求
		//注意:如果是post请求,则send方法中需要提供发送的参数,并且在上面设置post请求发送
		var username = document.getElementById("loginName").value;
		var password = document.getElementById("loginPassword").value;
		var ischecked = document.getElementById("isRemember").checked;
		xmlhttp.send("username=" + username + "&password=" + password
				+ "&isRember=" + ischecked);

	}
</script>
