<div class="pg-product-wrap clearfix">
    <c:forEach items="${productCategories }" var="productCategory" varStatus="statu">
		<c:if test="${statu.index==0 }">
			<div class="product-group">
		        <h3>01</h3>
		        <div class="product-detail">
		            <h4>${productCategory.title }</h4>
		            <p style="max-height: 140px;overflow-y: scroll;">${productCategory.summary }</p>
		            <div class="detail fixed-width" onclick="window.location.href='${ctx}/product/index${urlSuffix }?queryBean.category.id=${productCategory.id }'">View Detail <i class="arrow-right-icon"></i>
					</div>
		        </div>
		    </div>
		</c:if>
	</c:forEach>
    <ul class="product-group">
        <c:forEach items="${productCategories }" var="productCategory" varStatus="statu">
			<li class="product-list">
	            <div class="list-title"><span>NO.${statu.count }</span>${productCategory.title }</div>
	        </li>
		</c:forEach>
    </ul>
</div>