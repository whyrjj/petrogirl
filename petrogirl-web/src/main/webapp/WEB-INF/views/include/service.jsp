<div class="pg-service-wrap">
	<div class="row">
		<div class="col-md-6">
			<div class="service-list green" onclick="window.location.href='${ctx }/purchase/index'">
				<div class="service-list-item">
					<spring:message code="index.sourcing" />
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="service-group clearfix">
				<div class="service-list purple" onclick="window.location.href='${ctx }/news/newList'">
					<div class="service-list-item">
						<spring:message code="index.office_club" />
					</div>
				</div>
				<div class="service-list pink" onclick="window.location.href='${ctx }/support/index'">
					<div class="service-list-item">
						<spring:message code="index.marketing_support" />
					</div>
				</div>
			</div>
			<div class="service-list blue" onclick="window.location.href='${ctx }/trip/index'">
				<div class="service-list-item">
					<spring:message code="index.business_trip_management_and_operation" />
				</div>
			</div>
		</div>
	</div>
</div>