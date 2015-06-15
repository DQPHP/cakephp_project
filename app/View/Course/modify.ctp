<div class="well">
    <?php echo $this->Form->create(null, array('url' => array( 'controller' => 'course', 'action' => 'modify' ), 'id' => 'Course',  'class' => 'form-horizontal', 'name' => 'frm' ));?>
    <fieldset>
      <legend>课程信息修改</legend>
      
      <div class="form-group">
        <label for="CourseName" class="col-lg-2 control-label">名称</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.name', array(
              'type' => 'text',
              'div' => false,
              'label' => false,
              'class' => 'form-control'
          ));?>
        </div>
      </div>

      <div class="form-group">
        <label for="CourseAddress" class="col-lg-2 control-label">地点</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.address', array(
              'type' => 'text',
              'div' => false,
              'label' => false,
              'class' => 'form-control'
          ));?>
        </div>
      </div>

      <div class="form-group">
        <label for="CourseTotaAttendee" class="col-lg-2 control-label">上限人数</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.tota_attendee', array(
              'type' => 'text',
              'div' => false,
              'label' => false,
              'class' => 'form-control'
          ));?>
        </div>
      </div>

      <div class="form-group">
        <label for="CourseCurrAttendee" class="col-lg-2 control-label">已报名人数</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.curr_attendee', array(
              'type' => 'text',
              'div' => false,
              'label' => false,
              'class' => 'form-control',
              'disabled' => true
          ));?>
        </div>
      </div>

      <div class="form-group form-inline">
        <label for="CourseStarttime" class="col-lg-2 control-label">课程时间</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.starttime',array(
              'type' => 'text',
              'div' => false,
              'class' => 'form-control datetimepicker',
              'label' => false
          ));?>
          〜
          <?php echo $this->Form->input('Course.endtime',array(
              'type' => 'text',
              'div' => false,
              'class' => 'form-control datetimepicker',
              'label' => false
          ));?>
        </div>
      </div>

      <div class="form-group">
        <label for="CourseName" class="col-lg-2 control-label">每课时价钱</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.price', array(
              'type' => 'text',
              'div' => false,
              'label' => false,
              'class' => 'form-control'
          ));?>
        </div>
      </div>


      <div class="form-group">
        <label for="CourseDescription" class="col-lg-2 control-label">费用介绍</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.price_detail',array(
              'type' => 'textarea',
              'class' => 'form-control',
              'label' => false,
              'rows' => '8'
          ));?>
        </div>
      </div>

      <div class="form-group">
        <label for="CourseDescription" class="col-lg-2 control-label">简介</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.description',array(
              'type' => 'textarea',
              'class' => 'form-control',
              'label' => false,
              'rows' => '8'
          ));?>
        </div>
      </div>

      <div class="form-group">
        <label for="CourseDescription" class="col-lg-2 control-label">课程大纲</label>
        <div class="col-lg-10">
          <?php echo $this->Form->input('Course.content',array(
              'type' => 'textarea',
              'class' => 'form-control',
              'label' => false,
              'rows' => '8'
          ));?>
        </div>
      </div>
      <div class="form-group">
          <label for="TeacherImage" class="control-label col-lg-2">课程图片</label>
          <div class="col-lg-10">
            <input type="file" name="file" id="eyecatch_upload"><br />
            <img id="eyecatch_url" style="width: 140px; height: 140px;" src="/appointment/img/original/<?php echo $this->request->data['Course']['image'];?>" class="img-rounded"/>
            <?php echo $this->Form->input('Course.image', array('type' => 'hidden', 'id' => "eyecatch_image")); ?>
          </div>
      </div>

      <?php echo $this->Form->input('Course.id', array('type' => 'hidden'));?>
      <div class="form-group">
        <div class="col-lg-10 col-lg-offset-2">
          <button type="submit" class="btn btn-primary">Submit</button>
        </div>
      </div>
    </fieldset>
  <?php echo $this->Form->end();?>
</div>
<!-- include timepicker css/js-->
<link rel="stylesheet" href="/appointment/plugin/datetimepicker/jquery.datetimepicker.css" />
<script type="text/javascript" src="/appointment/plugin/datetimepicker/jquery.datetimepicker.js"></script>
<script>
    $('.datetimepicker').datetimepicker({
        step: 30
    });
</script>
<!-- Include jquery.uplaod-1.0.2.min.js For Realtime Image Display -->
<script src="/appointment/js/jquery.upload-1.0.2.min.js"></script>
<script>
    $(function() {
        $('#eyecatch_upload').change(function() {
            var fn="/appointment/course/eyecatch_save";
            fn=encodeURI(fn); 
            $(this).upload(fn, function(res) {
                $("#eyecatch_url").attr("src",'/appointment/img/original/'+ res);
                $("#eyecatch_image").attr("value",res);
            }, 'html');
        });
    });
</script>