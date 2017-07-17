<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>语言列表</title>

<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/lang/zh-cn/zh-cn.js"></script>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

</head>
<c:set var="navIndex" value="lang" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">语言</strong> / <small>列表</small>
				</div>
		    </div>
			
		    <div class="am-g">
		      <div class="am-u-sm-12">
		      	<form:form action="${ctx }${adminPath }/lang/list${urlSuffix}" method="post" modelAttribute="longuage" cssClass="am-form">
					<table class="am-table am-table-striped table-main">
						<thead>
							<tr>
								<th>ID</th>
								<th>名称</th>
							</tr>
						</thead>
						
						<tbody>
							<c:forEach items="${languages }" var="language">
								<tr>
									<td>${language.id }</td>
									<td>${language.name }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				   </form:form>
		        <hr />
		        <p>注：语言列表</p>
	      		</div>
	    	</div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
