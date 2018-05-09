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

		$this->hasManyToMany(
		    "id",
		    "ChildToParent",
		    'parent',
		    "child",
		    'Person',
		    'id',
		    ['alias' => 'children']
		);
	}

	public function getTree()
	{
		if(!empty($this->parents))
			$parents = $this->parents->getTree();
		else
			$parents = [];

		return $parents;
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

	public function getChildrenArr()
	{
		if(empty($this->children))
			return [];

		$children = [];

		foreach ($this->children as $child)
			$children[] = $child;

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
		if(!empty($this->children)){
			$children = $this->getChildrenArr();
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
}