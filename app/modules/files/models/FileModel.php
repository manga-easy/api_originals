<?php
namespace app\modules\files\models;
use app\Core\IModel;

class FileModel implements IModel
{
    static string $table = 'file';
    public ?int $id;
    public string $id_user;
    public string $path;
    public string $name;
    public int $size;
    public string $createAt;
    public string $updateAt;
    function __construct(?int $id, string $id_user, string $path, string $name, int $size, string $createAt, string $updateAt)
    {
        $this->id = $id;
        $this->id_user = $id_user;
        $this->path = $path;
        $this->name = $name;
        $this->size = $size;
        $this->createAt = $createAt;
        $this->updateAt = $updateAt;
    }
    static function arrayTo(array $params): self
    {
        return new self(
            id: $params['id'],
            id_user: $params['id_user'],
            path: $params['path'],
            name: $params['name'],
            size: $params['size'],
            createAt: $params['createAt'],
            updateAt: $params['updateAt']
            );
    }
    function toArray(): array
    {
        return [
            'id' => $this->id,
            'id_user' => $this->id_user,
            'path' => $this->path,
            'name' => $this->name,
            'size' => $this->size,
            'createAt' => $this->createAt,
            'updateAt' => $this->updateAt
        ];
    }

}