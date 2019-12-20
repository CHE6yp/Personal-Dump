<?php
use Phalcon\Http\Response;

class FilesController extends ControllerBase
{
	public function initialize()
	{
		parent::initialize();
		$this->view->setVar('title', "Files");
		$this->view->setVar('h1', "Files");
	}

	public function indexAction()
	{
		$files = scandir("/var/www/html/public/Files");
		echo "<pre>";
		foreach ($files as $file) {
			print_r($file);
		}
		
		//exit;
		$this->view->setVar('files',$files);

	}
}
