<?php
use Phalcon\Http\Response;

class FamilyController extends ControllerBase
{

	public function initialize()
	{
        parent::initialize();
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

	public function addPersonAction()
	{
		$person = new Person();
		$person->name = $this->request->getPost('name');
		$person->surname = $this->request->getPost('surname');
		$person->nickname = $this->request->getPost('nickname');
		$person->birthdate = $this->request->getPost('birthdate');
		$person->deathdate = $this->request->getPost('deathdate');
		if ($this->request->getPost('father')!=0)
			$person->father = $this->request->getPost('father');
		if ($this->request->getPost('mother')!=0)
			$person->mother = $this->request->getPost('mother');
		if ($this->request->getPost('gender')!=0)
			$person->gender = $this->request->getPost('gender');

		if ($person->save() === false) {
		    echo "Umh, We can't store robots right now: \n";

		    $messages = $person->getMessages();

		    foreach ($messages as $message) {
		        echo $message, "\n";
		    }
		    exit;
		}

		$response = new Response();
		return $response->redirect("/family/one/1?d=8");

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


		$males = Person::find(["conditions" => "gender = 'm'"]);
		$females = Person::find(["conditions" => "gender = 'f'"]);



		//$this->jsonResult($all);
		$this->view->setVar("males", $males);
		$this->view->setVar("females", $females);


		$this->view->setVar("startId", $id);
		$this->view->setVar("all", $all);
		$this->view->setVar("newAll", $newAll);
	}


	public function detailAction($id=8)
	{
		$depth = $this->request->get('d');
		$person = Person::findFirstById($id);


		$father = Person::findFirstById($person->father);
		$mother = Person::findFirstById($person->mother);

		$children = $person->getChildrenArr();

		$childrenByParents = [];
		if ($children!=[])
		{
			$genderRole = ($person->gender == 'm')? 'mother':'father';
			foreach ($children as $child)
			{
				if (empty($child->$genderRole))
				{
					if (!isset($childrenByParents[$child->$genderRole]['parent']))
						$childrenByParents[$child->$genderRole]['parent'] = null;
					$childrenByParents['null'][] = $child;
				}
				else
				{
					if (!isset($childrenByParents[$child->$genderRole]['parent']))
						$childrenByParents[$child->$genderRole]['parent'] = Person::findFirstById($child->$genderRole);
					$childrenByParents[$child->$genderRole][] = $child;
				}

			}
		}


		// $this->jsonResult($childrenByParents);



		$males = Person::find(["conditions" => "gender = 'm'"]);
		$females = Person::find(["conditions" => "gender = 'f'"]);
		$this->view->setVar("males", $males);
		$this->view->setVar("females", $females);


		$this->view->setVar("person", $person);
		$this->view->setVar("father", $father);
		$this->view->setVar("mother", $mother);
		$this->view->setVar("childrenByParents", $childrenByParents);
	}

	//при лимите 14 особо не ломается логика джса
	public function treeAction(int $limit = 14)
	{
		//$id = $this->request->get('id');
		$people = Person::find();
		if (!$people)
			exit ('NO people');

		$peopleArr = [];
		//{ key: 0, n: "Aaron", s: "M", m:-10, f:-11, ux: 1, a: ["C", "F", "K"] },

		$kvPair = [
			"key"=>"id",
			"name"	=> "name",
			// "s"	=> "gender",
			"m"	=> "mother",
			"f"	=> "father",
		];
		$i = 0;
		foreach ($people as $key =>$person)
		{
			$i++;
			if ($i>$limit) continue;
			$personArr = new \stdClass;

			foreach ($kvPair as $k => $v) {
				if ($person->$v!==null)
					$personArr->$k = $person->$v;
			}
			$personArr->s = strtoupper($person->gender);
			if ($person->gender == 'm' && ($person->children->getFirst()->mother!==null))
				$personArr->ux = $person->children->getFirst()->mother;
			else if ($person->gender == 'f' && ($person->children->getFirst()->father!==null))
				$personArr->vir = $person->children->getFirst()->father;

			$personArr->source = $person->getPicture();
			$peopleArr[] = $personArr;
		}


		$this->view->setVar("people", json_encode($peopleArr, JSON_PRETTY_PRINT));
		//$this->jsonResult($people);
	}
}
