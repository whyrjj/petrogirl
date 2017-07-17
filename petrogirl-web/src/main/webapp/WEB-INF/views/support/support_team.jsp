<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="support.index.title" /></title>
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
<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
<!--navbar end-->
<!--banner begin-->
<%@ include file="/WEB-INF/views/include/banner.jsp" %>
<!--banner end-->
<!--main begin-->
<div class="container">
    <!--service begin-->
    <%@ include file="/WEB-INF/views/include/service.jsp"%>
    <!--service end-->
    
    <!--product begin-->
    <!--pc show -->
    <%@ include file="/WEB-INF/views/include/product_pc_show.jsp"%>
    <!--phone show-->
    <%@ include file="/WEB-INF/views/include/product_phone_show.jsp"%>
    <!--phone show-->
    <!--product end-->

    <!--trip adviser begin-->
    <div class="trip-adviser">
        <h4><strong>Marketing and Partner Support</strong></h4>

        <p>Here we would like to introduce your company，product， figure to related Market ..</p>
        <p>Here we would like to represent your product and expanding in the world..</p>
        <p>Here we would like to invite you to be our valuable partner..</p>
        <p>Here we  would like to highlight your brand and make it shine and booming in the world…</p>
        <p>Here we are waiting for you to explore what we are seeking for …….</p>
        <p>Welcome you join for us !</p>
        <p>Welcome and Thanks for your friendly support !</p>
    </div>
    <!--trip adviser end-->

    <!--cooperate begin-->
    
    <c:if test="${fn:length(productCategories) > 0}">
	    <div class="cooperate-show">
	        <div class="cooperate-content">
	            <div class="arrow-down"></div>
	            <h4 class="cooperate-title"><span class="serial"></span>COOPERATE TEAM</h4>
	            <div class="cooperate-group clearfix">
	            
	            <c:forEach items="${productCategories}" var="item">
	                <div class="cooperate-list"><img src="${ctxStatic }/${item.imgPath}" width="150" title="cooerate-industry1"/></div>
	                </c:forEach> 
	                <%--
	                 <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry2"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry3"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry4"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry5"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry6"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry7"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry8"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry9"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry10"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry11"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry12"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry13"/></div>
	                <div class="cooperate-list"><img src="${ctxStatic }/assets/images/product_bg.png" width="150" title="cooerate-industry14"/></div>
	                --%>
	            </div>
	        </div>
	    </div>
    </c:if>
    <!--cooperate end-->

    <!--pg-footer begin-->
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    <!--pg-footer end-->
</div>
<!--main end-->
</body>
</html>