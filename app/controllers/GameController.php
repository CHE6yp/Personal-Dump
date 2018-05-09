<?php

class GameController extends ControllerBase
{
	public function indexAction()
	{

		// $page = Page::findFirstById($id);
		// if (!$page)
		// 	exit ('NO PAGE!');
		// $this->view->setVar("page", $page); 
	}

	public function pageAction()
	{

		$id = $this->request->get('id');
		$page = Page::findFirstById($id);
		if (!$page)
			exit ('NO PAGE');
		$options = Option::find(['conditions' => ["page_id = {$id}"]]);
		// print_r($page->options);
		// exit('23');
		$this->view->setVar("page", $page); 
		$this->view->setVar("options", $options); 
	}
}
