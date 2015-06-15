<?php
/* マイページ */
class MypageController extends AppController {
	public $uses = array('User', 'Course', 'Teacher', 'EntryTeacher', 'EntryCourse');

	function beforeFilter(){
	    parent::beforeFilter();
	    // 所有方法均可访问
	    //$this->Auth->allow();
	}

    public function isAuthorized($user) {
        if (isset($user['role'])) {
            return true;
        }
        return parent::isAuthorized($user);
    }
	
	public function index() {
		$user_id = $this->Auth->User('id');

		// 课程预约列表
		$entry_course_list = $this->EntryCourse->findByStudentId($user_id);
		$this->set('entry_course_list', $entry_course_list);

		// 老师预约列表
		$entry_teacher_list = $this->EntryTeacher->findByStudentId($user_id);
		$this->set('entry_teacher_list', $entry_teacher_list);
		// 课程推荐列表
		$rcmd_course_list = $this->Course->find('all', array('limit' => 3));
		$this->set('rcmd_course_list', $rcmd_course_list);

		// 老师推荐列表
		$rcmd_teacher_list = $this->Teacher->find('all', array('limit' => 3));
		$this->set('rcmd_teacher_list', $rcmd_teacher_list);

		// breadcrumbs 设置
		$this->breadcrumbs[''] = '个人主页';
		$this->set('breadcrumbs', $this->breadcrumbs);
	}

	public function profile() {

	}
}
