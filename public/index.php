<?php
use Slim\Factory\AppFactory;
use DI\Container;
use app\modules\comic\controllers\ComicController;

require __DIR__ . '/../vendor/autoload.php';
$di = new Container();

// Set container to create App with on AppFactory
AppFactory::setContainer($di);

// Instantiate App
$app = AppFactory::create();

// Add error middleware
$app->addErrorMiddleware(true, true, true);

// $app->get('/manga', [QueueController::class , 'list']);
$app->get('/detalhesmanga', [ComicController::class , 'call']);
// $app->get('/imagechapter', [QueueController::class , 'list']);

$app->run();