<?php
/**
 * Static content controller.
 *
 * This file will render views from views/pages/
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

App::uses('AppController', 'Controller');

/**
 * Static content controller
 *
 * Override this controller by placing a copy in controllers directory of an application
 *
 * @package       app.Controller
 * @link http://book.cakephp.org/2.0/en/controllers/pages-controller.html
 */
class PagesController extends AppController {

/**
 * This controller does not use a model
 *
 * @var array
 */
	public $uses = array( 'Teacher', 'Course', 'SlideImage' );
	public $layout = "bootstrap-top";


	function beforeFilter(){
	    parent::beforeFilter();
	    // 所有方法均可访问
	    $this->Auth->allow();
	}

/**
 * Displays a view
 *
 * @return void
 * @throws NotFoundException When the view file could not be found
 *	or MissingViewException in debug mode.
 */
	public function display() {

		// SlideImage
		$slide_images = $this->SlideImage->find('all', array('limit' => 3));
		$this->set('slide_images', $slide_images);
		// 教师一览
		$teachers = $this->Teacher->find('all', array('limit' => 3));
		$this->set('teachers', $teachers);

		// 课程一览
		$courses = $this->Course->find('all', array('limit' => 3));
		$this->set('courses', $courses);

		$path = func_get_args();
		try {
			$this->render(implode('/', $path));
		} catch (MissingViewException $e) {
			if (Configure::read('debug')) {
				throw $e;
			}
			throw new NotFoundException();
		}
	}

	public function about(){
		$this->breadcrumbs['/appointment/about'] = '关于我们';
		$this->set('breadcrumbs', $this->breadcrumbs);
	}

	public function faq(){
		$this->breadcrumbs['/appointment/faq'] = 'FAQ';
		$this->set('breadcrumbs', $this->breadcrumbs);
	}
}
