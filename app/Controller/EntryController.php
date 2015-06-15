<?php
/**
 * 学生课程申请
 */
App::uses('CakeEmail','Network/Email');
class EntryController extends AppController {
	public $uses = array( 'Teacher', 'Course', 'User', 'EntryTeacher', 'EntryCourse');

	function beforeFilter(){
	    parent::beforeFilter();
	    // 所有方法均可访问
	    $this->Auth->allow();
	}

	/* 个别老师辅导申请 */
	public function teacher($id = null) {
		if(!$id) {
			$this->redirect('/appointment');
		}
		$teacher = $this->Teacher->findById($id);
		$this->set('teacher', $teacher);

		// breadcrumbs 设置
		$this->breadcrumbs['/appointment/list/teacher'] = '老师预约';
		$this->breadcrumbs[''] = $teacher['Teacher']['name'];
		$this->set('breadcrumbs', $this->breadcrumbs);
	}

	/* 公共课程申请 */
	public function course($id = null) {
		if(!$id) {
			$this->redirect('/appointment');
		}
		$course = $this->Course->findById($id);
		$this->set('course', $course);

		$teacher_id = $course['Course']['teacher_id'];
		$teacher = $this->Teacher->findById($teacher_id);
		$this->set('teacher', $teacher);

		// breadcrumbs 设置
		$this->breadcrumbs['/appointment/list/course'] = '课程预约';
		$this->breadcrumbs[''] = $course['Course']['name'];
		$this->set('breadcrumbs', $this->breadcrumbs);
	}

	/* 提交申请*/
	public function submit(){

		if( isset ($this->request->data['User']['email']) ) {
			// 邮箱
			$email = $this->request->data['User']['email'];
			$user_name = $this->request->data['User']['realname'];

			if($student = $this->User->findByEmail($email)) {
				// 该同学已经申请过课程
				$student_id = $student['User']['id'];
				// 将最新信息更新至该同学数据库

			} else {
				// 该同学第一次申请课程
				$passwd = 'qilian'.date('MD');
				$this->request->data['User']['passwd'] = $passwd;
				if($this->User->save($this->request->data['User'])) {
					$student_id = $this->User->getLastInsertID();
				} else {
					$this->redirect('/appointment');
				}
			}

			// 课程申请情况保存
			if(isset($this->request->data['Course']['id'])) {

				$type = 'course';	//  邮件内容类型判断
				$entry_info = array(
					'course_id' => $this->request->data['Course']['id'],
					'student_id' => $student_id,
					'note' => $this->request->data['EntryCourse']['note']
				);
				$this->EntryCourse->save($entry_info);

				// 课程信息
				$this->Course->id = $this->request->data['Course']['id'];
				$course_name = $this->Course->field('name');
				$course_address = $this->Course->field('address');
				$course_starttime = $this->Course->field('starttime');
				$course_endtime = $this->Course->field('endtime');

				// 邮件标题
				$mail_subject = '[七联就职]_'.$course_name.'_课程预约成功通知';
				$mail_title = $course_name;
				$mail_entry_link = $this->basic_url_qilian.'entry/course/'.$this->request->data['Course']['id'];
				$mail_note = $this->request->data['EntryCourse']['note'];

				// 面包屑
				$this->breadcrumbs['/appointment/list/course'] = '课程预约';
				$this->breadcrumbs[$mail_entry_link] = $course_name;
				$this->breadcrumbs[''] = '预约成功';

			}


			// 老师申请情况保存
			if(isset($this->request->data['Teacher']['id'])) {

				$type = 'teacher';	//  邮件内容类型判断
				
				$entry_teacher_info = $this->request->data['EntryTeacher'];
				$entry_teacher_info['teacher_id'] = $this->request->data['Teacher']['id'];
				$entry_teacher_info['student_id'] = $student_id;
				$this->EntryTeacher->save($entry_teacher_info);

				// 教师姓名
				$this->Teacher->id = $this->request->data['Teacher']['id'];
				$teacher_name = $this->Teacher->field('name');

				// 邮件标题
				$mail_subject = '【七联就职】_'.$teacher_name.'老师1V1课程辅导预约成功通知';
				$mail_title = $teacher_name.'老师1V1辅导预约';
				$mail_entry_link = $this->basic_url_qilian.'entry/teacher/'.$this->request->data['Teacher']['id'];
				$mail_note = $this->request->data['EntryTeacher']['note'];

				// 面包屑
				$this->breadcrumbs['/appointment/list/teacher'] = '老师1V1预约';
				$this->breadcrumbs[$mail_entry_link] = $teacher_name;
				$this->breadcrumbs[''] = '预约成功';
			}

			// 邮件通知
	        $Email = new CakeEmail();
	        // text发信类型
	        $Email->emailFormat('text');

	        // 邮件模板页传值设定
	        $viewVars = array(
	        		'type' => $type,
 	        		'title' => $mail_title,
	        		'entry_link' => $mail_entry_link,
	        		'user_name' => $user_name,
	        		'note' => $mail_note
        	);

        	if($type == 'teacher') {
        		$viewVars['starttime'] = $this->request->data['EntryTeacher']['starttime'];
        		$viewVars['endtime']   = $this->request->data['EntryTeacher']['endtime'];
        	}

        	if($type == 'course') {
        		$viewVars['starttime'] = $course_starttime;
        		$viewVars['endtime']   = $course_endtime;
        		$viewVars['address']   = $course_address;
        	}

	        $Email->template('entry_confirm_student');
	        $Email->viewVars($viewVars);
	        $Email->from('pr@qilian.jp','七联就职社');
	        $Email->to($email);
	        $Email->subject($mail_subject);
	        $Email->send();

	        /* 向后台管理员发送邮件 */
	        $Email->reset();

	        // 送信模板設定
	        $Email->template('entry_confirm_admin');
	        
	        // 送信内容設定
	        $Email->viewVars($viewVars);
	        $Email->from(array('pr@qilian.jp' => '七联就职[Alert]'));
	        $Email->to('dongqiang.v@gmail.com');
	        // 邮件主题
	        $Email->subject($mail_subject);
	        // 发送邮件
	        $Email->send();

	        // 网页提示用户注册成功并且向用户推荐其他就职信息以及内容
	        $this->set('type', $type);
	        $this->set('viewVars', $viewVars);

	        // breadcrumbs 设置
			$this->set('breadcrumbs', $this->breadcrumbs);

			// 侧边栏推荐 其他导师以及课程
			$teacher_list = $this->Teacher->find('all', array('limit' => 3));
			$course_list  = $this->Course->find('all', array('limit' => 3));
			$this->set('teacher_list', $teacher_list);
			$this->set('course_list', $course_list);
			
		} else {
			$this->redirect('/');
		}
	}

}
