<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--左边-->
<div class="container pull-left">
	<ol class="breadcrumb">
		<li><a href="#" class="text-success"><span
				class="glyphicon glyphicon-list"></span>&nbsp;&nbsp;我的订单</a></li>
	</ol>

	<!--订单查询导航 begin-->
	<div>
		<nav class="navbar navbar-default" role="navigation">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">所有订单</a>
			</div>

			<form class="navbar-form navbar-left" role="search">
				<input type="text" id="orderNumber" class="form-control"
					placeholder="输入订单号进行查询">
				<button type="button" onclick="searchOrderNum()"
					class="btn btn-search">
					<span class="text-success">Search</span>&nbsp;&nbsp;<span
						class="glyphicon glyphicon-search"></span>
				</button>
			</form>

			<ul class="nav navbar-nav navbar-left">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 交易状态 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:searchStatus('')">全部</a></li>
						<li class="divider"></li>
						<li><a href="javascript:searchStatus('等待发货')">等待发货</a></li>
						<li class="divider"></li>
						<li><a href="javascript:searchStatus('配送中')">配送中</a></li>
						<li class="divider"></li>
						<li><a href="javascript:searchStatus('交易关闭')">交易关闭</a></li>
						<li class="divider"></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-left">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"> 订单排序 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a href="javascript:searchOrderBy(0)">订单日期降序</a></li>
						<li class="divider"></li>
						<li><a href="javascript:searchOrderBy(1)">订单日期升序</a></li>
						<li class="divider"></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li style="padding-right: 15px;"><a data-toggle="collapse"
					data-parent="#accordion" href="#collapseTwo">更多筛选条件</a></li>
			</ul>

			<ul class="nav navbar-nav">
				<li><a href="javascript:deleteOrder()">删除订单</a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li><a href="alert('你以为你是谁想清空就清空啊')">清空订单列表</a></li>
			</ul>
		</nav>
	</div>

	<!--订单查询导航 end-->
	<!--日期控件-->
	<div id="collapseTwo" class="panel-collapse collapse">
		<div class="panel-body">
			<div class="form-group">
				<div>
					<form class="form-horizontal">
						<div class="form-group has-feedback">
							<div class="col-md-1" style="padding-top: 5px;">成交日期:</div>
							<div class="col-md-3">
								<input type="text" class="form-control" id="datetimepicker"
									placeholder="开始时间"> <span
									class="glyphicon glyphicon-time form-control-feedback"></span>
							</div>
							<div class="col-md-1"
								style="padding-top: 5px; text-align: center;">至</div>
							<div class="col-md-3">
								<input type="text" class="form-control" id="datetimepicker2"
									placeholder="结束日期"> <span
									class="glyphicon glyphicon-time form-control-feedback"></span>
							</div>
							<div class="col-md-3">
								<button type="button" class="btn btn-default"
									onclick="searchDate()">
									查询&nbsp;&nbsp;<span class="glyphicon glyphicon-search"></span>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!--日期控件-->
		<c:if test="${ pageBean.totalPages eq 0}">
		<h1>快去买书吧...</h1>
		</c:if>

	<!--内容展示 begin-->
	<div class="table-responsive">
		<c:forEach items="${pageBean.pageDatas }" var="order" varStatus="i">
			<table class="table table-hover table-striped">
				<caption class="text-info">
					<div class="col-md-10" style="padding-left: 0px;">
						<input type="checkbox" name="cks" value="${order.orderId}">&nbsp;
						<fmt:formatDate value='${order.createDate}' pattern='yyyy-MM-dd' />
						订单号:${order.orderNum}单
					</div>
					<div class="col-md-2" style="text-align: right;">
						<a data-toggle="collapse" data-parent="#accordion"
							href="#collapse${i.count}">订单详情</a>
					</div>
				</caption>
				<thead>
					<tr id="collapse${i.count}" class="panel-collapse collapse">
						<td colspan="9">
							<div class="panel-body">
								<!--tab选项卡 begin-->
								<ul id="myTab" class="nav nav-tabs">
									<li class="active"><a href="#user${i.count}"
										data-toggle="tab"> 联系人信息 </a></li>
									<li><a href="#order${i.count}" data-toggle="tab">订单信息</a></li>
								</ul>


							</div>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade in active" id="user${i.count}">
									<div class="row">
										<div>
											<ul class="nav navbar-collapse" style="line-height: 3">
												<li class="text-info"><span class="text-success">姓名:</span><span
													class="text-info">${order.address.reciver}</span></li>
												<li class="text-info"><span class="text-success">联系方式:</span>
													${order.address.tel}</li>
												<li class="text-info"><span class="text-success">收货地址:</span>${order.address.area}${order.address.detailaddress}</li>
											</ul>
										</div>
									</div>
									</p>
								</div>
								<div class="tab-pane fade" id="order${i.count}">
									<div class="row">
										<div>
											<ul class="nav navbar-collapse" style="line-height: 3">
												<li class="text-info"><span class="text-success">订单编号:</span><span
													class="text-info">${order.orderNum}</span></li>
												<li class="text-info"><span class="text-success">交易时间:</span>
													<fmt:formatDate value='${order.createDate}'
														pattern='yyyy-MM-dd HH:mm' /></li>
												<li class="text-info"><span class="text-success">订单总金额:</span>${order.total}元</li>
											</ul>
										</div>
									</div>
								</div>
							</div> <!--tab选项卡 end-->
						</td>
					</tr>
					<tr class="active">
						<th>序号</th>
						<th>图片</th>
						<th>图片名称</th>
						<th>单价(元)</th>
						<th>数量</th>
						<th>实付款(元)</th>
						<th>付款日期</th>
						<th>交易状态</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${order.items }" var="book">
						<tr>
							<td>${book.itemId}</td>
							<td><img src="${base}/images/${book.book_url}" /></td>
							<td>${book.book_name}</td>
							<td>${book.unit_price}</td>
							<td>${book.count}</td>
							<td>${book.allPrice}</td>
							<td><fmt:formatDate value='${order.createDate}'
									pattern='yyyy-MM-dd' /></td>
							<td>${order.orderStatus}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>


		</c:forEach>

	</div>
	<!--内容展示end-->
</div>
<!--分页begin-->
<div class="container">
	<div class="row text-center">
		<div class="col-md-12">
			<ul class="pagination">
				<li
					<c:if test="${!pageBean.isHavePrePage }">
				class="disabled"
			</c:if>><a
					href="javascript:nextPage(1)">&lt;&lt;</a></li>
				<li
					<c:if test="${!pageBean.isHavePrePage }">
				class="disabled"
			</c:if>>
					<a href="javascript:nextPage(${pageBean.pageNow-1})">&lt;</a>
				</li>

				<c:choose>
					<c:when test="${pageBean.totalPages <= 6 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="${pageBean.totalPages }" />
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pageBean.pageNow-2 }" />
						<c:set var="end" value="${pageBean.pageNow + 3}" />
						<c:if test="${begin < 1 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="6" />
						</c:if>
						<c:if test="${end > pageBean.totalPages }">
							<c:set var="begin" value="${pageBean.totalPages-5 }" />
							<c:set var="end" value="${pageBean.totalPages}" />
						</c:if>
					</c:otherwise>
				</c:choose>

				<c:forEach begin="${begin }" end="${end}" var="pageId">
					<c:choose>
						<c:when test="${pageBean.pageNow eq pageId }">
							<li class="active"><a href="">${pageId}</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="javascript:nextPage(${pageId})">${pageId}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>


				<li
					<c:if test="${!pageBean.isHaveNextPage }">
				class="disabled"
			</c:if>><a
					href="javascript:nextPage(${pageBean.pageNow+1})">&gt;</a></li>
				<li
					<c:if test="${!pageBean.isHaveNextPage }">
				class="disabled"
			</c:if>><a
					href="javascript:nextPage(${pageBean.totalPages})">&gt;&gt;</a></li>
				<li>
					<div id="search" class="input-group" style="positon: relative;">
						<input type="text" class="form-control"
							onchange="nextPage(this.value)" placeholder="跳转指定页" /> <span
							class="input-group-btn">
							<button class="btn btn-info btn-search">GO</button>
						</span>
					</div>
				</li>
				<li><a style="padding-top: 0px; border: 0px;"> <label>每页显示:</label>
						<select id="pageSize" class="form-control"
						style="width: 100px; display: inline;"
						onChange="displaySize(this)">
							<option value="2"
								<c:if test="${pageBean.pageSize==2}">
				selected
			</c:if>>2</option>
							<option value="4"
								<c:if test="${pageBean.pageSize==4}">
				selected
			</c:if>>4</option>
							<option value="6"
								<c:if test="${pageBean.pageSize==6}">
				selected
			</c:if>>6</option>
							<option value="8"
								<c:if test="${pageBean.pageSize==8}">
				selected
			</c:if>>8</option>
					</select> <label>条</label>
				</a></li>
			</ul>
		</div>
	</div>
	
	
	
	
</div>
<!--分页end-->
<script src="${base}/js/moment.js" type="text/javascript"
	charset="utf-8"></script>
<script src="${base}/js/bootstrap-datetimepicker.js"
	type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	function searchDate() {
		searchDay(datetimepicker.value, datetimepicker2.value);
	}
	function deleteOrder() {
		if(confirm("确认删除选中项目吗?")){
			
			var cks=document.getElementsByName("cks");
			var deletefail=false;
			
			for(var i=0;i<cks.length;i++){
				if(cks[i].checked){
					$.get("/Book_Store/permission/order/deleteOrder?orderid="+cks[i].value,function(data,status){
						if(data==1&&status=='success'){
						
						}else{
							deletefail=true;
						}
					});
				}
			}
		
			
			setTimeout(nextPage('${pageBean.pageNow}'), 2000);
			if(deletefail){
				alert("部分删除失败");
			}
		}
		
	}

	$('#datetimepicker').datetimepicker({
		format : 'YYYY-MM-DD'
	});
	$('#datetimepicker2').datetimepicker({
		format : 'YYYY-MM-DD'
	});
	
</script>
