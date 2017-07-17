<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NEWS</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="../lib/bootstrap/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../lib/swiper/css/swiper.min.css"/>
    <link rel="stylesheet" href="../assets/styles/main.css"/>
</head>
<body>
<!--navbar begin-->
<nav class="pg-navbar navbar navbar-green navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="javascript:;"><img src="../assets/images/logo.png" height="50" alt="petrelum girl"/></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><i class="home-icon"></i>HOME</a></li>
                <li><a href="#"><i class="product-icon"></i>PRODUCTS</a></li>
                <li class="active"><a href="#"><i class="news-icon"></i>NEWS</a></li>
                <li><a href="#"><i class="contact-icon"></i>CONTACT US</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<!--navbar end-->
<!--banner begin-->
<div class="pg-banner-wrap">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active one">
                <!--<img src="../assets/images/banner01.png" alt="...">-->
                <div class="carousel-caption">
                    è¿æ¯ç¬¬ä¸å¼ 
                </div>
            </div>
            <div class="item two">
                <!--<img src="../assets/images/banner02.png" alt="...">-->
                <div class="carousel-caption">
                    è¿æ¯ç¬¬äºå¼ 
                </div>
            </div>
            <div class="item three">
                <!--<img src="../assets/images/banner03.png" alt="...">-->
                <div class="carousel-caption">
                    è¿æ¯ç¬¬ä¸å¼ 
                </div>
            </div>
            <div class="item four">
                <!--<img src="../assets/images/banner04.png" alt="...">-->
                <div class="carousel-caption">
                    è¿æ¯ç¬¬åå¼ 
                </div>
            </div>
        </div>
    </div>
</div>
<!--banner end-->
<!--main begin-->
<div class="container news-container">
    <!--breadcrumb begin-->
    <ol class="breadcrumb margin-top-10">
        <li><a href="#"><i class="back-home-icon"></i> HOME</a></li>
        <li class="active">NEWS</li>
    </ol>
    <!--breadcrumb end-->

    <!-- news begin-->
    <div class="pg-industry">
        <div class="row">
            <div class="col-md-6">
                <div class="industry-list clearfix">
                    <div class="industry-bg pull-left">
                        <!--<img src="" alt=""/>-->
                    </div>
                    <div class="industry-detail pull-left">
                        <h4 class="text-theme"><strong>RECOMMENDED NEWS 01</strong><i class="arrow-rightw-icon"></i></h4>
                        <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                            of more into the news pages.click open the details of news headline.</p>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="industry-list clearfix">
                    <div class="industry-bg pull-left">
                        <!--<img src="" alt=""/>-->
                    </div>
                    <div class="industry-detail pull-left">
                        <h4 class="text-theme"><strong>RECOMMENDED NEWS 02</strong><i class="arrow-rightw-icon"></i></h4>
                        <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                            of more into the news pages.click open the details of news headline.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- news end-->

    <!--news list begin-->
    <div class="news-list-group">
        <ul>
            <li class="active">
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 01</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 02</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 03</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 04</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 05</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 06</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 07</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 08</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 09</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
            <li>
                <a href="javascript:;">
                    <span class="serial"></span>
                    <h5>NEWS HEADLINES 10</h5>
                    <p>The news content is put in this position,the news occupies a space around the bulton switch,home place 5 should be enough,or use the home display function recommended, click on the lower right conrner
                        of more into the news pages.click open the details of news headline.</p>
                </a>
            </li>
        </ul>
        <div class="pg-navgiation clearfix">
            <nav>
                <ul class="pagination pull-right">
                    <li><a href="#">&laquo;</a></li>
                    <li class="active"><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&raquo;</a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!--news list end-->

    <!--pg-footer begin-->
    <div class="pg-footer">
        <div class="mail"><i class="mail-icon"></i>Customer service E-mail: <span class="text-theme">info@petrogirl.com</span></div>
        <div class="tel"><i class="tel-icon"></i>Phone call: <span class="text-theme">+971 10501859999</span></div>
    </div>
    <!--pg-footer end-->
</div>
<!--main end-->
<script src="../lib/jquery.min.js"></script>
<script src="../lib/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="../lib/swiper/js/swiper.min.js"></script>
<script src="../assets/scripts/script.js"></script>
<script>

</script>
</body>
</html>