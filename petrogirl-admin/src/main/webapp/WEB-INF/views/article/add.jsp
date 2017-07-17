<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>添加新闻</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
	$(function() {
		if ($('#newImg').html() == "") {
			$("#sure").attr({
				disabled : "true"
			});
		}
		var data = $('#event').AmazeuiUpload({url : '${ctx }${adminPath }/file/uploadImg${urlSuffix}', selectMultiple: false}); 
		data.comp = function(data) {
			$('#newImg').attr('src', data.domain + data.path); 
			$('#newPath').val(data.path);
			$("#sure").removeAttr("disabled");
		}
	});
  </script>

</head>
<c:set var="navIndex" value="article" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">新闻</strong> / <small>添加</small>
				</div>
		    </div>
			
		    <div class="am-g">
		      <div class="am-u-sm-12">
		      	<form:form action="${ctx }${adminPath }/article/add${urlSuffix}" method="post" modelAttribute="article" cssClass="am-form">
		      	
		      		<form:hidden path="imgPath" id="newPath" />
		      		<form:hidden path="category.id" />
					<table class="am-table am-table-striped table-main am-text-nowrap">
						<tr>
							<td>文章类别</td>
							<td>${category.title}</td>
						</tr>
						<tr>
							<td>语言</td>
							<td>
								<c:forEach items="${languages }" var="language"><c:if test="${language.id == category.lang }">${language.name }</c:if></c:forEach>
							</td>
						</tr>
						<tr>
							<td>图片</td>
							<td>
								<div id="event"></div>
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<img id="newImg" src="${ctxStatic }/assets/images/industry_bg.png" class="am-img-responsive am-img-thumbnail" style="height: 95px;width: 150px;"/>
							</td>
						</tr>
						
						<tr>
							<td>标题</td>
							<td>
								<form:input path="title"/>
							</td>
						</tr>
						
						<tr>
							<td>内容</td>
							<td>
								<form:textarea path="content"/>
							</td>
						</tr>
						
						<tr>
							<td colspan="2" align="center"><input type="submit" class="am-btn am-btn-danger" value="确定" id="sure" /></td>
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
