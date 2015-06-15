<?php
/*
 * qilian mobile api
 */
App::uses('CakeEmail','Network/Email');
class ApiController extends AppController {

	public $uses = array( 'User', 'Course', 'Entry', 'Teacher' );

	function beforeFilter(){
	    parent::beforeFilter();
	    // 所有方法均可访问
	    $this->Auth->allow();
	}

	/* 
	 * API Register
	 */
	public function register() {

		$Email = new CakeEmail();

		if($this->request->data) {
                        $data["User"]["email"] = $this->request->data['mail'];
                        $data["User"]["passwd"] = "giveusmoney";
                        $data["User"]["realname"] = "mobile";
                        $data["User"]["uniqid"] = $this->request->data["uuid"];
			if( $this->request->data['uuid'] && $this->request->data['mail'] && $this->User->save($data) ) {
				// 注册成功，用户邮箱验证
				$email = $this->request->data['mail'];
                                /* 向学生发送邮件 */
                                $Email->template('welcome_regist');
                                 
                                $Email->from('pr@qilian.jp','七联就职社');
                                $Email->to($email);
                                $Email->transport('Mail');
                                $Email->subject('欢迎使用【七联就职】客户端');
                                $Email->send();

                                /* 向后台管理员发送邮件 */
                                $Email->reset();
                                // 送信模板設定
                                $Email->template('regist_admin');
                                // text送信設定
                                $Email->emailFormat('text');
                                $Email->viewVars(array(
                                  'uniqid' => $this->request->data['uuid'], 
                                  'email' => $this->request->data['mail'],
                                ));

                                $Email->from(array('pr@qilian.jp' => '七联就职'));
                                $Email->to('clongbupt@gmail.com');
                                // タイトル
                                $Email->subject('新用户使用[七联就职]客户端');
                                // 送信する
                                $Email->send();

                                // 刷新此页面
                                echo json_encode("ok");
                                exit;
		        } else {
                            $data["User"]["email"] = "";
                            $this->User->save($data) 

                            $Email->reset();
                            $Email->template('mobile_reset_email');
                            $Email->emailFormat('text');
                            $Email->viewVars(array(
                                'uniqid' => $this->request->data['uuid'], 
                                'email' => $this->request->data['mail'],
                            ));

                            $Email->from(array('pr@qilian.jp' => '七联就职'));
                            $Email->to('clongbupt@gmail.com');
                            $Email->subject('新用户重置[七联就职]客户端的密码');
                            $Email->send();

			    echo json_encode("error");
                            exit;
                        }
                        
		}
                else {
                  echo json_encode("error");
                  exit;
                }
	}


	/* 
	 * API login 
	 */
	public function login() {

	    if($this->Auth->user('id')){
                $this->redirect('/');
            }

            if($this->request->is('post')){
                if($this->Auth->login()){
                    return $this->redirect($this->Auth->redirect());
                }else{
                    $this->Session->setFlash('确认用户名密码是否正确。', 'flash_error');
                }
            }
	}

	/* 
	 * Reset email
	 */
	public function reset($uniqid = null) {
            $uniqid = @$this->request->query['uuid'];
            $user = $this->User->findByUniqid($uniqid);

            if(isset($user['User']['email'])){     // 如果该用户的邮箱存在
                  $this->User->saveField('email', '');
                  $this->User->id = $user['User']['id'];
                  $this->Session->setFlash("您的邮箱已经重置，请在手机端重新注册。", "flash_success");
                  $this->redirect('/');
            } else {                            
                  $this->Session->setFlash('用户不存在，请在手机端重新注册.', 'flash_error');
                  $this->redirect('/');
            }
	}

    /*
     * API courses
     */
    public function courses(){

        if ($this->request->query) {

            $courses = array();
            $starttime = "2015-01-01 00:00:00";
            $course_id = 0;
            if (@$this->request->query['course_id']) {
              $course_id = $this->request->query['course_id'];
            } 
            if ($course_id) {
                $course = $this->Course->find('first', array(
                    'conditions' => array('id' => $course_id)
                ));
                $starttime = $course['Course']['starttime'];
            }

            $courses = $this->Course->find("all", array(
              'conditions' => array('starttime >' => $starttime),
              'joins' => array(
                  array(
                      'table' => 'teachers',
                      'type'  => 'INNER',
                      'conditions' => array (
                          'Course.teacher_id = teachers.id'
                      )
                  )
              ),
              'fields' => array('Course.*', 'teachers.*')
            ));

            $uuid = 0;
            if (@$this->request->query['uuid']) {
              $uuid = $this->request->query['uuid'];
            } 
            if ($uuid) {
                $user = $this->User->find('first', array(
                    'conditions' => array("uniqid" => $uuid)
                ));
                $my_courses = $this->Course->find("all", array(
                    "joins" => array(
                        array(
                            'table' => 'entries',
                            'type'  => 'INNER',
                            'conditions' => array(
                                array('entries.course_id = Course.id'),
                                array('entries.student_id = ' => $user['User']['id'])
                            )
                        )
                    ),
                    "fields" => array('Course.*', 'entries.*')
                ));

                foreach($courses as $i => $course) {
                    $courses[$i]['Course']['sign'] = 0;  
                    foreach ($my_courses as $my_course) {
                        if ($my_course['Course']['id'] == $course['Course']['id']) {
                            if ($my_course['entries']['student_id'] == $user['User']['id']) {
                                $courses[$i]['Course']['sign'] = 1; 
                            }   
                        } 
                    }
                }

            }

            if (isset($courses)) {
                echo json_encode($courses);
                exit;
            } else {
                echo json_encode("error");
                exit;
            }
          
        } else {
            $courses = $this->Course->find('all', array(
                'joins' => array(
                    array(
                        'table' => 'teachers',
                        'type'  => 'INNER',
                        'conditions' => array (
                            'Course.teacher_id = teachers.id'
                        )
                    )
                ),
                'fields' => array('Course.*', 'teachers.*')
            )); 
            echo json_encode($courses);
            exit;
        }
  }
}
