<?php
use \Phalcon\Mvc\Model;
class Option extends ModelBase
{
	public function initialize()
	{
		$this->setSource('options');
	}

	public function nextPage()
	{
		return '/game/page?id='.$this->nextpageid;
	}
}
