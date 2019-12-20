<?php

use \Phalcon\Mvc\Model;
class Days extends ModelBase
{
	public function initialize()
	{
		$this->setSource('days');
	}
}