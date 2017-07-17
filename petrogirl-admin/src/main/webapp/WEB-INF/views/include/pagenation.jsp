<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<script type="text/javascript">
	function toPage(page){
		if (parseInt(page)<1) {
			alert("已经是第一页");
		}else if(parseInt(page)>parseInt('${form.pageView.totalpage }') && parseInt('${form.pageView.totalpage }')>1){
			alert("已经是最后一页");
		}else {
			var form = document.forms[0];
			form.pageIndex.value = page;
			form.submit();
		}
	}
	
	function query() {
		toPage(1);
	}
</script>

<div class="am-cf">
  共 ${form.pageView.totalrecord} 条记录,当前第 ${form.pageView.currentpage}/${form.pageView.totalpage} 页
  <div class="am-fr">
    <ul class="am-pagination">
     	 <c:if test="${form.pageView.totalrecord>0}">
			<c:choose>
				<c:when test="${1 == form.pageView.currentpage}">
					<li class="am-disabled"><a href="javascript:void(0);">«</a></li>
				</c:when>
				<c:otherwise>
					<li><a onclick="toPage(${form.pageView.currentpage-1})">«</a></li>
				</c:otherwise>
			</c:choose>
			<c:forEach step="1" begin="${form.pageView.pageindex.startindex}" end="${form.pageView.pageindex.endindex}" varStatus="sta">
				<c:if test="${(sta.index>form.pageView.currentpage-3||sta.index>form.pageView.currentpage+3)&&sta.index!=form.pageView.currentpage}">
					<li>
						<a onclick="toPage(${sta.index})">${sta.index}</a>
					</li>
				</c:if>
				<c:if test="${sta.index == form.pageView.currentpage}">
					<li class="am-active">
						<a onclick="toPage(${sta.index})">${sta.index}</a>
					</li>
				</c:if>
			</c:forEach>
			<c:choose>
				<c:when test="${form.pageView.pageindex.endindex == form.pageView.currentpage}">
					<li class="am-disabled"><a href="javascript:void(0);">»</a></li>
				</c:when>
				<c:otherwise>
					<li><a onclick="toPage(${form.pageView.currentpage+1})">»</a></li>
				</c:otherwise>
			</c:choose>
		</c:if>
    </ul>
  </div>
</div>
