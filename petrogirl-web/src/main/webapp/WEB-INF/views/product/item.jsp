<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <title>PRODUCT LIST</title>
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
                <li class="active"><a href="#"><i class="product-icon"></i>PRODUCTS</a></li>
                <li><a href="#"><i class="news-icon"></i>NEWS</a></li>
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
<div class="container product-container">
    <!--breadcrumb begin-->
    <ol class="breadcrumb margin-top-10">
        <li><a href="#"><i class="back-home-icon"></i> HOME</a></li>
        <li class="active">PRODUCTS</li>
    </ol>
    <!--breadcrumb end-->

    <!--product list begin-->
    <div class="row">
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>TOP DRIVE SPARE PARTS</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>WELLHEAD CONTROL EQUIPMENT</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>SOLID CONTROL EQUIPMENT</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>SLING AND LIFTING EQUIPMENT</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>DOWNHOLE TOOLS</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>DREAMWORK AND MUD PUMP PARTS</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>HANDLING TOOLS</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>WELL COMPLETION TOOLS</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="products-list">
                <div class="products-bg">
                    <!--<img src="" alt=""/>-->
                </div>
                <div class="products-body">
                    <h4>BUSINESS TRIP MANAGEMENT</h4>
                    <P>This is a brief introduction of product types,this is a briefintroduction of product types</P>
                </div>
            </div>
        </div>
    </div>
    <!--product list end-->

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