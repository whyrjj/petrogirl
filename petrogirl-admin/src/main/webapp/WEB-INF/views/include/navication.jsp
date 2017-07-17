<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
	<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
		<div class="am-offcanvas-bar admin-offcanvas-bar">
			<div class="am-panel-group admin-sidebar-list" id="navigation">
				
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd" onclick="window.location.href='${ctx }${adminPath }/main${urlSuffix}'">
						<a href="javascript:void(0)"  class="am-panel-title">
							首页
						</a>
					</div>
				</div>
				
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#lang'}">
							<span class="am-icon-cc-visa"></span> 语言管理
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='lang' }">am-in</c:if>" id="lang">
						<shiro:hasPermission name="lang:list">
							<li>
								<a href="${ctx }${adminPath }/lang/list${urlSuffix}"  class="am-cf">
									<span class="am-icon-list-ul"></span> 列表
								</a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="lang:add">
							<li>
								<a href="${ctx }${adminPath }/lang/add${urlSuffix}"> 
									<span class="am-icon-plus"></span> 添加
								</a>
							</li>
						</shiro:hasPermission>
					</ul>
				</div>

				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#news'}">
							<span class="am-icon-newspaper-o"></span> 新闻管理 
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='news' }">am-in</c:if>" id="news">
						<shiro:hasPermission name="news:category:list">
							<li>
								<a href="${ctx }${adminPath }/news/category/list${urlSuffix}" > 
									<span class="am-icon-list-ul"></span> 类别列表
								</a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="news:category:add">
							<li>
								<a href="${ctx }${adminPath }/news/category/add${urlSuffix}"  class="am-cf"> 
									<span class="am-icon-plus"></span> 类别添加
								</a>
							</li>
						</shiro:hasPermission>
					</ul>
				</div>
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#article'}">
							<span class="am-icon-newspaper-o"></span> 文章管理 
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='article' }">am-in</c:if>" id="article">
						<shiro:hasPermission name="news:category:list">
							<li>
								<a href="${ctx }${adminPath }/article/category/list${urlSuffix}" > 
									<span class="am-icon-list-ul"></span> 类别列表
								</a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="news:category:add">
							<li>
								<a href="${ctx }${adminPath }/article/category/add${urlSuffix}"  class="am-cf"> 
									<span class="am-icon-plus"></span> 类别添加
								</a>
							</li>
						</shiro:hasPermission>
					</ul>
				</div>
				
				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#product'}">
							<span class="am-icon-newspaper-o"></span> 产品管理 
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='product' }">am-in</c:if>" id="product">
						<shiro:hasPermission name="product:category:list">
							<li>
								<a href="${ctx }${adminPath }/product/category/list${urlSuffix}" > 
									<span class="am-icon-list-ul"></span> 产品类别
								</a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="product:category:add">
							<li>
								<a href="${ctx }${adminPath }/product/category/add${urlSuffix}"  class="am-cf"> 
									<span class="am-icon-plus"></span> 类别添加
								</a>
							</li>
						</shiro:hasPermission>
					</ul>
				</div>

				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#depart'}">
							<span class="am-icon-sitemap"></span> 部门管理 
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='depart' }">am-in</c:if>" id="depart">
						<shiro:hasPermission name="depart:list">
							<li>
								<a href="${ctx }${adminPath }/depart/list${urlSuffix}" > 
									<span class="am-icon-list-ul"></span> 列表
								</a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="depart:add">
							<li>
								<a href="${ctx }${adminPath }/depart/add${urlSuffix}"  class="am-cf"> 
									<span class="am-icon-plus"></span> 添加
								</a>
							</li>
						</shiro:hasPermission>
					</ul>
				</div>

				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#user'}">
							<span class="am-icon-user"></span> 员工管理 
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='user' }">am-in</c:if>" id="user">
						<shiro:hasPermission name="user:list">
							<li>
								<a href="${ctx }${adminPath }/user/list${urlSuffix}"  class="am-cf">
									<span class="am-icon-list-ul"></span> 列表
								</a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="user:add">
							<li>
								<a href="${ctx }${adminPath }/user/add${urlSuffix}" > 
									<span class="am-icon-plus"></span> 添加
								</a>
							</li>
						</shiro:hasPermission>
					</ul>
				</div>

				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#permission'}">
							<span class="am-icon-street-view"></span> 角色管理 
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='permission' }">am-in</c:if>" id="permission">
						<shiro:hasPermission name="role:list">
							<li>
								<a href="${ctx }${adminPath }/permission/roleList${urlSuffix}" > 
									<span class="am-icon-list-ul"></span> 列表
								</a>
							</li>
						</shiro:hasPermission>
						<shiro:hasPermission name="role:add">
							<li>
								<a href="${ctx }${adminPath }/permission/addRole${urlSuffix}"  class="am-cf">
									<span class="am-icon-plus"></span> 添加
								</a>
							</li>
						</shiro:hasPermission>
					</ul>
				</div>

				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a type="display: block;" class="am-panel-title" data-am-collapse="{parent: '#navigation', target: '#profile'}">
							<span class="am-icon-smile-o"></span> 个人信息管理 
							<span class="am-icon-angle-right am-fr am-margin-right"></span>
						</a>
					</div>
					<ul class="am-list am-collapse admin-sidebar-sub <c:if test="${navIndex=='profile' }">am-in</c:if>" id="profile">
						<li>
							<a href="editPasswordUI" class="am-cf"> 
								<span class="am-icon-eraser"></span> 修改密码
							</a>
						</li>
					</ul>
				</div>

				<div class="am-panel am-panel-default">
					<div class="am-panel-hd">
						<a href="${ctx }${adminPath }/logout${urlSuffix}"> 
							<span class="am-icon-sign-out"></span> 注销
						</a>
					</div>
				</div>

				<div class="am-panel am-panel-default admin-sidebar-panel">
					<div class="am-panel-bd">
						<p>
							<span class="am-icon-tag"></span> wiki
						</p>
						<p>欢迎来到petrogirl办公平台!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
