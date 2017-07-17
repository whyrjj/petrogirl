<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
<title>部门列表</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>

<script type="text/javascript" src="${ctxStatic }/assets/scripts/organization.js"></script>
<style type="text/css">
.OrgBox{
	font-size:14px;
	padding:5px 5px 5px 5px;
	clear:left;
	float:left;
	text-align:center;
	position:absolute;
	background-image:url(${ctxStatic }/assets/images/org1.png);
	width:80px;
	height: 26px;
}
.OrgBox img{
	width:60px;
	height:10px;
}
.OrgBox div{
	color:#FFA500;
	font-weight:800;
}

#divxx {
	clear: both;
	height: 200px;
}
</style>
<script>
function CookieGroup(){
	//alert(123)	
}
</script>
</head>
<c:set var="navIndex" value="depart" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">
			<div class="am-cf am-padding">
		      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">部门管理</strong> / <small>部门管理列表</small></div>
				<div id="divxx" style="position:relative;">
					<script type="text/javascript">
		
		
			
			<c:forEach items="${departs }" var="depart" varStatus="i">
				var b${i.index } = new OrgNode();
				b${i.index }.customParam.department="${depart.name}";
				
				
				<c:forEach items="${depart.departs }" var="subDepart" varStatus="j">
					var d${i.index }${j.index } = new OrgNode();
					d${i.index }${j.index }.customParam.department="${subDepart.name}";
					b${i.index }.Nodes.Add(d${i.index }${j.index });
					
					<c:forEach items="${subDepart.departs }" var="subDepart1" varStatus="k">
						var e${i.index }${j.index }${k.index } = new OrgNode();
						e${i.index }${j.index }${k.index }.customParam.department="${subDepart1.name}";
						d${i.index }${j.index }.Nodes.Add(e${i.index }${j.index }${k.index });
						
						
						
						<c:forEach items="${subDepart1.departs }" var="subDepart2" varStatus="m">
							var f${i.index }${j.index }${k.index }${m.index } = new OrgNode();
							f${i.index }${j.index }${k.index }${m.index }.customParam.department="${subDepart2.name}";
							e${i.index }${j.index }${k.index }.Nodes.Add(f${i.index }${j.index }${k.index }${m.index });
						</c:forEach>
						
						
					</c:forEach>
					
				</c:forEach>
				var OrgShows=new OrgShow(b${i.index });
				OrgShows.Top=50;
				OrgShows.Left=50;
				OrgShows.IntervalWidth=10;
				OrgShows.IntervalHeight=20;
				//OrgShows.ShowType=2;
				//OrgShows.BoxHeight=100;
				OrgShows.BoxTemplet="<div id=\"{Id}\" class=\"OrgBox\" onclick=\"CookieGroup()\"><div>{department}</div></div>";
				OrgShows.Run();
			</c:forEach>
		
	
			
		</script>
				</div>
		     	<hr />
		        <p>注：管理部门列表</p>
		    </div>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
		data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
