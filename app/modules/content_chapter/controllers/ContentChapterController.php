<?php

namespace app\modules\content_chapter\controllers;

use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use app\modules\content_chapter\repositories\ContentChapterRepository;
use app\modules\content_chapter\models\ContentChapterModel;
use app\modules\content_chapter\models\TypeContent;

class ContentChapterController
{
  protected ContentChapterRepository $contentChapterRepository;
  function __construct(ContentChapterRepository $contentChapterRepository)
  {
    $this->contentChapterRepository = $contentChapterRepository;
  }
  function get(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      if (empty($args['id'])) {
        throw new \Exception("Parametro id do chapter é obrigatório", 1);
      }
      $dados = $this->contentChapterRepository->get($args);
      $response->getBody()->write(
        json_encode($dados)
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
      $mangas = $this->contentChapterRepository->list($params);
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
      $content = ContentChapterModel::arrayTo($body);
      $type = TypeContent::tryFrom($content->type);
      if (empty($type)) {
        throw new \Exception("Tipo de conteúdo inválido", 1);
      }
      $dados = $this->contentChapterRepository->create($content);
      $response->getBody()->write(
        json_encode(['success' => $dados])
      );
    } catch (\Throwable $th) {
      $response->getBody()->write(
        json_encode(['erro' => $th->getMessage()])
      );
    }
    return $response;
  }

  function update(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      $body = json_decode($request->getBody()->getContents(), true);
      $content = ContentChapterModel::arrayTo($body);
      TypeContent::tryFrom($content->type);
      $content->updateat = 'now()';
      $dados = $this->contentChapterRepository->update($content->toArray());
      $response->getBody()->write(
        json_encode(['success' => $dados])
      );
    } catch (\Throwable $th) {
      $response->getBody()->write(
        json_encode(['erro' => $th->getMessage()])
      );
    }
    return $response;
  }
}