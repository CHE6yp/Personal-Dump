<?php

return new \Phalcon\Config(array(
	'database' => array(
		'adapter'     => 'Mysql',
		'host'        => 'localhost',
		'username'    => '<user>',
		'password'    => '<password>',
		'dbname'      => '<dbname>',
	),
	'application' => array(
		'appDir'         => __DIR__ . '/../../app/',
		'controllersDir' => __DIR__ . '/../../app/controllers/',
		'modelsDir'      => __DIR__ . '/../../app/models/',
		'viewsDir'       => __DIR__ . '/../../app/views/',
		'pluginsDir'     => __DIR__ . '/../../app/plugins/',
		'libraryDir'     => __DIR__ . '/../../app/library/',
		'cacheDir'       => __DIR__ . '/../../app/cache/',
		'configDir'      => __DIR__ . '/../../app/config/',
		'baseUri'        => '/', 
	)
));

?>