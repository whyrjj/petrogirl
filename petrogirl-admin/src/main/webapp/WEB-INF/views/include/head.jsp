<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="${ctxStatic }/assets/images/favicon.png">
  <link rel="apple-touch-icon-precomposed" href="${ctxStatic }/assets/images/app-icon72x72@2x.png">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="${ctxStatic }/assets/styles/amazeui.min.css"/>
  <link rel="stylesheet" href="${ctxStatic }/assets/styles/admin.css">
  <link rel="stylesheet" href="${ctxStatic }/assets/styles/amazeui.upload.css"/>
	
	<!--[if (gte IE 9)|!(IE)]><!-->
	<script src="${ctxStatic }/assets/scripts/jquery.min.js"></script>
	<script src="${ctxStatic }/assets/scripts/amazeui.min.js"></script>
	<script src="${ctxStatic }/assets/scripts/amazeui.upload.js"></script> 
	<script src="${ctxStatic }/assets/scripts/amazeui.upload.template.js"></script> 
	<script src="${ctxStatic }/assets/scripts/amazeui.upload.event.js"></script>
	
	<!--<![endif]-->
	<script src="${ctxStatic }/assets/scripts/app.js"></script>
	<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>
	
	<style type="text/css">
    .am-list>li:hover {
      background-color: #f5f5f5;
    }
    .am-list>li {
      border: none;
    }
    .admin-sidebar-list li a {
	  color: #5c5c5c;
	  padding-left: 24px;
	}
    </style>