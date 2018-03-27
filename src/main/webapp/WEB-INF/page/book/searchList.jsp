<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<ol class="breadcrumb">
		<li><a href="#">图书列表</a></li>
		<li><a href="#">${type}</a></li>
	</ol>
</div>

<div class="row">
	<c:forEach items="${pageBean.pageDatas}" var="bk" varStatus="status">
		<div class="col-sm-6 col-md-3 wow fadeInLeft animated">
			<div class="thumbnail">
				<a href="${base}/book/detail?id=${bk.bookid}"><img
					src="${base}/images/${bk.imageurl}" alt="通用的占位符缩略图"></a>
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
						<input type="text" class="form-control" onchange="nextPage(this.value)" placeholder="跳转指定页" /> <span
							class="input-group-btn">
							<button class="btn btn-info btn-search">GO</button>
						</span>
					</div>
				</li>
				<li><a style="padding-top: 0px; border: 0px;"> <label>每页显示:</label>
						<select id="pageSize" class="form-control"
						style="width: 100px; display: inline;" onChange="changeSize(this.value)">
							<option value="2" <c:if test="${pageBean.pageSize==2}">
				selected
			</c:if>>2</option>
							<option value="4" <c:if test="${pageBean.pageSize==4}">
				selected
			</c:if>>4</option>
							<option value="6" <c:if test="${pageBean.pageSize==6}">
				selected
			</c:if>>6</option>
							<option value="8" <c:if test="${pageBean.pageSize==8}">
				selected
			</c:if>>8</option>
					</select> <label>条</label>
				</a></li>
			</ul>
		</div>
	</div>
</div>
<!--分页end-->
