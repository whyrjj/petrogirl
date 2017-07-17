<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>
<html>
<head lang="zh">
  <meta charset="UTF-8">
  <title>用户登录</title>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <meta name="format-detection" content="telephone=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="alternate icon" type="image/png" href="/i/favicon.png">
  <link rel="stylesheet" href="${ctxStatic }/assets/styles/amazeui.min.css"/>
  
  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>petrogirl管理平台</h1>
    <p>www.petrogirl.com<br/>新机遇、新挑战、新市场</p>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <br>
    <br>

    <form:form action="${ctx }${adminPath }/login${urlSuffix}" method="post" modelAttribute="user" class="am-form">
      <label for="email">用户名:</label>
      	<input id="email" type="text" name="username" value="${user.username }"/>
      	<div>
      		<span class="am-badge am-badge-warning"><form:errors path="username"/></span>
		</div>
      <br>
      <label for="password">密码:</label>
      	<input id="password" type="password" name="password" value="${user.password }"/>
      	<div>
      		<span class="am-badge am-badge-warning"><form:errors path="password"/></span>
		</div>
      <br>
      <label for="rememberMe">
        <input id="rememberMe" name="rememberMe" type="checkbox" <c:if test="${param.rememberMe == 'on' }">checked="checked"</c:if>>
        记住密码
      </label>
      <br />
      <div class="am-cf">
        <input type="submit" value="　登 录　" class="am-btn am-btn-primary am-btn-sm am-fl">
        <input type="reset" value="　重 置　" class="am-btn am-btn-default am-btn-sm am-fr">
      </div>
    </form:form>
    <hr>
    <%@ include file="/WEB-INF/views/include/footer.jsp"%>
  </div>
</div>
</body>
</html>