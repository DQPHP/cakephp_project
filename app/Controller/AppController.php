<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * For full copyright and license information, please see the LICENSE.txt
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright (c) Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       http://www.opensource.org/licenses/mit-license.php MIT License
 */

App::uses('Controller', 'Controller');

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package		app.Controller
 * @link		http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */
class AppController extends Controller {
    public $layout = "bootstrap";
    public $helpers = array('Form', 'Html', 'Js', 'Session', 'DateFormat');

    public $components = array(
        'Image',
        'Cookie',
        'Session',
        'Auth' => array(
            'loginRedirect' => array(
                'controller' => 'pages',
                'action' => 'display',
                'home'
              ),
            'logoutRedirect' => array('controller' => 'regist', 'action' => 'login'),
            'loginAction' => array(
                'controller' => 'regist',
                'action' => 'login'
                ),
            'authenticate' => array(
                'Form' => array(    
                    'fields' => array(
                        'username' => 'email',
                        'password' => 'passwd'
                    )
                )
            ),
            'authorize' => array('Controller'),
            'unauthorizedRedirect' => array(
                'controller' => 'pages',
                'action' => 'display',
                'home',
                'prefix' => false
            )
        )
    );

    public function isAuthorized($user) {
        if (isset($user['role']) && $user['role'] === 'admin') {
            return true;
        }
        return false;
    }

    /* 面包屑页面导航 */
    public $breadcrumbs = array( '/appointment' => '首页' );

    /* 网站根网址 */
    public $basic_url_qilian;

    /* 事先加载 */
    function beforeFilter() {
        $this->set('title_meta', '七联就职');
        $this->set('description_meta', '七联就职相关描述');
        $this->Auth->allow('eyecatch_save');
        $this->basic_url_qilian = $this->getBasicUrl();
    }
    
	/* 图像上传 */
    public function eyecatch_save(){
        $this->autoRender = false;
        $name = $this->randomString();
        $ext = explode('.',$_FILES['file']['name']);
        $ext = array_reverse($ext);
        $filename = $name.'.'.$ext[0];
        
        $destination = 'img/original/'.$filename;
        $location =  $_FILES["file"]["tmp_name"];
        move_uploaded_file($location,$destination);
        // Resize Image
        // $source_image = 'img/original/'.$filename;
        
        // $resize_image_m = 'img/thumb/'.$filename;
        // $this->Image->prepare($source_image);
        // $this->Image->crop(242,200);
        // $this->Image->save($resize_image_m);

        // $resize_image_s = 'img/small/'.$filename;
        // $this->Image->prepare($source_image);
        // $this->Image->crop(64,64);
        // $this->Image->save($resize_image_s);
        
        echo $filename;
    }

    /* 随机字符串 */ 
    function randomString() {
        return md5(uniqid());
    }

    /* 网站根网址获取 */
    function getBasicUrl() {
        return "http" . (($_SERVER['SERVER_PORT'] == 443) ? "s://" : "://") . $_SERVER['SERVER_NAME'] . Router::url('/');
    }

    /*
     * エラー処理
     */
    // public function appError($error) {
    //    return $this->redirect('/');
    // }
	
}
