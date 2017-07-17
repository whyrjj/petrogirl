<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>首页</title>

<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/lang/zh-cn/zh-cn.js"></script>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>
	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong>
				</div>
		    </div>
			
		    <div class="am-g">
		      <div class="am-u-sm-12">
		      	欢迎使用 petrogirl 内部管理平台
	      	  </div>
	    	</div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
