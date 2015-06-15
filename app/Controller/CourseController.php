<?php

class CourseController extends AppController {

	public $uses = array('Course', 'Teacher');
	public $layout = "bootstrap-admin";

	function beforeFilter(){
	    parent::beforeFilter();
	    $this->Auth->allow('detail');
	}

	public function detail() {
		$this->layout = "bootstrap";
		
		$id = $this->params->pass;
		$course = $this->Course->findById($id);
		$this->set('course', $course);

		$teacher_id = $course['Course']['teacher_id'];
		$teacher = $this->Teacher->findById($teacher_id);
		$this->set('teacher', $teacher);

		// breadcrumbs 设置
		$this->breadcrumbs['/appointment/list/course'] = '课程一览';
		$this->breadcrumbs[''] = $course['Course']['name'];
		$this->set('breadcrumbs', $this->breadcrumbs);
	}

/*******************************
	以下信息仅限管理员身份
********************************/

	/* 课程信息一览 */
	public function index() {
		$courses = $this->Course->find('all');
		$this->set('courses', $courses);
	}

	/* 添加课程信息 */
	public function add() {
		if($this->request->data) {
			if($this->Course->save($this->request->data)) {
				$this->Session->setFlash('课程信息保存成功', 'flash_success');
				$this->redirect('/appointment/course');
			}
		}
	}

	/* 课程信息修改 */
	public function modify( $id = null ) {
		$id = $this->params->pass;

		if($this->request->data) {
			if($this->Course->save($this->request->data)) {
				$this->Session->setFlash($this->request->data['Course']['name'].'课程信息修改成功！', 'flash_success');
			} else {
				$this->Session->setFlash($this->request->data['Course']['name'].'课程信息修改失败！', 'flash_error');
			}
		} else {
			$course = $this->Course->findById($id);
			$this->request->data = $course;
		}
	}

	/* 删除课程信息 */
	public function delete($id = null) {
		$this->autoRender = false;
		$id = $this->params->pass;

		if($this->Course->deleteAll(array('id' => $id))) {
			$this->Session->setFlash('删除成功！', 'flash_success');
        	return $this->redirect('/appointment/course');
		}
	}

}
