<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div>
	<div class="text-primary">
		<img src="${base}/images/bullet1.gif" alt="" title=""> <a
			href="#">${type.catename}</a>
	</div>
	<div class="row">
		<c:forEach items="${pageBean.pageDatas}" var="bk" varStatus="status">
			<div class="col-sm-6 col-md-3 wow fadeInLeft animated">
				<div class="thumbnail">
					<a href="${base}/book/detail?id=${bk.bookid}"><img src="${base}/images/${bk.imageurl}"
						alt="通用的占位符缩略图"></a>
					<div class="caption">
						<h3>${bk.name}</h3>
						<p>价格:${bk.newPrice}元&nbsp;&nbsp;作者:${bk.author}&nbsp;&nbsp;</p>
						<p>
							<a href="${base}/book/detail?id=${bk.bookid}"> 更多信息 </a>
						</p>
					</div>
				</div>
			</div>
		</c:forEach>


		<!--分页-->
		<div class="container">
			<ul class="pager">
				<li <c:if test="${!pageBean.isHavePrePage }">
				class="disabled"
			</c:if>><a href="javascript:nextPage(${pageBean.pageNow-1},${type.cateid})">&larr;上一页</a> </li>
			<li  <c:if test="${!pageBean.isHaveNextPage }">
				class="disabled"
			</c:if> ><a href="javascript:nextPage(${pageBean.pageNow+1},${type.cateid})">下一页&rarr;</a></li>
			</ul>
		</div>
	</div>
</div>
<script type="text/javascript">
function nextPage(page,type) {

	if(page>"${pageBean.totalPages}"||page<1){
		return;
	}
	$("#datatable"+type).load(
			"${base}/book/showData?now="+page+"&size=4&cate="+type);
}
</script>
