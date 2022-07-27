<?php

namespace app\modules\comic\controllers;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use app\modules\comic\repositories\ComicRepository;


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
        throw new \Exception("Parametro manga é obrigatório", 1);
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
      $mangas = $this->detalhesMangaRepository->list();
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