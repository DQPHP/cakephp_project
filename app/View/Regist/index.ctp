<!-- Page Content -->
<div class="container">
  <!-- Page Heading/Breadcrumbs -->
  <div class="row">
      <div class="col-lg-6 col-lg-offset-3 text-center">
          <h1 class="page-header">会员注册</h1>
      </div>
  </div>
  <!-- /.row -->
  <div class="row">
    <div class="col-lg-6 col-lg-offset-3">
      <div class="well">
      <?php if( isset($status) && $status == 'regist_success'): // 注册成功?>
        <?php echo $this->Session->flash(); ?>
      <?php else: // 注册页面?>
      <?php echo $this->Session->flash(); ?>
        <?php echo $this->Form->create(null, array('url' => array( 'controller' => 'regist', 'action' => 'index' ), 'id' => 'loginForm', 'class' => 'form-horizontal', 'name' => 'frm' ));?>
          <fieldset>
            <legend>注册页面</legend>
            
            <div class="form-group">
              <label for="StudentRealname" class="col-lg-2 control-label">姓名</label>
              <div class="col-lg-10">
              	<?php echo $this->Form->input('User.realname', array( 'label'=>false,'class'=>'form-control', 'placeholder'=>'七联'));?>
              </div>
            </div>
            <div class="form-group">
              <label for="StudentEmail" class="col-lg-2 control-label">邮箱</label>
              <div class="col-lg-10">
                <?php echo $this->Form->input('User.email', array( 'label'=>false,'class'=>'form-control', 'placeholder'=>'great@qilian.jp'));?>
              </div>
            </div>
            <div class="form-group">
              <label for="StudentPasswd" class="col-lg-2 control-label">密码</label>
              <div class="col-lg-10">
                <?php echo $this->Form->input('User.passwd', array('type' => 'password', 'label'=>false,'class'=>'form-control', 'placeholder'=>'Password'));?>
              </div>
            </div>
            <?php echo $this->Form->input('User.uniqid', array('type' => 'hidden', 'value' => $this->Session->read('uniqid')));?>
            <!-- <div class="form-group">
              <label for="inputPassword" class="col-lg-2 control-label">密码确认</label>
              <div class="col-lg-10">
                <input type="password" name="passwd_confirm" class="form-control" id="inputPassword" placeholder="Password Confirm">
              </div>
            </div> -->
            <div class="form-group">
              <div class="col-lg-10 col-lg-offset-2">
                <button type="submit" class="btn btn-primary btn-green">注册</button>
              </div>
            </div>
          </fieldset>
        <?php echo $this->Form->end();?>
      <?php endif;?>
      </div>
    </div>
  </div>