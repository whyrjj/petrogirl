<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><spring:message code="index.title"/></title>
		<%@ include file="/WEB-INF/views/include/head.jsp"%>
	</head>
	<body>
		<!--navbar begin-->
		<c:set var="nav" value="index"></c:set>
		<%@ include file="/WEB-INF/views/include/navbar.jsp" %>
		<!--navbar end-->
		<!--banner begin-->
		<%@ include file="/WEB-INF/views/include/banner.jsp" %>
		<!--banner end-->
		<!--main begin-->
		<div class="container">
			<!--service begin-->
			<%@ include file="/WEB-INF/views/include/service.jsp"%>
			<!--service end-->
			
			<!--product begin-->
		    <!--pc show -->
		    <%@ include file="/WEB-INF/views/include/product_pc_show.jsp"%>
		    <!--phone show-->
		    <%@ include file="/WEB-INF/views/include/product_phone_show.jsp"%>
		    <!--phone show-->
		    <!--product end-->
	
			<!--news begin-->
			<div class="pg-news">
				<div class="pg-news-title">
					<span><spring:message code="index.news" /></span>
				</div>
				<div class="pg-news-body">
					<div class="swiper-container">
						<div class="swiper-wrapper">

						
							<c:forEach items="${newsCategories }" var="newsCategory" varStatus="statu">
								
								<div class="swiper-slide">
									<h4>${newsCategory.title }</h4>
									<p>${newsCategory.summary }</p>
									<div class="detail fixed-width" onclick="window.location.href='${ctx}/news/index${urlSuffix }?queryBean.category.id=${newsCategory.id }'">
										View Detail <i class="arrow-right-icon"></i>
									</div>
								</div>
								
							</c:forEach>
							
							
							
							
						</div>
						<!-- Add Pagination -->
						<div class="swiper-pagination"></div>
						<!-- Add Arrows -->
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
				</div>
			</div>
			<!--news end-->
	
			<!--industry news begin-->
			<div class="pg-industry">
				<div class="row">
					<div class="col-md-6">
						<div class="industry-list clearfix" style="min-height: 135px;">
							<div class="industry-bg pull-left">
								<img src="${downloadDomain }${news[0].imgPath}" alt=""/>
							</div>
							<div class="industry-detail pull-left">
								<h5>
									<strong>${news[0].title }</strong>
								</h5>
								<p>${news[0].content}</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="industry-list clearfix" style="min-height: 135px;">
							<div class="industry-bg pull-left">
							<img src="${downloadDomain }${news[0].imgPath}" alt=""/>
							</div>
							<div class="industry-detail pull-left">
								<h5>
									<strong>${news[1].title }</strong>
								</h5>
								<p>${news[1].content}</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--industry news end-->
	
			<!--pg-footer begin-->
			<%@ include file="/WEB-INF/views/include/footer.jsp"%>
			<!--pg-footer end-->
		</div>
		<!--main end-->
	</body>
</html>