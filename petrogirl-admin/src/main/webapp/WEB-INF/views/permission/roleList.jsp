<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>权限组显示</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

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
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">权限</strong> / <small>权限列表</small></div>
		    </div>
		    
		    
			<form:form action="${ctx }${adminPath }/permission/list${urlSuffix}" method="post" modelAttribute="form" class="am-form-inline">
			    <form:hidden id="pageIndex" path="pageView.currentpage" />
			    <form:hidden path="pageView.maxresult" />
			</form:form>
			
			<div class="am-g">
		      <div class="am-u-sm-12">
					<table class="am-table am-table-striped table-main">
					
						<thead>
							 <tr align="center">
						 		<td>名称</td>
						      	<td>修改</td>
						      	<td>修改</td>
						    </tr>
						</thead>
						
						<tbody>
							<!---------------------------LOOP START------------------------------>
							<c:forEach items="${form.pageView.records}" var="entry">
							    <tr align="center">
							      <td> 
							      		${entry.name}
							      </td>
							      <td> 
							      		<a href='${ctx }${adminPath }/permission/editRole${urlSuffix}?name=${entry.name}'>修改<img src="${ctxStatic }/assets/images/edit.png" width="15" height="16" border="0"></a>
							      </td>
							      <td> 
							      		<a href='${ctx }${adminPath }/permission/delRole${urlSuffix}?name=${entry.name}'>删除</a>
							      </td>
								</tr>
							</c:forEach>
							<!----------------------LOOP END------------------------------->
							
							<tr> 
						     	 <td colspan="4">
						              <input type="button" class="am-btn am-btn-default" onClick="window.location.href='${ctx }${adminPath }/permission/addRole${urlSuffix}'" value="添加角色"> &nbsp;&nbsp;
						            </td>
						          </tr>
						</tbody>
					</table>
		        <hr />
		        <p>注：列表</p>
	      		</div>
	    	</div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
