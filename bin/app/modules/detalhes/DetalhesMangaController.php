<?php

namespace app\modules\detalhes;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;

class DetalhesMangaController
{

  function call(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
  {
    try {
      $manga = $request->getQueryParams()['manga'];
      $manga = str_replace($manga, 'easy-scan', '');
      $response->getBody()->write(
        json_encode(['ok' => true])
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