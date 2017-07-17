<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title><spring:message code="trip.index.title" /></title>
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

		<!--trip adviser begin-->
		<div class="trip-adviser">
			<h4>
				<strong>BUSINESS TRIP ADVISER</strong>
			</h4>

			<p>We would like to give the best suggestion what we know from
				china to GCC countries, pls click here to get more details.</p>
			<p>What documents will prepared before you plan to visit ?</p>
			<p>What points of attention need to know ?</p>
			<p>What's the nature condition and envirement for the country you
				visited ?</p>
			<p>What's the contact details for the goverment in GCC ?</p>
			<p>Check here and we would like to support you !</p>
			<p>Welcome to apply visa,booking hotel and airticket all here in
				one solution !</p>
		</div>
		<!--trip adviser end-->

		<!-- news begin-->
		<div class="news-container trip-adviser-news">
			<!--news list begin-->
			<div class="news-list-group">
				<ul>

					<c:forEach items="${form.pageView.records }" var="category">
						<li class="clearfix">
							<div class="news-list-img">
								<img alt="" src="${downloadDomain }${category.imgPath }"
									style="max-height: 160px; max-width: 325px;">
							</div> <a
							href="javascript:window.location.href='${ctx}/news/index${urlSuffix }?queryBean.category.id=${category.id }'; ">
								<span class="serial"></span>
								<h5>${category.title }</h5>
								<p>${category.content }</p>
						</a>
						</li>
					</c:forEach>
					<!--  <li class="clearfix">
                    <div class="news-list-img"></div>
                    <a href="javascript:;" class="pull-left">
                        <span class="serial"></span>
                        <h5>WORLD OBSERVE  TO Oman</h5>
                        <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                            of more into the news pages.click open the details of news headline.</p>
                    </a>
                </li>
                <li class="clearfix">
                    <div class="news-list-img"></div>
                    <a href="javascript:;" class="pull-left">
                        <span class="serial"></span>
                        <h5>WORLD OBSERVE  TO Saudi Arabia</h5>
                        <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                            of more into the news pages.click open the details of news headline.</p>
                    </a>
                </li>
                <li class="clearfix">
                    <div class="news-list-img"></div>
                    <a href="javascript:;" class="pull-left">
                        <span class="serial"></span>
                        <h5>WORLD OBSERVE  TO Qatar</h5>
                        <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                            of more into the news pages.click open the details of news headline.</p>
                    </a>
                </li> -->
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
		<!-- news end-->

		<!--pg-footer begin-->
		<%@ include file="/WEB-INF/views/include/footer.jsp"%>
		<!--pg-footer end-->
	</div>
	<!--main end-->
</body>
</html>