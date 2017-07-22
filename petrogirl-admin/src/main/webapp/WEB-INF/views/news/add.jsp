<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>
	<c:choose>
		<c:when test="${news.id == null}">
			添加
		</c:when>
		<c:otherwise>
			修改
		</c:otherwise>
	</c:choose>
	新闻</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
	$(function() {
		if ($('#newPath').val() == "") {
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
<c:set var="navIndex" value="news" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">新闻</strong> / <small>
				  <c:choose>
					  <c:when test="${news.id == null}">
						  添加
					  </c:when>
					  <c:otherwise>
						  修改
					  </c:otherwise>
				  </c:choose>
			  </small>
				</div>
		    </div>
			
		    <div class="am-g">
		      <div class="am-u-sm-12">
		      	<form:form action="${ctx }${adminPath }/news/add${urlSuffix}" method="post" modelAttribute="news" cssClass="am-form">
		      	
		      		<form:hidden path="imgPath" id="newPath" />
		      		<form:hidden path="category.id" />
					<form:hidden path="id"/>
					<table class="am-table am-table-striped table-main am-text-nowrap">
						<tr>
							<td>新闻类别</td>
							<td>${news.category.title}</td>
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
								<c:choose>
									<c:when test="${news.imgPath != null}">
										<img id="newImg" src="${downloadDomain }${news.imgPath}" class="am-img-responsive am-img-thumbnail" width="150px" height="95px"/>150x95
									</c:when>
									<c:otherwise>
										<img id="newImg" src="${ctxStatic }/assets/images/industry_bg.png" class="am-img-responsive am-img-thumbnail" width="150px" height="95px"/>150x95
									</c:otherwise>
								</c:choose>
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
		        <p>注：语言
					<c:choose>
						<c:when test="${news.id == null}">
							添加
						</c:when>
						<c:otherwise>
							修改
						</c:otherwise>
					</c:choose>
				</p>
	      		</div>
	    	</div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
