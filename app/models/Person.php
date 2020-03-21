<?php
use \Phalcon\Mvc\Model;
class Person extends ModelBase
{
	public $level = 0;
	public $check = false;

	public function initialize()
	{
		$this->setSource('people');

		$this->hasManyToMany(
			"id",
			"ChildToParent",
			"child",
			'parent',
			'Person',
			'id',
			['alias' => 'parents']
		);
	}

	public function getParents()
	{
		$res = [Person::findFirst($this->father), Person::findFirst($this->mother)]; //this var_dumps values
		//var_dump($res);

		//$res = Person::find(['conditions' => "father = $this->id or mother = $this->id",
							//'hydration' => ResultSet::HYDRATE_ARRAYS]);
		//var_dump($res);
		return $res; //this returns NULL. WHY?!
	}

	public function getParentArr()
	{

		$parents = [];

		foreach ([Person::findFirst($this->father), Person::findFirst($this->mother)] as $parent)
			$parents[] = $parent;

		return $parents;
	}

	public function getPicture()
	{
		if (file_exists("/var/www/html/public/images/people/{$this->id}.jpg"))
			return "/images/people/{$this->id}.jpg";
		else
			return "/images/people/person-placeholder.jpg";
	}

	public function getChildren()
	{
		//var_dump($this->id);
		$children = ($this->gender=="m")? 
			Person::find(['conditions' => "father = $this->id"]) : 
			Person::find(['conditions' => "mother = $this->id"]);
	    //var_dump($children->toArray());
		$result = [];
		foreach ($children as $child) {
			$result[] = $child;
		}
		return $result;
	}

	public function getRec($depth, $count = 0)
	{
		
		$thisParents = $this->getParents();
		$siblings = [];
		//var_dump($thisParents);
		foreach ($thisParents as $parent) {
			//var_dump($parent->getChildren());
			//var_dump($parent);
			$siblings=array_merge($siblings,$parent->getChildren());
		}
		$siblings = array_unique($siblings);
		$parents = [];
		foreach ($siblings as $sibling) {
			$parents = array_merge($parents, $sibling->getParents());
		}
		//var_dump($parents);

		$result = array_unique(array_merge($siblings, $parents));

		if ($count<$depth){
			$count++;
			foreach ($result as $person) {
				$result = array_unique(array_merge($result, $person->getRec($depth, $count)));
			}
		}

		return $result;

	}

	public function getRelativeRecursive($depth,$count = 0)
	{
		$count++;
		if($this->check)
			return [];

		$this->check = true;
		$parents=[];
		$children=[];
		$all = [];
		if(!empty($this->parents)){
			$parents = $this->getParentArr();
			foreach ($parents as $p)
			{
				$p->level = $this->level + 1;
			}
		}
		if(!empty($this->getChildren())){
			$children = $this->getChildren();
			foreach ($children as $c)
			{
				$c->level = $this->level - 1;
			}
		}
		$all =  array_merge($children, $parents);

		if ($count<$depth)
		{
			$newAll = $all;
			foreach ($newAll as $person) {
				if ($person == false)
					break;
				$rAll = $person->getRelativeRecursive($depth, $count);
				$all = array_merge($all, $rAll);
			}
		}
		return $all;
	}


	public function __toString() {
		return $this->id;
	}

	public function getFullName()
	{
		return $this->name.' '.$this->surname;
	}
}