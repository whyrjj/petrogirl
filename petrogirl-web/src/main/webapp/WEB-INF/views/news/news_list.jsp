<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="news.title"/></title>
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
<c:set var="nav" value="news"></c:set>
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<!--navbar end-->
<!--banner begin-->
<%@ include file="/WEB-INF/views/include/banner.jsp" %>
<!--banner end-->
<!--main begin-->
<div class="container">
	<!--breadcrumb begin-->
    <ol class="breadcrumb margin-top-10">
        <li><a href="${ctx }/index"><i class="back-home-icon"></i> <spring:message code="index.home" /></a></li>
        <li><a href="${ctx }/news/index"><spring:message code="index.news" /></a></li>
        <li class="active"><spring:message code="news.title"/></li>
    </ol>
    </ol>
    <!--breadcrumb end-->

    <!-- news begin-->
    <div class="news-catalogue-group clearfix">
        <div class="catalogue-list" onclick="window.location.href='${ctx }/purchase/index'"><spring:message code="index.sourcing" /></div>
        <div class="catalogue-list" onclick="window.location.href='${ctx }/news/newList'"><spring:message code="index.office_club" /></div>
        <div class="catalogue-list" onclick="window.location.href='${ctx }/support/index'"><spring:message code="index.marketing_support" /></div>
        <div class="catalogue-list" onclick="window.location.href='${ctx }/trip/index'"><spring:message code="index.business_trip_management_and_operation" /></div>
    </div>
    <div class="news-container trip-adviser-news">
        <!--news list begin-->
        <div class="news-list-group">
            <ul>
	            <c:forEach items="${form.pageView.records }" var="category">
			        <li class="clearfix">
	                    <div class="news-list-img">
	                    	<img alt="" src="${downloadDomain }${category.imgPath }" style="max-height: 160px;max-width: 325px;">
	                    </div>
	                    <a href="javascript:window.location.href='${ctx}/news/index${urlSuffix }?queryBean.category.id=${category.id }'; " >
	                        <span class="serial"></span>
	                        <h5>${category.title }</h5>
	                        <p>${category.summary }</p>
	                    </a>
	                </li>
				</c:forEach>
            </ul>
            <form:form action="${ctx }${adminPath }/news/index${urlSuffix}" method="post" modelAttribute="form" class="am-form-inline">
			    <form:hidden id="pageIndex" path="pageView.currentpage" />
			    <form:hidden path="pageView.maxresult" />
			</form:form>
            <%@ include file="/WEB-INF/views/include/pagination.jsp" %>
        </div>
        <!--news list end-->
    </div>
    <!-- news end-->

    <!--pg-footer begin-->
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    <!--pg-footer end-->
</div>
<!--main end-->
</body>
</html>