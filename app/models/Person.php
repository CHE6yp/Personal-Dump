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

	public function getParentArr()
	{
		if(empty($this->parents))
			return [];

		$parents = [];

		foreach ($this->parents as $parent)
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
		$children = Person::find([
	        'conditions' => 'father = :id: OR mother = :id:', 
	        'bind'       => [
	            'id' => $this->id,
	        ]
	    ]);
		return $children;
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