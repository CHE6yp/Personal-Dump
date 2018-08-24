<?php
use Phalcon\Http\Response;

class VideoController extends ControllerBase
{
	public function initialize()
	{
		parent::initialize();
		$this->view->setVar('title', "Video");
		$this->view->setVar('h1', "Video");
	}

	public function indexAction()
	{
		// $audioFiles = AudioFiles::find();
		// $this->view->setVar('audioFiles', $audioFiles);

	}

	public function clipAction($id)
	{
		if ($id == 1)
			$this->view->setVar('video', "новый трек.mp4");
		if ($id == 2)
			$this->view->setVar('video', "first day of my life - bright eyes cover.mp4");
		if ($id == 3)
			$this->view->setVar('video', "WOW.mp4");
		if ($id == 4)
			$this->view->setVar('video', "bohemian rhapsody.mp4");
	}


	public function uploadAction($value='')
	{
		$name = '';
		if ($this->request->hasFiles() == true)
		{
			foreach ($this->request->getUploadedFiles() as $file)
			{
				$aFile = new AudioFiles();
				$aFile->name = $this->request->get('name');
				if ($aFile->save() === false) {
				    echo "Umh, We can't store robots right now: \n";

				    $messages = $aFile->getMessages();

				    foreach ($messages as $message) {
				        echo $message, "\n";
				    }
				    exit;
				}

				$f = $file->moveTo('/var/www/html/public/Audio/'.$aFile->id.".mp3");
				echo $file->getError()."<br>";
				echo $file->getName();
			}
		}
		else
		{
			echo "Oops";
			exit;
		}

		$response = new Response();
		return $response->redirect("/audio");
	}

}
