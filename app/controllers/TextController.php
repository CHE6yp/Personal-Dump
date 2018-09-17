<?php
use Phalcon\Http\Response;

class TextController extends ControllerBase
{
	public function initialize()
	{
		parent::initialize();
		$this->view->setVar('title', "Text");
		$this->view->setVar('h1', "Text");
	}

	public function indexAction()
	{
		$texts = Texts::find();

		$this->view->setVar('texts', $texts);
	}

	public function detailAction($id)
	{
		$text = Texts::findFirstById($id);
		$this->view->setVar("text",$text);
	}

	public function editAction($id)
	{
		$text = Texts::findFirstById($id);
		$this->view->setVar("text",$text);
	}

	public function saveAction($id)
	{
		$text = Texts::findFirstById($id);
		if ($this->request->isPost())
		{
			if (!$text)
			{
				$text = new Texts();
			}
			$text->title = $this->request->getPost("title");
			$text->text = $this->request->getPost("text");

			if (!$text->save())
			{
				echo "coudn't save";
				exit;
			}

		}
		else
		{
			echo "not a post request";
			exit;
		}
		$response = new Response();
		return $response->redirect("/text/detail/{$text->id}");
	}

}
