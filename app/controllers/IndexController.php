<?php

class IndexController extends ControllerBase
{
	public function indexAction()
	{
		echo 'Index';


		// $this->view->setVar('text','test this this!');
	}

	public function gameAction($pageId)
	{
		// exit('23');
		$page = Page::findFirstById($pageId);
		// if (!$page)
		// 	exit 'NO PAGE';
		$this->view->setVar("page", $page); 
	}

	public function notfoundAction()
	{
		$this->view->disable();
		$this->jsonResult(['error'=>'404']);
	}
}
