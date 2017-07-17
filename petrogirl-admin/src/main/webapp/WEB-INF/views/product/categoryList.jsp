<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>产品类型列表</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

</head>
<c:set var="navIndex" value="product" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">
			<div class="am-cf am-padding">
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">产品</strong> / <small>产品类型列表</small>
			  </div>
		    </div>
		    
		    
			<form:form action="${ctx }${adminPath }/product/category/list${urlSuffix}" method="post" modelAttribute="form" class="am-form-inline">
			    <form:hidden id="pageIndex" path="pageView.currentpage" />
			    <form:hidden path="pageView.maxresult" />
			</form:form>
			
			    <div class="am-g">
			      <div class="am-u-sm-12">
						<table class="am-table am-table-striped am-table-hover table-main">
						
							<thead>
								<tr class="tr">
									<th>标题</th>
									<th>语言</th>
									<th>提交时间</th>
									<th>操作</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach items="${form.pageView.records }" var="category">
									<tr>
										<td style="color:yellow"><a href="${ctx }${adminPath }/product/list${urlSuffix}?queryBean.category.id=${category.id }">${category.title }</a></td>
										<td>${category.lang }</td>
										<td><fmt:formatDate value="${category.date}"  type="both"  pattern="yyyy-MM-dd"/></td>
										<td>
											<a type="button" href="${ctx }${adminPath }/product/list${urlSuffix}?queryBean.category.id=${category.id }"  class="am-btn am-btn-primary am-btn-sm">
												详细
											</a>
											<a type="button" href="${ctx }${adminPath }/product/add${urlSuffix}?category.id=${category.id }"  class="am-btn am-btn-primary am-btn-sm">
												添加产品
											</a>
											 　　
											<a type="button" href="${ctx }${adminPath }/product/category/del${urlSuffix}?id=${category.id }" class="am-btn am-btn-primary am-btn-sm">
												删除
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@include file="/WEB-INF/views/include/pagenation.jsp" %>
			        <hr />
			        <p>产品类型列表</p>
		      		</div>
		    	</div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
