<?php

use \Phalcon\Mvc\Model;
class Users extends ModelBase
{
	public function initialize()
	{
		$this->setSource('users');
		// $this->hasMany(
		// 	"id",
		// 	"Option",
		// 	"pageId",
		// 	['alias' => 'options']
		// );
	}
}