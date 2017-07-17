<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="index.sourcing" /></title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>

<script type="text/javascript">
	function toPage(page) {
		if (parseInt(page) < 1) {
			alert("已经是第一页");
		} else if (parseInt(page) > parseInt('${form.pageView.totalpage }')
				&& parseInt('${form.pageView.totalpage }') > 1) {
			alert("已经是最后一页");
		} else {
			var form = document.forms[0];
			form.pageIndex.value = page;
			form.submit();
		}
	}

	function query() {
		toPage(1);
	}
</script>

</head>
<body>
	<!--navbar begin-->
	<%@ include file="/WEB-INF/views/include/navbar.jsp"%>
	<!--navbar end-->
	<!--banner begin-->
	<%@ include file="/WEB-INF/views/include/banner.jsp"%>
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

		<!--采购支持描述和产品列表只显示其中一个内容-->
		<!--purchase support begin-->
		<div class="purchase-support">
			<h4>
				<strong>Sourcing your critical needs quickly.</strong>
			</h4>

			<p>We specialize in…</p>

			<p>Urgent orders</p>
			<p>Hard to find items</p>
			<p>Obsolete items</p>
			<p>Delivered to your door.</p>

			<p>At here, we offer high-caliber, expedited procurement services
				and personalized customer care for the oil & gas and mining
				industries.</p>

			<p>We have one life of experience in sourcing and delivering hard
				to find, or obsolete parts and equipment for our customers. We
				understand that your time and money are precious. Our large, well
				established network of manufacturers, suppliers & freight handlers,
				our leveraged buying power, our reputation, our knowledge and many
				years of experience allow us to work quickly for you.</p>

			<p>Our friendly, efficient and knowledgeable staff are here for
				you.</p>
		</div>
		<!--purchase support end-->

		<!--采购支持描述和产品列表只显示其中一个内容-->
		<!-- product list begin-->
		<div class="news-container trip-adviser-news">
			<!--news list begin-->
			<div class="news-list-group">
				<ul>
					<c:forEach items="${form.pageView.records }" var="producut">
						<li class="active clearfix">
							<div class="news-list-img">
								<img alt="" src="${downloadDomain }${category.imgPath }"
									style="max-height: 160px; max-width: 325px;">
							</div> <a
							href="${ctx}/product/index${urlSuffix }?queryBean.category.id=${category.id }'">
								<span class="serial"></span>
								<h5>${category.title }</h5>
								<p>${category.summary }</p>
						</a>
						</li>
					</c:forEach>
					<li class="clearfix">
						<div class="news-list-img"></div> <a href="javascript:;"> <span
							class="serial"></span>
							<h5>TOP DRIVE SPARE PARTS - PRODUCT 02</h5>
							<p>The news content is put in this position,the news occupies
								a space around the bulton switch,home place 5 should be
								enough,or use the home display function recommended, click on
								the lower right conrner of more into the news pages.click open
								the details of news headline.</p>
					</a>
					</li>
					<li class="clearfix">
						<div class="news-list-img"></div> <a href="javascript:;"> <span
							class="serial"></span>
							<h5>TOP DRIVE SPARE PARTS - PRODUCT 03</h5>
							<p>The news content is put in this position,the news occupies
								a space around the bulton switch,home place 5 should be
								enough,or use the home display function recommended, click on
								the lower right conrner of more into the news pages.click open
								the details of news headline.</p>
					</a>
					</li>
					<li class="clearfix">
						<div class="news-list-img"></div> <a href="javascript:;"> <span
							class="serial"></span>
							<h5>TOP DRIVE SPARE PARTS - PRODUCT 04</h5>
							<p>The news content is put in this position,the news occupies
								a space around the bulton switch,home place 5 should be
								enough,or use the home display function recommended, click on
								the lower right conrner of more into the news pages.click open
								the details of news headline.</p>
					</a>
					</li>
					<li class="clearfix">
						<div class="news-list-img"></div> <a href="javascript:;"> <span
							class="serial"></span>
							<h5>TOP DRIVE SPARE PARTS - PRODUCT 05</h5>
							<p>The news content is put in this position,the news occupies
								a space around the bulton switch,home place 5 should be
								enough,or use the home display function recommended, click on
								the lower right conrner of more into the news pages.click open
								the details of news headline.</p>
					</a>
					</li>
				</ul>
				<form:form action="${ctx }${adminPath }/news/index${urlSuffix}"
					method="post" modelAttribute="form" class="am-form-inline">
					<form:hidden id="pageIndex" path="pageView.currentpage" />
					<form:hidden path="pageView.maxresult" />
				</form:form>
				<%@ include file="/WEB-INF/views/include/pagination.jsp"%>
			</div>
			<!--news list end-->
		</div>
		<!-- product list end-->

		<!--pg-footer begin-->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<!--pg-footer end-->
	</div>
	<!--main end-->
</body>
</html>