<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>添加部门</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
	function udpateNameNote() {
		var nameSpan = document.getElementById("nameNote");
		nameSpan.innerHTML = "*";

	}
</script>

</head>
<c:set var="navIndex" value="depart" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">
			<div class="am-cf am-padding">
				<div class="am-cf am-padding">
					<div class="am-fl am-cf">
						<strong class="am-text-primary am-text-lg">部门管理</strong> / <small>添加部门</small>
					</div>
				</div>
			</div>
			<form:form action="${ctx }${adminPath }/depart/add${urlSuffix}" method="post" modelAttribute="department" cssClass="am-form">
				<div class="am-g">
					<div class="am-u-sm-12">
						<table class="am-table am-table-striped table-main am-text-nowrap">
							<tr>
								<td>部门名称:</td>
								<td>
									<form:input path="name" cssClass="form-control" id="name" onfocus="udpateNameNote()"/>
								</td>
								<td>
									<span style="color: red" id="nameNote"> * 
										<c:if test="${exist }">该部门名在所属部门中已存在</c:if> 
										<c:if test="${noParent }">必须选择一个父级部门</c:if>
									</span>
									<span style="color: #0e90d2">部门名称</span>
								</td>
							</tr>
							<tr>
								<td>所属部门:</td>
								<td><select name="parentDepart.id" id="state">
										<c:forEach items="${departs }" var="depart">
											<option value="${depart.id }"
												<c:if test="${depart.id==form.parentDepart}">selected="selected"</c:if>>${ depart.name}
											</option>
										</c:forEach>
									</select>
								</td>
								<td>
									<span style="color: red">* </span>
									<span style="color: #0e90d2">所属部门</span>
								</td>
							</tr>

							<tr>
								<td colspan="3" align="center">
									<input type="submit" value="确&nbsp;&nbsp;认" class="am-btn am-btn-default" onclick="return check()" style="width: 280px; height: 45px; font-size: 16px"/>
								</td>
							</tr>
						</table>
						<hr />
						<p>注：管理部门添加</p>
					</div>
				</div>
			</form:form>
			
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
