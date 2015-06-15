<!-- Page Content -->
<div class="container">
  <!-- Page Heading/Breadcrumbs -->
  <div class="row">
      <div class="col-lg-12">
          <h1 class="page-header"><?php echo $course['Course']['name']?>
              <small>课程预约</small>
          </h1>
          <?php echo $this->element('breadcrumbs');?>
      </div>
  </div>
  <!-- /.row -->
  <div class="row">
    <div class="col-md-7">
      <?php 
        echo $this->Html->image("original/".$course['Course']['image'], array(
            "alt" => $course['Course']['name'],
            "class" => "inbox",
            "url" => array('controller' => 'entry', 'action' => 'course', $course['Course']['id'])
        ));
      ?>
    </div> 

    <div class="col-md-5">
      <div class="media">
          <div class="pull-left">
              <span class="fa-stack fa-2x">
                    <i class="fa fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa fa-calendar fa-stack-1x fa-inverse"></i>
              </span> 
          </div>
          <div class="media-body">
              <h4 class="media-heading">上课时间</h4>
              <p>
               <b><i class="fa fa-play"></i></b> <?php echo $this->DateFormat->makeDateFormat($course['Course']['starttime']);?></br>
               <b><i class="fa fa-stop"></i></b> <?php echo $this->DateFormat->makeDateFormat($course['Course']['endtime']);?>
              </p>
          </div>
      </div>
      <div class="media">
          <div class="pull-left">
              <span class="fa-stack fa-2x">
                    <i class="fa fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa fa-jpy fa-stack-1x fa-inverse"></i>
              </span> 
          </div>
          <div class="media-body">
              <h4 class="media-heading">课程价格</h4>
              <p><?php echo $course['Course']['price'];?></p>
          </div>
      </div>
      <div class="media">
          <div class="pull-left">
              <span class="fa-stack fa-2x">
                    <i class="fa fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa fa-users fa-stack-1x fa-inverse"></i>
              </span> 
          </div>
          <div class="media-body">
              <h4 class="media-heading">报名人数</h4>
              <p><?php echo $course['Course']['curr_attendee'];?>/<?php echo $course['Course']['tota_attendee'];?></p>
          </div>
      </div> 
      <div class="media">
          <div class="pull-left">
              <span class="fa-stack fa-2x">
                    <i class="fa fa-circle fa-stack-2x text-primary"></i>
                    <i class="fa fa-map-marker fa-stack-1x fa-inverse"></i>
              </span> 
          </div>
          <div class="media-body">
              <h4 class="media-heading">上课地址</h4>
              <p><?php echo $course['Course']['address'];?></p>
          </div>
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-md-8">
      <h3 class="page-header">课程详情</h3>
      <!-- <ul id="myTab" class="nav nav-tabs nav-justified">
          <li class="active"><a href="#service-one" data-toggle="tab" aria-expanded="true"><i class="fa fa-tree"></i>课程简介</a>
          </li>
          <li class=""><a href="#service-two" data-toggle="tab" aria-expanded="false"><i class="fa fa-car"></i>课程大纲</a>
          </li>
          <li class=""><a href="#service-three" data-toggle="tab" aria-expanded="false"><i class="fa fa-support"></i>费用介绍</a>
          </li>
      </ul>

      <div id="myTabContent" class="tab-content">
          <div class="tab-pane fade active in" id="service-one">
              <h4>课程简介</h4>
              <p><?php echo nl2br($course['Course']['description']);?></p>
          </div>
          <div class="tab-pane fade" id="service-two">
              <h4>课程大纲</h4>
              <p><?php echo nl2br($course['Course']['content']);?></p>
          </div>
          <div class="tab-pane fade" id="service-three">
              <h4>费用介绍</h4>
              <p><?php echo nl2br($course['Course']['price_detail']);?></p>
          </div>
      </div> -->
    <div class="thumbnail">
      <div class="caption">
      <nav id="navbar-qilian" class="navbar navbar-default navbar-static">
        <div class="container-fluid">
          <div class="navbar-header">
            <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target=".bs-qilian-js-navbar-scrollspy">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">课程详情</a>
          </div>
          <div class="collapse navbar-collapse bs-qilian-js-navbar-scrollspy">
            <ul class="nav navbar-nav">
              <li class="active"><a href="#description">课程简介</a></li>
              <li class=""><a href="#content">课程大纲</a></li>
              <li class=""><a href="#price_detail">费用介绍</a></li>
            </ul>
          </div>
        </div>
      </nav>
      <div data-spy="scroll" data-target="#navbar-qilian" data-offset="0" class="scrollspy-qilian">
        <h3 id="description">课程简介</h3>
        <p><?php echo nl2br($course['Course']['description']);?></p>
        
        <h3 id="content">课程大纲</h3>
        <p><?php echo nl2br($course['Course']['content']);?></p>
        
        <h3 id="price_detail">费用介绍</h3>
        <p><?php echo nl2br($course['Course']['price_detail']);?></p>
      </div>
    </div>
    </div>

      <h2 class="page-header">我要报名<small><?php echo $course['Course']['name']; ?></small></h2>
      <!-- 报名表单 -->
      <?php echo $this->Form->create(null, array('url' => array( 'controller' => 'entry', 'action' => 'submit' ),  'class' => 'form-horizontal', 'name' => 'frm' ));?>
      <fieldset>
        <div class="form-group">
          <label for="StudentRealname" class="col-lg-2 control-label">
            姓名<span class="label label-danger">必须</span>
          </label>
          <div class="col-lg-10">
            <?php echo $this->Form->input('User.realname', array(
                'type' => 'text',
                'div' => false,
                'label' => false,
                'class' => 'form-control'
            ));?>
          </div>
        </div>

        <div class="form-group">
          <label for="StudentUniversity" class="col-lg-2 control-label">
            大学<span class="label label-info">任意</span>
          </label>
          <div class="col-lg-10">
            <?php echo $this->Form->input('User.university', array(
                'type' => 'text',
                'div' => false,
                'label' => false,
                'class' => 'form-control'
            ));?>
          </div>
        </div>

        <div class="form-group">
          <label for="StudentMajor" class="col-lg-2 control-label">
            学部专业<span class="label label-info">任意</span>
          </label>
          <div class="col-lg-10">
            <?php echo $this->Form->input('User.major', array(
                'type' => 'text',
                'div' => false,
                'label' => false,
                'class' => 'form-control'
            ));?>
          </div>
        </div>

        <div class="form-group">
          <label for="StudentEmail" class="col-lg-2 control-label">
            邮箱<span class="label label-danger">必须</span>
          </label>
          <div class="col-lg-10">
            <?php echo $this->Form->input('User.email', array(
                'type' => 'email',
                'div' => false,
                'label' => false,
                'class' => 'form-control'
            ));?>
          </div>
        </div>

        <div class="form-group form-inline">
          <label for="StudentWechat" class="col-lg-2 control-label">
            微信/Line<span class="label label-danger">必须</span>
          </label>
          <div class="col-lg-10">
            <?php echo $this->Form->input('User.wechat', array(
                'type' => 'text',
                'div' => false,
                'label' => false,
                'class' => 'form-control',
                'placeholder' => '微信ID'
            ));?>
            /
            <?php echo $this->Form->input('User.line', array(
                'type' => 'text',
                'div' => false,
                'label' => false,
                'class' => 'form-control',
                'placeholder' => 'LineID'
            ));?>
          <span class="help-block">微信或Line一项必须</span>
          </div>
        </div>

        <div class="form-group">
          <label for="AppointmentDescription" class="col-lg-2 control-label">
            备注<span class="label label-info">任意</span>
          </label>
          <div class="col-lg-10">
            <?php echo $this->Form->input('EntryCourse.note',array(
                'type' => 'textarea',
                'class' => 'form-control',
                'label' => false
            ));?>
          </div>
        </div>
        
        <?php echo $this->Form->input('Course.id', array('type' => 'hidden', 'value' => $course['Course']['id']));?>
        <div class="form-group">
          <div class="col-lg-10 col-lg-offset-2">
            <button type="submit" class="btn btn-primary">马上报名</button>
          </div>
        </div>
      </fieldset>
    <?php echo $this->Form->end();?>
      
    </div>
    <!-- /.col-md-8 -->

    <div class="col-md-4">
      <h3 class="page-header">导师介绍</h3>
      <div class="text-center">
          <div class="thumbnail">
              <?php 
                echo $this->Html->image(
                  $teacher['Teacher']['avatar'], 
                  array(
                    "alt" => $teacher['Teacher']['name'],
                    "class" => "inbox"
                  )
                );
              ?>
              <div class="caption">
                  <h3><?php echo $teacher['Teacher']['name']?><br>
                      <small>Job Title</small>
                  </h3>
                  <p><?php echo $teacher['Teacher']['description'];?></p>
                  <ul class="list-inline">
                      <li>
                        <a href="#"><i class="fa fa-2x fa-facebook-square"></i></a>
                      </li>
                      <li>
                        <a href="#"><i class="fa fa-2x fa-linkedin-square"></i></a>
                      </li>
                      <li>
                        <a href="#"><i class="fa fa-2x fa-twitter-square"></i></a>
                      </li>
                  </ul>
              </div>
          </div>
      </div>
    </div>
    <!-- /.col-md-4 -->
  </div>
  <!-- /.row -->