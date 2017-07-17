<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!doctype html>
<html>
<head>
 <title>添加员工</title>

<%@ include file="/WEB-INF/views/include/head.jsp"%>
<script type="text/javascript">
function check() {
	//用户名字
	var name = document.getElementById("name");
	if (name.value.trim() == "") {
		alert("姓名不能为空");
		return false;
	}
	//用户名
	var username = document.getElementById("username");
	if (username.value.trim() == "") {
		alert("用户名不能为空");
		return false;
	}
	//密码
	var password = document.getElementById("password");
	if (password.value.trim() == "") {
		alert("密码不能为空");
		return false;
	}
	
}
  </script>
<style type="text/css">
	.OrgBox{
		font-size:14px;
		clear:left;
		float:left;
		text-align:center;
		position:absolute;
		background-image:url(${ctxStatic }/assets/images/org1.png);
		width:80px;
		height: 26px;
		cursor: pointer;
	}
	
	.OrgBox img{
		width:60px;
		height:10px;
	}
	.OrgBox div{
		color:#FFA500;
		font-weight:800;
	}
	
	input[type="radio"], input[type="checkbox"] {
		margin: 0; 
		line-height: normal;
	}
	#divxx{
		clear: both;
		width: 300px;
	}
}
</style>
<script>
// var box = document.getElementById('OrgBox');
 //box.onclick
function CookieGroup(obj) {
	//alert(123)	
	var input = obj.getElementsByTagName("input");
	input[0].checked = "checked";
}

 	function nameNote() {
 		var nameNote = document.getElementById('nameNote');
 		nameNote.innerHTML = "*";
 	}

</script>
<script type="text/javascript" src="${ctxStatic }/assets/scripts/organization.js"></script>

</head>
<c:set var="navIndex" value="user" scope="request" />
<body>
	<%@ include file="/WEB-INF/views/include/top.jsp"%>

	<div class="am-cf admin-main">
		<!-- sidebar start -->
		<jsp:include page="/WEB-INF/views/include/navication.jsp" />
		<!-- sidebar end -->

		<!-- content start -->
		<div class="admin-content">

			<div class="am-cf am-padding">
	      <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">员工管理</strong> / <small>添加员工</small></div>
	    </div>
		<form:form action="${ctx }${adminPath }/user/add${urlSuffix}" method="post" modelAttribute="user" cssClass="am-form">
		    <div class="am-g">
		      <div class="am-u-sm-12">
					<table class="am-table am-table-striped table-main am-text-nowrap">
						<tr>
							<td>姓名:</td>
							<td>
								<form:input path="name" cssClass="form-control" id="name"/>
							</td>
							<td><span style="color:red">* </span><span style="color:#0e90d2">员工姓名</span></td>
						</tr>
						
						<tr>
							<td>性别:</td>
							<td>	<select name="gender" id="state" >
						<c:forEach items="${genders }" var="gender">
							<option value="${gender }" <c:if test="${form.gender.index==gender.index}">selected="selected"</c:if>>${gender }</option>
						</c:forEach>
					</select></td>
							<td><span style="color:red">* </span><span style="color:#0e90d2">员工性别</span></td>
						</tr>
						
						<tr>
							<td>用户名:</td>
							<td>
								<form:input path="username" cssClass="form-control" id="name"/>			
							</td>
							<td><span style="color:red" id="nameNote"> *<c:if test="${exits }">(该用户名已存在)</c:if></span><span style="color: #0e90d2">用户登录名</span></td>
						</tr>
						
						<tr>
							<td>用户密码：</td>
							<td><input type=text class=form-control value="" id="password" name="password" /></td>
							<td><span style="color: red" id="nameNote"> *</span><span style="color: #0e90d2">用户密码</span></td>
						</tr>
						
						<tr style="position: relative; height: 200px;">
							<td>所属部门:</td>
							<td >
								<div  style="position: relative;" id='divxx'>
									<script type="text/javascript">
			
						var a = new OrgNode();
						a.customParam.department="petrol";
						a.customParam.departId="-1";
						
					
					
						<c:forEach items="${departs }" var="depart" varStatus="i">
							var b${i.index } = new OrgNode();
							b${i.index }.customParam.department="${depart.name}";
							b${i.index }.customParam.departId="${depart.id}";
							<c:if test="${user.depart==depart.id}">
								b${i.index }.customParam.chek = "checked='cheked'";
							</c:if>
							<c:if test="${user.depart==0 || user.depart==-1 || empty user.depart}">
								b${i.index }.customParam.chek = "checked='cheked'";
							</c:if>
							
							a.Nodes.Add(b${i.index });
							
							
							<c:forEach items="${depart.departs }" var="subDepart" varStatus="j">
								var d${i.index }${j.index } = new OrgNode();
								d${i.index }${j.index }.customParam.department="${subDepart.name}";
								d${i.index }${j.index }.customParam.departId="${subDepart.id}";
								<c:if test="${user.depart==subDepart.id}">
									d${i.index }${j.index }.customParam.chek = "checked='cheked'";
								</c:if>
								b${i.index }.Nodes.Add(d${i.index }${j.index });
								
								<c:forEach items="${subDepart.departs }" var="subDepart1" varStatus="k">
									var e${i.index }${j.index }${k.index } = new OrgNode();
									e${i.index }${j.index }${k.index }.customParam.department="${subDepart1.name}";
									e${i.index }${j.index }${k.index }.customParam.departId="${subDepart1.id}";
									d${i.index }${j.index }.Nodes.Add(e${i.index }${j.index }${k.index });
									
									<c:if test="${user.depart==subDepart1.id}">
										e${i.index }${j.index }${k.index }.customParam.chek = "checked='cheked'";
									</c:if>
									
									<c:forEach items="${subDepart1.departs }" var="subDepart2" varStatus="m">
										var f${i.index }${j.index }${k.index }${m.index } = new OrgNode();
										f${i.index }${j.index }${k.index }${m.index }.customParam.department="${subDepart2.name}";
										f${i.index }${j.index }${k.index }${m.index }.customParam.departId="${subDepart2.id}";
										e${i.index }${j.index }${k.index }.Nodes.Add(f${i.index }${j.index }${k.index }${m.index });
										<c:if test="${user.depart==subDepart2.id}">
											f${i.index }${j.index }${k.index }${m.index }.customParam.chek = "checked='cheked'";
										</c:if>
									</c:forEach>
									
								</c:forEach>
							</c:forEach>
							var OrgShows=new OrgShow(b${i.index });
							OrgShows.Top=30;
							OrgShows.Left=0;
							OrgShows.IntervalWidth=10;
							OrgShows.IntervalHeight=20;
							//OrgShows.ShowType=2;
							//OrgShows.BoxHeight=100;
							OrgShows.BoxTemplet="<div id=\"{Id}\" class=\"OrgBox\" onclick=\"CookieGroup(this)\"><div><input type='radio' name='depart.id' value='{departId}' {chek}></input>  {department}</div></div>";
							OrgShows.Run()
						</c:forEach>
						
					</script>
								</div>
							</td>
							<td></td>
							<%-- <td><span style="color:red">* </span><span style="color:#0e90d2">联系地址</span></td> --%>
						</tr>
						<tr>
							<td colspan="3" align="center">
							
								<button class="am-btn am-btn-default" onclick="return check()" style="width:280px;height:45px;font-size:16px">确&nbsp;&nbsp;认</button>
							
							</td>
						</tr>
					</table>
		        <hr />
		        <p>注：员工添加</p>
	      		</div>
	    	</div>
	    	</form:form>
		</div>
		<!-- content end -->

	</div>
	<a class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
