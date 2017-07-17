<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="product.category.title" /></title>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
    
    <script type="text/javascript">
		function toPage(page){
			if (parseInt(page)<1) {
				alert("已经是第一页");
			}else if(parseInt(page)>parseInt('${form.pageView.totalpage }') && parseInt('${form.pageView.totalpage }')>1){
				alert("已经是最后一页");
			}else {
				var form = document.forms[0];
				form.pageIndex.value = page;
				form.submit();
			}
		}
		
		function query() {
			toPage(1);
		}
	</script>
    
</head>
<body>
<!--navbar begin-->
<c:set var="nav" value="product"></c:set>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<!--navbar end-->
<!--banner begin-->
<%@ include file="/WEB-INF/views/include/banner.jsp" %>
<!--banner end-->
<!--main begin-->
<div class="container news-container product-container">
    <!--breadcrumb begin-->
    <ol class="breadcrumb margin-top-10">
        <li><a href="${ctx }/index"><i class="back-home-icon"></i> <spring:message code="index.home" /></a></li>
        <li class="active"><spring:message code="product.category.title" /></li>
    </ol>
    <!--breadcrumb end-->

    <!--product list begin-->
    <div class="row">
        <c:forEach items="${form.pageView.records }" var="category">
	        <div class="col-md-4">
	            <div class="products-list" onclick="window.location.href='${ctx}/product/index${urlSuffix }?queryBean.category.id=${category.id }'">
	                <div class="products-bg">
	                    <img alt="" src="${downloadDomain }${category.imgPath }" style="max-height: 160px;max-width: 325px;">
	                </div>
	                <div class="products-body">
	                    <h4>${category.title }</h4>
	                    <P>${category.summary }</P>
	                </div>
	            </div>
	        </div>
		</c:forEach>
    </div>
    <!--product list end-->
    <form:form action="${ctx }${adminPath }/product/index${urlSuffix}" method="post" modelAttribute="form" class="am-form-inline">
		    <form:hidden id="pageIndex" path="pageView.currentpage" />
		    <form:hidden path="pageView.maxresult" />
			
	</form:form>
	
	<%@ include file="/WEB-INF/views/include/pagination.jsp" %>

    <!--pg-footer begin-->
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!--pg-footer end-->
</div>
<!--main end-->
</body>
</html>