<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Factory\AppFactory;
use app\modules\detalhes\DetalhesMangaController;
use DI\Container;

require __DIR__ . '/../vendor/autoload.php';
$container = new Container();

// Set container to create App with on AppFactory
AppFactory::setContainer($container);

// Instantiate App
$app = AppFactory::create();

// Add error middleware
$app->addErrorMiddleware(true, true, true);

// $app->get('/manga', [QueueController::class , 'list']);
$app->get('/detalhesmanga', [DetalhesMangaController::class , 'call']);
// $app->get('/imagechapter', [QueueController::class , 'list']);

$app->run();