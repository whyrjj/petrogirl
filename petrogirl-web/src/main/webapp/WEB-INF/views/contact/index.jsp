<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title><spring:message code="contact.title" ></spring:message></title>
    <%@ include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
<!--navbar begin-->
<c:set var="nav" value="contact"></c:set>
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
        <li class="active"><spring:message code="index.contact_us" /></li>
    </ol>
    <!--breadcrumb end-->
    <!--contact begin-->
    <div class="contact-container">
        <div class="row">
            <div class="col-md-6">
                <div class="contact-bg">
                    <img src="${ctxStatic }/assets/images/contact_bg.png" alt="...">
                </div>
            </div>
            <div class="col-md-6">
                <div class="contact-detail">
                    <div class="way mail"><i class="mail-icon"></i><spring:message code="contact.email" />: <span class="text-theme">info@petrogirl.com</span></div>
                    <div class="way addr"><i class="addr-icon"></i><spring:message code="contact.add" />: <span class="text-theme">This is address</span></div>
                    <div class="way tel"><i class="tel-icon"></i><spring:message code="contact.phone" />: <span class="text-theme">+971 10501859999</span></div>
                </div>
            </div>
        </div>
    </div> 
    <!--pg-footer begin-->
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
    <!--pg-footer end-->
    <!--contact end-->
</div>
<!--main end-->
</body>
</html>