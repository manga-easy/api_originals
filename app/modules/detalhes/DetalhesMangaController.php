<?php

namespace app\modules\detalhes;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;


class DetalhesMangaController
{
  protected DetalhesMangaRepository $detalhesMangaRepository;
  function __construct(DetalhesMangaRepository $detalhesMangaRepository)
  {
    $this->detalhesMangaRepository = $detalhesMangaRepository;
  }
  function call(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      $params = $request->getQueryParams();
      if (empty($params['manga'])) {
        throw new \Exception("Parametro manga é obrigatório", 1);

      }
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