<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>添加语言</title>

<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctxStatic }/assets/scripts/ueditor/lang/zh-cn/zh-cn.js"></script>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
	  	function check() {
			/* var name = $("#name").val();
			if (name=="") {
				alert("语言名称不能为空! ");
				return false;
			}
			return true; */
		}
  </script>

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
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">语言</strong> / <small>添加</small>
				</div>
		    </div>
			
		    <div class="am-g">
		      <div class="am-u-sm-12">
		      	<form:form action="${ctx }${adminPath }/lang/add${urlSuffix}" method="post" modelAttribute="longuage" cssClass="am-form">
					<table class="am-table am-table-striped table-main am-text-nowrap">
						<tr>
							<td>语言名称</td>
							<td>
								<form:select path="id">
								    <form:options items="${longuages}" />
								</form:select>
							</td>
							<!-- form-control -->
						</tr>
						
						<tr>
							<td colspan="2" align="center">
								<button class="am-btn am-btn-primary" onclick="return check()" style="width:280px;height:45px;font-size:16px; color: black;">确&nbsp;&nbsp;认</button>
							</td>
						</tr>
					</table>
				   </form:form>
		        <hr />
		        <p>注：语言添加</p>
	      		</div>
	    	</div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
