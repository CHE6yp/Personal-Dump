<?php

use \Phalcon\Mvc\Model;
class Texts extends ModelBase
{
	public function initialize()
	{
		$this->setSource('texts');
	}
}