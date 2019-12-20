<?php
$router = new \Phalcon\Mvc\Router();


// $router->add(
// 	"/blog/(.*)/",
// 	array(
// 		"controller" => "blog",
// 		"action"     => "detail",
// 		"code"     => 1
// 	)
// );

$router->add(
	"/game/:int/",
	array(
		"controller"	=> "game",
		"action"		=> "page",
		"id"			=> 1
	)
);

$router->add(
	"/calendar/:int/:int/",
	array(
		"controller"	=> "calendar",
		"action"		=> "index",
		"year"			=> 1,
		"month"			=> 2
	)
);

$router->add(
	"/calendar/saveDay/:int/:int/:int:params/",
	array(
		"controller"	=> "calendar",
		"action"		=> "saveDay",
		"year"			=> 1,
		"month"			=> 2,
		"day"			=> 3,
		"comment"		=> 4
	)
);


// $router->add(
// 	"/game/:int/",
// 	array(
// 		"controller" => "index",
// 		"action"     => "game",
// 		"pageId"     => 1
// 	)
// );
$router->handle();

return $router;
echo 'routes.php end<br>';
?>