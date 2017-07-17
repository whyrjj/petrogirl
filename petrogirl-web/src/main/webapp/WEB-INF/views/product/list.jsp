<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="product.title" /></title>
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
<nav class="pg-navbar navbar navbar-green navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:;"><img src="${ctxStatic }/assets/images/logo.png" height="50" alt="petrelum girl"/></a>
        </div>
        

        <%@ include file="/WEB-INF/views/include/nav.jsp" %>
        
    </div><!-- /.container-fluid -->
</nav>
<!--navbar end-->
<!--banner begin-->
<div class="pg-banner-wrap">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active one">
                <!--<img src="../assets/images/banner01.png" alt="...">-->
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item two">
                <!--<img src="../assets/images/banner02.png" alt="...">-->
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item three">
                <!--<img src="../assets/images/banner03.png" alt="...">-->
                <div class="carousel-caption">
                </div>
            </div>
            <div class="item four">
                <!--<img src="../assets/images/banner04.png" alt="...">-->
                <div class="carousel-caption">
                </div>
            </div>
        </div>
    </div>
</div>
<!--banner end-->
<!--main begin-->
<div class="container news-container product-container">
    <!--breadcrumb begin-->
    <ol class="breadcrumb margin-top-10">
        <li><a href="${ctx }/index"><i class="back-home-icon"></i> <spring:message code="index.home" /></a></li>
        <li><a href="${ctx }/product/category"><i class="product-icon"></i> <spring:message code="product.category.title" /></a></li>
        <li class="active"><spring:message code="index.product" /></li>
    </ol>
    <!--breadcrumb end-->

    <!-- news begin-->
    <div class="pg-industry">
    	<c:forEach items="${form.pageView.records }" var="note">
			<div class="industry-list clearfix">
	            <div class="industry-bg pull-left">
	                <img alt="" src="${downloadDomain }${note.imgPath }">
	            </div>
	            <div class="industry-detail pull-left">
	                <h4 class="text-theme"><strong>${note.title }</strong></h4>
	                <p>${note.content }</p>
	            </div>
	        </div>
		</c:forEach>
        
    </div>
    <!-- news end-->
    <form:form action="${ctx }${adminPath }/product/index${urlSuffix}" method="post" modelAttribute="form" class="am-form-inline">
		    <form:hidden id="pageIndex" path="pageView.currentpage" />
		    <form:hidden path="pageView.maxresult" />
			
	</form:form>

    <div class="pg-navgiation clearfix">
        <nav>
            <spring:message code="common.pageHint" arguments="${form.pageView.totalrecord},${form.pageView.currentpage},${form.pageView.totalpage}"></spring:message>
            <ul class="pagination pull-right">
                <c:if test="${form.pageView.totalrecord>0}">
					<c:choose>
						<c:when test="${1 == form.pageView.currentpage}">
							<li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a onclick="toPage(${form.pageView.currentpage-1})">&laquo;</a></li>
						</c:otherwise>
					</c:choose>
					<c:forEach step="1" begin="${form.pageView.pageindex.startindex}" end="${form.pageView.pageindex.endindex}" varStatus="sta">
						<c:if test="${(sta.index>form.pageView.currentpage-3||sta.index>form.pageView.currentpage+3)&&sta.index!=form.pageView.currentpage}">
							<li>
								<a onclick="toPage(${sta.index})">${sta.index}</a>
							</li>
						</c:if>
						<c:if test="${sta.index == form.pageView.currentpage}">
							<li class="active">
								<a onclick="javascript:void(0);">${sta.index}</a>
							</li>
						</c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${form.pageView.pageindex.endindex == form.pageView.currentpage}">
							<li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
						</c:when>
						<c:otherwise>
							<li><a onclick="toPage(${form.pageView.currentpage+1})">&raquo;</a></li>
						</c:otherwise>
					</c:choose>
				</c:if>
                
            </ul>
        </nav>
    </div>

    <!--pg-footer begin-->
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    <!--pg-footer end-->
</div>
<!--main end-->
</body>
</html>