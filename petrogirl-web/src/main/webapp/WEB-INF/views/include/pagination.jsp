<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<div class="pg-navgiation clearfix">
    <nav>
        <spring:message code="common.pageHint" arguments="${form.pageView.totalrecord},${form.pageView.currentpage},${form.pageView.totalpage}"></spring:message>
        <ul class="pagination pull-right">
            <c:if test="${form.pageView.totalrecord>0}">
				<c:choose>
					<c:when test="${1 == form.pageView.currentpage}">
						<li class="disabled"><a href="javascript:void(0);">&laquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a onclick="toPage(${form.pageView.currentpage-1})">&laquo;</a></li>
					</c:otherwise>
				</c:choose>
				<c:forEach step="1" begin="${form.pageView.pageindex.startindex}" end="${form.pageView.pageindex.endindex}" varStatus="sta">
					<c:if test="${(sta.index>form.pageView.currentpage-3||sta.index>form.pageView.currentpage+3)&&sta.index!=form.pageView.currentpage}">
						<li>
							<a onclick="toPage(${sta.index})">${sta.index}</a>
						</li>
					</c:if>
					<c:if test="${sta.index == form.pageView.currentpage}">
						<li class="active">
							<a onclick="javascript:void(0);">${sta.index}</a>
						</li>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${form.pageView.pageindex.endindex == form.pageView.currentpage}">
						<li class="disabled"><a href="javascript:void(0);">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a onclick="toPage(${form.pageView.currentpage+1})">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			</c:if>
        </ul>
    </nav>
</div>