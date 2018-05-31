<?php
use Phalcon\Http\Response;

class AudioController extends ControllerBase
{
	public function initialize()
	{
		$this->view->setVar('title', "Audio");
		$this->view->setVar('h1', "Audio");
	}

	public function indexAction()
	{
		$audioFiles = AudioFiles::find();
		$this->view->setVar('audioFiles', $audioFiles);
	}


	public function trackAction($id = 1)
	{
		$track = AudioFiles::findFirstById($id);
		$this->view->setVar('title',  "Audio: ".$track->name);
		$this->view->setVar("track", $track);
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
