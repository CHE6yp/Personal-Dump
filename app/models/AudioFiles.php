<?php

use \Phalcon\Mvc\Model;
class AudioFiles extends ModelBase
{
	public function initialize()
	{
		$this->setSource('audio_files');
		// $this->hasMany(
		// 	"id",
		// 	"Option",
		// 	"pageId",
		// 	['alias' => 'options']
		// );
	}
}