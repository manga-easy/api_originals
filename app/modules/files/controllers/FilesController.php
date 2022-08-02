<?php
namespace app\modules\files\controllers;

use Slim\Psr7\UploadedFile;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Psr7\Stream;
use app\modules\files\repositories\FileRepository;
use app\modules\files\models\FileModel;
class FilesController
{
    protected FileRepository $fileRepository;
    function __construct(FileRepository $fileRepository)
    {
        $this->fileRepository = $fileRepository;
    }
    function uploadFile(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        try {
            $uploadedFiles = $request->getUploadedFiles();
            $params = $request->getQueryParams();
            if (empty($params['path'])) {
                throw new \Exception("Parâmetro path é obrigatório", 1);
            }

            if (empty($params['user'])) {
                throw new \Exception("Parâmetro user é obrigatório", 1);
            }
            $path = $params['path'];
            $directory = "/var/www/files/$path";
            // handle single input with single file upload
            $uploadedFile = $uploadedFiles['example1'];
            if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
                $filename = $this->moveUploadedFile($directory, $uploadedFile);
                $this->fileRepository->create(new FileModel(
                    null,
                    $params['user'],
                    $path,
                    $filename,
                    $uploadedFile->getSize(),
                    'now()',
                    'now()')
                );
                $response->getBody()->write(json_encode(['sucesso' => $filename]));
            }

        }
        catch (\Throwable $th) {
            $response->getBody()->write(
                json_encode(['erro' => $th->getMessage()])
            );
        }
        return $response;
    }
    function moveUploadedFile($directory, UploadedFile $uploadedFile)
    {
        mkdir($directory);
        $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $uploadedFile->getClientFilename());
        return $uploadedFile->getClientFilename();
    }

    function link(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $response = $response->withHeader('Content-Type', mime_content_type("/var/www/files/{$args['path']}/{$args['file']}.{$args['ext']}"));
        $stream = fopen("/var/www/files/{$args['path']}/{$args['file']}.{$args['ext']}", 'r+');
        return $response->withBody(new Stream($stream));
    }

    function get(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        try {
            if (empty($args['id'])) {
                throw new \Exception("Parametro id do chapter é obrigatório", 1);
            }
            $dados = $this->fileRepository->get($args);
            $response->getBody()->write(
                json_encode($dados)
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
            $mangas = $this->fileRepository->list($params);
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


?>