<div class="col-lg-9" id="main-left">
	<div class="panel panel-default">
	<?php if($type == 'course'): // 课程预约成功 ?>
		<div class="panel-heading">[预约成功]<?php echo $viewVars['title']?></div>
		<div class="panel-body">
			<?php echo $viewVars['user_name'];?>同学<br />
			感谢您预约<b><?php echo $this->Html->link($viewVars['title'], $viewVars['entry_link']);?></b><br />
			<hr />
			<p><b>预约详情:</b></p>
			课程名称: <?php echo $viewVars['title'];?> <br />
			课程网址: <?php echo $this->Html->link($viewVars['entry_link'], $viewVars['entry_link']);?><br />
			上课地址: <?php echo $viewVars['address'];?> <br />
			课程时间: <?php echo $this->DateFormat->makeDateFormat($viewVars['starttime']);?> ~ <?php echo $this->DateFormat->makeDateFormat($viewVars['endtime']);?>  <br />

		</div>
	<?php elseif($type == 'teacher'):?>
		<div class="panel-heading">[预约成功]<?php echo $viewVars['title']?></div>
		<div class="panel-body">
			<?php echo $viewVars['user_name'];?>同学<br />
			感谢您预约<b><?php echo $this->Html->link($viewVars['title'], $viewVars['entry_link']);?></b>。<br />
			<hr />
			<p>预约详情:</p>
			预约老师: <?php echo $viewVars['title'];?> <br />
			老师网址: <?php echo $this->Html->link($viewVars['entry_link'], $viewVars['entry_link']);?><br />
			预约时间: <?php echo $this->DateFormat->makeDateFormat($viewVars['starttime']);?> ~ <?php echo $this->DateFormat->makeDateFormat($viewVars['endtime']);?>  <br />

		</div>
	<?php endif;?>
	</div><!-- /panel panel-default -->

	<div class="panel panel-default">
		<div class="panel-heading">七联导师推荐</div>
		<div class="panel-body">
			<div class="row">
				<?php foreach($teacher_list as $teacher):?>
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail">
							<img src="/appointment/img/<?php echo $teacher['Teacher']['avatar']?>" style="height: 200px; width: 100%; display: block;">
							<div class="caption">
				            <h3 id="thumbnail-label"><?php echo $teacher['Teacher']['name'];?><a class="anchorjs-link" href="#thumbnail-label"><span class="anchorjs-icon"></span></a></h3>
				            <p><?php echo mb_substr($teacher['Teacher']['description'],0,100);?>......</p>
				            <p>
				            	<?php echo $this->Html->link(
						              '详细',
						              array('controller' => 'teacher', 'action' => 'detail', $teacher['Teacher']['id']),
						              array('class' => 'btn btn-blue')
						          );
					          	?>
					          	<?php echo $this->Html->link(
						              '1V1预约',
						              array('controller' => 'entry', 'action' => 'teacher', $teacher['Teacher']['id']),
						              array('class' => 'btn btn-green')
						          );
					          	?>
				            </p>
				        	</div>
			        	</div>
					</div>
				<?php endforeach;?>
		    </div>
		</div>
	</div>
</div><!-- /main-left -->

<!-- main-right sidebar -->
<div class="col-lg-3" id="main-right">
  <div class="panel panel-default">
    <div class="panel-heading">七联优质课</div>
    <div class="panel-body">
      <div class="list-group">
   		<?php foreach($course_list as $course):?>
        <a href="/appointment/course/detail/<?php echo $course['Course']['id'];?>" class="list-group-item">
		    <h4 class="list-group-item-heading"><?php echo $course['Course']['name'];?></h4>
		    <p class="list-group-item-text"><?php echo mb_substr($course['Course']['description'], 0, 20);?>......</p>
		</a>
		<?php endforeach;?>
      </div>
    </div>
  </div>
</div>
<!-- /main-right sidebar -->