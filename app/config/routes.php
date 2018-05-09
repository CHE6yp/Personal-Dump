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
		"controller" => "game",
		"action"     => "page",
		"id"     => 1
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