<?php

namespace app\modules\comic\controllers;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use app\modules\comic\repositories\ComicRepository;
use app\modules\comic\models\ComicModel;



class ComicController
{
  protected ComicRepository $detalhesMangaRepository;
  function __construct(ComicRepository $detalhesMangaRepository)
  {
    $this->detalhesMangaRepository = $detalhesMangaRepository;
  }
  function get(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      if (empty($args['id'])) {
        throw new \Exception("Parametro id do manga é obrigatório", 1);
      }
      $mangas = $this->detalhesMangaRepository->get($args);
      $response->getBody()->write(
        json_encode($mangas)
      );
    }
    catch (\Throwable $th) {
      $response->getBody()->write(
        json_encode(['erro' => $th->getMessage()])
      );
    }
    return $response;
  }

  function list(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      $params = $request->getQueryParams();
      $mangas = $this->detalhesMangaRepository->list($params);
      $response->getBody()->write(
        json_encode($mangas)
      );
    }
    catch (\Throwable $th) {
      $response->getBody()->write(
        json_encode(['erro' => $th->getMessage()])
      );
    }
    return $response;
  }

  function create(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      $body = json_decode($request->getBody()->getContents(), true);
      $comic = ComicModel::arrayTo($body);
      $mangas = $this->detalhesMangaRepository->create($comic);
      $response->getBody()->write(
        json_encode($mangas)
      );
    }
    catch (\Throwable $th) {
      $response->getBody()->write(
        json_encode(['erro' => $th->getMessage()])
      );
    }
    return $response;
  }
}