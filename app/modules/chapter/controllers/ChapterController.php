<?php

namespace app\modules\chapter\controllers;

use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use app\modules\chapter\repositories\ChapterRepository;
use app\modules\chapter\models\ChapterModel;



class ChapterController
{
  protected ChapterRepository $detalhesMangaRepository;
  function __construct(ChapterRepository $detalhesMangaRepository)
  {
    $this->detalhesMangaRepository = $detalhesMangaRepository;
  }
  function get(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      if (!array_key_exists('id', $args)) {
        throw new \Exception("Parametro id do manga é obrigatório" . var_export($args, true), 1);
      }
      $mangas = $this->detalhesMangaRepository->get($args);
      $response->getBody()->write(
        json_encode($mangas)
      );
    } catch (\Throwable $th) {
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
    } catch (\Throwable $th) {
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
      $body['updateat'] = 'now()';
      $comic = ChapterModel::arrayTo($body);
      $mangas = $this->detalhesMangaRepository->create($comic);
      $response->getBody()->write(
        json_encode($mangas)
      );
    } catch (\Throwable $th) {
      $response->getBody()->write(
        json_encode(['erro' => $th->getMessage()])
      );
    }
    return $response;
  }
}
