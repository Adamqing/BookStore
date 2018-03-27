<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!--购物车 begin-->
<!--外层div-->
<div class="container">
	<!--左边-->
	<div class="col-md-8 col-sm-12">
		<ol class="breadcrumb">
			<li><a href="#" class="text-success"><span
					class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;送货地址</a></li>
		</ol>

		<!--送货地址  begin-->
		<div style="margin-bottom: 5px;" id="addrDiv">
			<ul class="list-group" id="address">
				<c:forEach items="${adds}" var="address" varStatus="i">
					
					<!-- char类型为48代表0 -->
					<c:if test="${address.isDefault eq 49}" var="isDef"> 
						<li class="list-group-item">
						<input type="radio" name="addr" value="${address.addressid}"checked>&nbsp;
							${address.area}&nbsp;${address.detailaddress}
							<span class="text-success">默认地址</span>
						</li>
					</c:if>
					<c:if test="${i.count<4&&!isDef}" var="isShow"> 
						<li class="list-group-item">
						<input type="radio" name="addr" value="${address.addressid}">&nbsp;
						${address.area}&nbsp;${address.detailaddress}
						</li>
					</c:if>
					<c:if test="${!isDef&&!isShow}"> 
					<li class="list-group-item hidden">
						<input type="radio" name="addr" value="${address.addressid}">&nbsp;
						${address.area}&nbsp;${address.detailaddress}
						</li>
					</c:if>
				</c:forEach>

			</ul>
			<a href="#" class="text-info" onclick="dispalyMoreAddr(this)">更多地址↓&nbsp;&nbsp;</a>
			<a href="javascript:void(0)" id="addAddr" class="text-success"
				data-toggle="modal" data-target="#addressModel">添加新地址</a>
		</div>
		<hr>


		<!--添加新地址模态框 begin-->
		<!-- 模态框（Modal） -->
		<div class="modal fade" id="addressModel" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">
							<span class="glyphicon glyphicon-home"></span>&nbsp;&nbsp;添加新收货地址
						</h4>
					</div>
					<div class="modal-body">
						<!--登录的form表单-->
						<form action="${base}/permission/order/addAddress" method="post" id="registerAddress" class="form-horizontal" role="form">
							<div class="form-group">
								<label class="col-md-2 control-label"
									style="margin-right: 2.9%;">所在地区:</label>

								<div data-toggle="distpicker">
									<div class="form-group col-sm-12 col-md-3">
										<label class="sr-only" for="province1">Province</label> <select
											class="form-control" id="province1"></select>
									</div>
									<div class="form-group col-sm-12 col-md-3">
										<label class="sr-only" for="city1">City</label> <select
											class="form-control" id="city1"></select>
									</div>
									<div class="form-group col-sm-12 col-md-3">
										<label class="sr-only" for="district1">District</label> <select
											class="form-control" id="district1"></select>
									</div>
								</div>
							</div>
							<div class="form-group has-feedback" style="clear: both">
								<input type="hidden" id="areatext"  name="area">
								<label for="deatails" class="col-sm-2 control-label">详细地址:</label>
								<div class="col-sm-5">
									<textarea class="form-control" id="deatails" name="detailaddress"></textarea>
								</div>

							</div>
							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">邮政编码</label>
								<div class="col-md-5">
									<input type="text" class="form-control"  id="emailcode" name="emailcode"
										placeholder="邮政编码"> <span
										class="glyphicon glyphicon-hand-left form-control-feedback"></span>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-5">
									<input type="text" class="form-control" name="reciver" id="reciver"
										placeholder="收货人姓名"> <span
										class="glyphicon glyphicon-user form-control-feedback"></span>
								</div>
							</div>

							<div class="form-group has-feedback">
								<label class="col-sm-2 control-label">电话</label>
								<div class="col-sm-5">
									<input type="tel" class="form-control" id="tel" name="tel"
										placeholder="合法手机格式"> <span
										class="glyphicon glyphicon-phone form-control-feedback"></span>
								</div>
							</div>

							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-10">
									<div class="checkbox">
										<label> <input type="checkbox" name="isDef" value="1" id="setDefaultAddr"><span
											class="text-success">设置默认地址</span>
										</label>
									</div>
								</div>
							</div>

							<div class="modal-footer">
								<button type="button" id="closeAddress" class="btn btn-default"
									data-dismiss="modal">关闭</button>
								<input type="button" onclick="addAddress()" class="btn btn-primary" value="提交地址">
							</div>
						</form>
						<!--form结束-->
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
		</div>
		<!--左边-->
		<ol class="breadcrumb">
			<li><a href="#" class="text-success"><span
					class="glyphicon glyphicon-list-alt"></span>&nbsp;&nbsp;结算清单</a></li>
		</ol>
		<div class="table-responsive" id="imgDiv">
			<table class="table table-hover table-striped"
				style="vertical-align: middle;">
				<thead>
					<tr class="text-success success">
						<th id="sequence">ISBN序号</th>
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
							<td>${item.book_isbn}</td>
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
						<td colspan="4"></td>
						<td class="text-success">总价:</td>
						<td class="text-success">${cart.total}元</td>
					</tr>
					<tr style="background-color: white;">
						<td><a href="${base}/book/index" class="btn btn-info">&lt;&lt;继续购买</a>
						</td>
						<td colspan="4"></td>
						<td><a href="javascript:comformOrder()" class="btn btn-warning">提交订单</a>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>


	</div>
	<jsp:include page="/WEB-INF/page/comm/righter.jsp"></jsp:include>
</div>



<script src="${base}/dist/js/distpicker.data.min.js"></script>
<script src="${base}/dist/js/distpicker.min.js"></script>
<script src="${base}/js/details.js" type="text/javascript"
	charset="utf-8"></script>
<script src="${base}/js/confirm_order.js"></script>
<script type="text/javascript">
function comformOrder(){
	var addrs=document.getElementsByName("addr");
	var addid="0";
	for(var i=0;i<addrs.length;i++){
		if(addrs[i].checked){
			addid=addrs[i].value;
		}
	}
	if(addid=="0"){
		alert('请选择收货地址!');
	}else{

		$.ajax({
			type:"post"
			,url:"${base}/permission/order/payOrder"
			,data:"addid="+addid
			,async:false
			,error:function(request){
				alert("结算失败");
			}
			,success:function(data){
				
				if(data==1){
					alert("结算成功");
					window.location="${base}/permission/order/index?pageid=2";
				}else{
					alert(data);
				}
			}
				
		
	});
	}
	
}
	
function addAddress(){
	var prvince =province1.value;
	var city =city1.value;
	if(city==""){
		alert("至少选择到市");
		return;
	}
	var district =district1.value;
	
	areatext.value=prvince+city+district;
	
		$.ajax({
			type:"post"
			,url:"${base}/permission/order/addAddress"
			,data:$("#registerAddress").serialize()
			,async:false
			,error:function(request){
				alert("添加失败");
			}
			,success:function(data){
				if(data==1){
					alert("地区不能为空");
				}else if(data==2){
					alert("地区详细不能为空");
				}else if(data==3){
					alert("邮编格式错误");
				}else if(data==4){
					alert("收件人不能为空");
				}else if(data==5){
					alert("电话号码格式错误");
				}else {
					closeAddress.click();
					var addrs=JSON.parse(data);
					var address= document.getElementById("address");
					var li=document.createElement("li");
					li.setAttribute("class", "list-group-item");
					li.innerHTML="<input checked type='radio' name='addr' value='"+addrs.addressid+"' >&nbsp;"
					+addrs.area+"&nbsp;"+addrs.detailaddress;
					address.appendChild(li);
					
				}
			}
				
		
	});
	
	}
</script>

