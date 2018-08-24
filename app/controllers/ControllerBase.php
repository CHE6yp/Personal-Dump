<?php

use Phalcon\Mvc\Controller;

class ControllerBase extends Controller
{
	// public function pageNotFound()
	// {
	// 	/**
	// 	 * если запрос ничего не дал
	// 	 */
	// 	if(!$this->request->isAjax())
	// 	{
	// 		$this->response->redirect('/notfound/');
	// 		$this->view->disable();
	// 	}
	// 	else
	// 	{
	// 		$this->jsonResult(['result'=>'error','msg'=>'not found']);
	// 	}
	// }

	public static $authUser = null;


	public function initialize()
	{
		$this->view->setVar('title', "CHE6yp");
		$this->view->setVar('h1', "Главная");

		$sessions = $this->getDI()->getShared("session");
		//if ($sessions->get('authUser'));
		$this->view->setVar('authUser', $sessions->get('authUser'));
	}

	public function jsonResult($data)
	{
		echo json_encode($data);
		$this->view->disable();
		return;
	}

	public function mbStringToArray ($string) {
		$strlen = mb_strlen($string);
		while ($strlen) {
			$array[] = mb_substr($string,0,1,"UTF-8");
			$string = mb_substr($string,1,$strlen,"UTF-8");
			$strlen = mb_strlen($string);
		}
		return $array;
	}

	function mb_ucfirst($text) {
		return mb_strtoupper(mb_substr($text, 0, 1)) . mb_substr($text, 1);
	}
}

?>