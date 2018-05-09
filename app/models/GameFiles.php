<?php
use \Phalcon\Mvc\Model;
class GameFiles extends ModelBase
{
	public function initialize()
	{
		$this->setSource('game_files');
		$this->hasOne("game_id", "Game", "id");
	}
}
