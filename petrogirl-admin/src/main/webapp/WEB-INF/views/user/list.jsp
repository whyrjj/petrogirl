<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>员工列表</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
	function toPage(page) {
		if (parseInt(page) < 1) {
			alert("已经是第一页");
		} else if (parseInt(page) > parseInt('${page.totalpage }')
				&& parseInt('${page.totalpage }') > 1) {
			alert("已经是最后一页");
		} else {
			var form = document.forms[0];
			form.page.value = page;
			form.submit();
		}
	}

	function query() {
		toPage(1);
	}
	var username=null;
	function authority(name) {
		username=name;
		$.get("${ctx }${adminPath }/permission/changePermission${urlSuffix}?username=" + name,
						{},
						function(data) {
							$(".am-modal-bd").remove();
							$(".am-modal-hd").after(
									"<div class='am-modal-bd'></div>");

							var employeePrivilege = data.has;
							var Privilege = data.all;
							var has = false;
							for (var j = 0; j < Privilege.length; j++) {
								has = false;
								for (var i = 0; i < employeePrivilege.length; i++) {
									if (employeePrivilege[i] == Privilege[j]) {
										//alert(employeePrivilege[i]);
										$(".am-modal-bd")
												.append(
														"<div style='display:inline-block;margin-left:10px;float:left;'><input type='checkbox' value='"+Privilege[j]+"' checked name='roles' id='"+("a"+j)+"'><label for='"+("a"+j)+"'>"
																+ Privilege[j]
																+ "</label></div>");
										has = true;
										break;
									}
								}
								if (!has) {
									$(".am-modal-bd")
											.append(
													"<div style='display:inline-block;margin-left:10px;float:left;'><input type='checkbox' value='"+Privilege[j]+"' name='roles' id='"+("a"+j)+"'><label for='"+("a"+j)+"'>"
													+ Privilege[j]
													+ "</label></div>");
								}
							}
							$(".am-modal-bd")
							.append("<div style='clear:both'>");
						}, 'json');
	}

	function changed() {
		if(username!=null){
		$.post("${ctx }${adminPath }/permission/changePermission${urlSuffix}?username="+username, 
				$("#permission1").serialize(),
				function(data) {
			
				}, 'json');}
	}
	function changeEmplyoee(name){
		var a="#emplyoee"+name;
		var b="#emplyoee1"+name;
		
		var permission=$(a).text();
		if(permission=="禁用"){
			$.post("changeEmplyoee?form.username="+name,{},function(data){
				if(data.msg=='false'){
					alert("修改失败");
				}else{
					$(a).text('启用');
					$(b).text('false');
				}
			},'json');	
		}
		if(permission=="启用"){
			$.post("changeEmplyoee?form.username="+name,{},function(data){
				if(data.msg=='false'){
					alert("修改失败");
				}else{
					$(a).text('禁用');
					$(b).text('true');
				}
			},'json');	
		}
		
	}
</script>
</head>
<c:set var="navIndex" value="user" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
				<div class="am-fl am-cf">
					<strong class="am-text-primary am-text-lg">员工管理</strong> / <small>员工管理</small>
				</div>
			</div>
			<form:form action="${ctx }${adminPath }/user/list${urlSuffix}" method="post" modelAttribute="form" class="am-form-inline">
			    <form:hidden id="pageIndex" path="pageView.currentpage" />
			    <form:hidden path="pageView.maxresult" />

				<div>
					<div>
						<form:input path="queryBean.name" cssClass="am-form-field input-medium search-query" placeholder="姓名" id="searchInput" style="width:150px;"/>
						<form:input path="queryBean.username" cssClass="am-form-field input-medium search-query" placeholder="用户名" style="width:150px;"/>
						<select name="queryBean.depart.id" id="state" style="margin-left: 10px; margin-right: 10px;">
							<option value="-2">所有</option>
							<option value="-1">顶级部门</option>
							<c:forEach items="${departs }" var="depart">
								<option value="${depart.id }"
									<c:if test="${depart.id==form.queryBean.depart.id}">selected="selected"</c:if>>${ depart.name}</option>
							</c:forEach>
						</select> 
						<span>
							<button class="am-btn am-btn-default" onclick="query()">查询</button>
						</span>
					</div>
				</div>



				<div class="am-g">
					<div class="am-u-sm-12">
						<table class="am-table am-table-striped am-table-hover table-main">

							<thead>
								<tr>
									<th>姓名</th>
									<th>部门</th>
									<th>用户名</th>
									<th>性别</th>
									<th>状态</th>
									<th>操作</th>
									<th>权限操作</th>
								</tr>
							</thead>

							<tbody>
								<c:forEach items="${form.pageView.records }" var="emploee">
									<tr>
										<td>${emploee.name }</td>
										<td>${emploee.depart.name }</td>
										<td>${emploee.username }</td>
										<td>${emploee.gender }</td>
										<td  id="emplyoee1${emploee.username }">${emploee.enable }</td>
										<td>修改
										<a href="javascript:void(0)" class="am-btn-link" onclick="changeEmplyoee('${emploee.username }')" id="emplyoee${emploee.username }"><c:choose ><c:when test="${emploee.enable }">禁用</c:when><c:otherwise>启用</c:otherwise></c:choose></a></td>
										<td><a href="javascript:void(0)"
											class="am-btn am-btn-success"
											onclick="authority('${emploee.username }')"
											data-am-modal="{target: '#my-alert'}">查看</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<%@include file="/WEB-INF/views/include/pagenation.jsp" %>
						<hr />
						<p>注：员工管理列表</p>
					</div>
				</div>
			</form:form>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	
	<!-- 模态窗口操作区 -->
	<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
		<div class="am-modal-dialog">
			<form id="permission1" method="post">
				<div class="am-modal-hd">权限编辑</div>
				<div class="am-modal-bd"></div>
				<div class="am-modal-footer">
					<span class="am-modal-btn" data-am-modal-cancel>取消</span> <span
						class="am-modal-btn" data-am-modal-confirm onclick="changed()">提交</span>
				</div>
			</form>
		</div>
	</div>
	
</body>
</html>
