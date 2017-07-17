<%@ page language="java" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta name="author" content="whyrjj"/>
<meta name="keywords" content="petrogirl,petrleum,petro"/>
<link rel="stylesheet" href="${ctxStatic }/assets/styles/dd.css"/>
<link rel="stylesheet" href="${ctxStatic }/assets/styles/flags.css"/>
<link rel="stylesheet" href="${ctxStatic }/assets/styles/sprite.css"/>
<link rel="stylesheet" href="${ctxStatic }/lib/bootstrap/dist/css/bootstrap.min.css"/>
<link rel="stylesheet" href="${ctxStatic }/lib/swiper/css/swiper.min.css"/>
<link rel="stylesheet" href="${ctxStatic }/assets/styles/main.css"/>

<script src="${ctxStatic}/lib/jquery.min.js"></script>
<script src="${ctxStatic}/lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="${ctxStatic}/lib/swiper/js/swiper.min.js"></script>
<script src="${ctxStatic}/assets/scripts/script.js"></script>
<script src="${ctxStatic}/assets/scripts/jquery.dd.min.js"></script>
<script type="text/javascript">
	function selectLang() {
		var langSelect = document.getElementById("countries");
		window.location.href="${ctx}/language?language="+langSelect.value;
	}
</script>
<script type="text/javascript">var ctx = '${ctx}', ctxStatic='${ctxStatic}';</script>