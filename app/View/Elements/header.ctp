<!DOCTYPE html>
<html lang="zh">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><?php echo $title_meta;?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <?php 
      // SEO description meta
      echo $this->Html->meta('description', $description_meta);
    ?>
    <?php 
      // CSS
      echo $this->Html->css(array('bootstrap.min', 'modern-business', 'style'), array('media' => 'screen'));
    ?>

    <!-- Custom Fonts -->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery -->
    <script src="/appointment/js/jquery.js"></script>

</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" rel="home" href="<?php echo $this->webroot;?>" title="Brand" style="padding-top: 0px; padding-bottom: 0px">
                  <img style="height: 50px;" alt="七联" src="/appointment/logo.png">
                </a>
                <!-- <a class="navbar-brand" href="index.html">Start Bootstrap</a> -->
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="/appointment">课程</a>
                    </li>
                    <li>
                        <a href="/blog">博客</a>
                    </li>
                    <li>
                        <a href="/appointment/about">关于我们</a>
                    </li>
                    <li>
                        <a href="/appointment/faq">FAQ</a>
                    </li>
                    <!-- 
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Other Pages <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="full-width.html">Full Width Page</a>
                            </li>
                            <li>
                                <a href="sidebar.html">Sidebar Page</a>
                            </li>
                            <li>
                                <a href="faq.html">FAQ</a>
                            </li>
                            <li>
                                <a href="404.html">404</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing Table</a>
                            </li>
                        </ul>
                    </li> -->
                </ul>

                <ul id="nav-right" class="nav navbar-nav navbar-right">
                  <?php if($this->Session->read('Auth.User')):?>
                    <li><a class="btn btn-blue" href="/appointment/mypage">个人主页</a></li>
                    <li><a class="btn btn-green" href="/appointment/logout">退出登录</a></li>
                  <?php else :?>
                    <li><a class="btn btn-blue" href="/appointment/login">登录</a></li>
                    <li><a class="btn btn-green" href="/appointment/regist">注册</a></li>
                  <?php endif;?>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>