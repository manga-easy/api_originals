<?php
namespace app\modules\files;

use Slim\Psr7\UploadedFile;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Message\ResponseInterface;
use Slim\Psr7\Stream;
class FilesController
{
    function uploadFile(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        $uploadedFiles = $request->getUploadedFiles();
        $path = $request->getQueryParams()['path'];
        $directory = "/var/www/files/$path";
        // handle single input with single file upload
        $uploadedFile = $uploadedFiles['example1'];
        if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
            $filename = $this->moveUploadedFile($directory, $uploadedFile);
            $response->getBody()->write('uploaded ' . $filename . '<br/>');
        }


        // handle multiple inputs with the same key
        foreach ($uploadedFiles['example2'] as $uploadedFile) {
            if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
                $filename = $this->moveUploadedFile($directory, $uploadedFile);
                $response->getBody()->write('uploaded ' . $filename . '<br/>');
            }
        }

        // handle single input with multiple file uploads
        foreach ($uploadedFiles['example3'] as $uploadedFile) {
            if ($uploadedFile->getError() === UPLOAD_ERR_OK) {
                $filename = $this->moveUploadedFile($directory, $uploadedFile);
                $response->getBody()->write('uploaded ' . $filename . '<br/>');
            }
        }
        return $response;
    }
    function moveUploadedFile($directory, UploadedFile $uploadedFile)
    {
        mkdir($directory);
        $extension = pathinfo($uploadedFile->getClientFilename(), PATHINFO_EXTENSION);
        $basename = bin2hex(random_bytes(8)); // see http://php.net/manual/en/function.random-bytes.php
        $filename = sprintf('%s.%0.8s', $basename, $extension);

        $uploadedFile->moveTo($directory . DIRECTORY_SEPARATOR . $filename);

        return $filename;
    }

    function link(ServerRequestInterface $request, ResponseInterface $response, array $args): ResponseInterface
    {
        // $response->getBody()->write("/var/www/files/{$args['path']}/{$args['file']}");
        // return $response;
        $response = $response->withHeader('Content-Type', 'application/pdf');
        $stream = fopen("/var/www/files/{$args['path']}/{$args['file']}.pdf", 'r+');

        return $response->withBody(new Stream($stream));
    }
}


?>