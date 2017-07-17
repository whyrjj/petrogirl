<div class="pgphone-product-wrap">
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <c:forEach items="${productCategories }" var="productCategory" varStatus="statu">
		        <div class="swiper-slide product-list">
                <h3 class="list-title">${statu.count }</h3>
	                <div class="product-detail">
	                    <h3>${productCategory.title }</h3>
	                    <p>${productCategory.summary }</p>
	                    <div class="detail fixed-width" onclick="window.location.href='${ctx}/product/index${urlSuffix }?queryBean.category.id=${productCategory.id }'">View Detail <i class="arrow-right-icon"></i>
						</div>
	                </div>
	            </div>
			</c:forEach>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
    </div>
</div>