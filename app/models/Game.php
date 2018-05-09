<?php
use \Phalcon\Mvc\Model;
class Game extends ModelBase
{
	public function initialize()
	{
		$this->setSource('games');
		$this->hasMany("id", "GameFiles", "game_id");
	}
}
