<%@ taglib prefix="shiro" uri="/WEB-INF/tlds/shiros.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:set var="ctxStatic" value="${pageContext.request.contextPath}/static"/> 
<c:set var="urlSuffix" value="${fns:getUrlSuffix()}"/>
<c:set var="adminPath" value="${fns:getAdminPath()}"/>
<c:set var="imgPath" value="${fns:getAdminPath()}"/>
<c:set var="downloadDomain" value="${fns:getDictValue('downloadDomain', 'http://www.petrogirl.com:8080')}"/>
