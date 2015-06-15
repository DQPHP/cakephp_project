<?php

class DemoController extends AppController {
	function beforeFilter(){
	    parent::beforeFilter();
	    // 所有方法均可访问
	    $this->Auth->allow();
	}
	
	public function index() {
		$this->layout = "demo";
	}
}