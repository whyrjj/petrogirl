<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!-- Collect the nav links, forms, and other content for toggling -->
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav navbar-right">
        <li <c:if test="${nav=='index' }">class="active"</c:if>><a href="${ctx }/index"><i class="home-icon"></i><spring:message code="index.home" ></spring:message> </a></li>
        <li <c:if test="${nav=='product' }">class="active"</c:if>><a href="${ctx}/product/category"><i class="product-icon"></i><spring:message code="index.product" ></spring:message></a></li>
        <li <c:if test="${nav=='news' }">class="active"</c:if>><a href="${ctx }/news/newList"><i class="news-icon"></i><spring:message code="index.news" ></spring:message></a></li>
        <li <c:if test="${nav=='contact' }">class="active"</c:if>><a href="${ctx }/contact/index"><i class="contact-icon"></i><spring:message code="index.contact_us" ></spring:message></a></li>
    </ul>
</div><!-- /.navbar-collapse -->