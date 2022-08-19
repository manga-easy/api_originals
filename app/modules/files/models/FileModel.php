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
    public string $createat;
    public string $updateat;
    function __construct(?int $id, string $id_user, string $path, string $name, int $size, string $createat, string $updateat)
    {
        $this->id = $id;
        $this->id_user = $id_user;
        $this->path = $path;
        $this->name = $name;
        $this->size = $size;
        $this->createat = $createat;
        $this->updateat = $updateat;
    }
    static function arrayTo(array $params): self
    {
        return new self(
            id: $params['id'],
            id_user: $params['id_user'],
            path: $params['path'],
            name: $params['name'],
            size: $params['size'],
            createat: $params['createat'],
            updateat: $params['updateat']
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
            'createat' => $this->createat,
            'updateat' => $this->updateat
        ];
    }
}
