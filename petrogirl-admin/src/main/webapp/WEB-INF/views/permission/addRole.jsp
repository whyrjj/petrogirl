<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>添加角色</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
function checkfm(form) {
	if (trim(form.name.value) == "") {
		alert("权限组名称不能为空！");
		form.name.focus();
		return false;
	}
	return true;
}
</script>

</head>
<c:set var="navIndex" value="permission" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
		      <strong class="am-text-primary am-text-lg">角色管理</strong> / <small>添加角色</small>
		    </div>
			
		    <div class="am-g">
				<div class="am-u-sm-12">

					<form:form action="${ctx }${adminPath }/permission/addRole${urlSuffix}" method="post" modelAttribute="role" cssClass="am-form">
						<div class="am-g">
							<div class="am-u-sm-12">
								<table
									class="am-table am-table-striped table-main am-text-nowrap">
									<tr>
										<td>角色名称：</td>
										<td>
											<form:input path="name" cssClass="form-control" id="name"/>
										</td>
									</tr>
									<tr>
										<td>选择权限：</td>
										<td>
											<c:forEach items="${privileges}" var="privilege" varStatus="statu">
												<c:if test="${statu.index%4==0}">
													<div class="am-g">
												</c:if>
													<div class="am-u-sm-3">
														<input id="permissions${statu.count}" name="permissions" type="checkbox" value="${privilege.name}"/><label for="permissions${statu.count}">${privilege.name}</label>
													</div>
												<c:if test="${statu.count%4==0}">
													</div>
												</c:if>
											</c:forEach>
											
										</td>
									</tr>
									<tr>
										<td colspan="3" align="center">
											<button class="am-btn am-btn-default"
												onclick="return check()"
												style="width: 280px; height: 45px; font-size: 16px">确&nbsp;&nbsp;认</button>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</form:form>
					<hr />
					<p>注：一个角色就代表一个权限组</p>
				</div>
			</div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
