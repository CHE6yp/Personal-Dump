<?php
use \Phalcon\Mvc\Model;
class Page extends ModelBase
{
	public function initialize()
	{
		$this->setSource('page');
		$this->hasMany(
			"id",
			"Option",
			"pageId",
			['alias' => 'options']
		);
	}
}
