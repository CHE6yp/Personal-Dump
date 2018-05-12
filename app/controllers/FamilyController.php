<?php

class FamilyController extends ControllerBase
{

	public function initialize()
	{
		$this->view->setVar('title', "Æрвдалтæ");
		$this->view->setVar('h1', "Æрвдалтæ");
	}

	public function indexAction()
	{

		// $page = Page::findFirstById($id);
		// if (!$page)
		// 	exit ('NO PAGE!');
		// $this->view->setVar("page", $page);
	}

	public function personAction($id = false)
	{
		if(!$id)
			return false;

		$person = Person::findFirstById($id);

		if(!$person)
			return false;

		echo '<pre>';
		print_r($person->parents->toArray());
		print_r($person->parents[0]->parents->toArray());
		echo '</pre>';
		exit;
	}

	public function oneAction($id=8)
	{
		$depth = $this->request->get('d');
		$person = Person::findFirstById($id);

		$all = $person->getRelativeRecursive($depth);
		$all[] = $person;
		$all = array_unique($all);
		sort($all);

		$newAll = [];
		foreach ($all as $person)
		{
			if(!isset($newAll[$person->level]))
				$newAll[$person->level] = [];
			$newAll[$person->level][] = $person;
		}
		krsort($newAll);
		//$all = usort($all, "cmp");

		//$this->jsonResult($person->childrenM);
		//$this->jsonResult($all);
		$this->view->setVar("startId", $id);
		$this->view->setVar("all", $all);
		$this->view->setVar("newAll", $newAll);
	}

	public function treeAction()
	{
		//$id = $this->request->get('id');
		$people = Person::find();
		if (!$people)
			exit ('NO people');

		$this->jsonResult($people);
	}
}
