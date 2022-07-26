<?php

use app\Controllers\QueueController;
use Slim\Factory\AppFactory;
use app\Controllers\DetalhesMangaController;


include __DIR__ . '/includes/config.php';
require __DIR__ . '/vendor/autoload.php';

// Instantiate App
$app = AppFactory::create();


// Add error middleware
$app->addErrorMiddleware(true, true, true);

$app->get('/manga', [QueueController::class , 'list']);
$app->get('/detalhesmanga', [DetalhesMangaController::class , 'list']);
$app->get('/imagechapter', [QueueController::class , 'list']);

$app->run();