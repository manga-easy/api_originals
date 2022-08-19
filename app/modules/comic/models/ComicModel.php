<?php

namespace app\modules\comic\models;

use app\Core\IModel;

class ComicModel implements IModel
{
    public ?int $id;
    public string $title;
    public string $id_user;
    public string $uniqueid;
    public string $sinopse;
    public string $autor;
    public int $year_up;
    public string $scans;
    public bool $status;
    public string $cover;
    public string $createat;
    public string $updateat;
    function __construct(
        ?int $id,
        string $title,
        string $id_user,
        string $uniqueid,
        string $sinopse,
        string $autor,
        int $year_up,
        string $scans,
        bool $status,
        string $cover,
        string $createat,
        string $updateat
    ) {
        $this->id = $id;
        $this->title = $title;
        $this->id_user = $id_user;
        $this->uniqueid = $uniqueid;
        $this->sinopse = $sinopse;
        $this->autor = $autor;
        $this->year_up = $year_up;
        $this->scans = $scans;
        $this->status = $status;
        $this->cover = $cover;
        $this->createat = $createat;
        $this->updateat = $updateat;
    }
    function toArray(): array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'id_user' => $this->id_user,
            'uniqueid' => $this->uniqueid,
            'sinopse' => $this->sinopse,
            'autor' => $this->autor,
            'year_up' => $this->year_up,
            'scans' => $this->scans,
            'status' => $this->status,
            'cover' => $this->cover,
            'createat' => $this->createat,
            'updateat' => $this->updateat
        ];
    }
    static function arrayTo(array $params): self
    {
        return new self(
            id: $params['id'],
            id_user: $params['id_user'],
            title: $params['title'],
            uniqueid: $params['uniqueid'],
            sinopse: $params['sinopse'],
            autor: $params['autor'],
            year_up: $params['year_up'],
            scans: $params['scans'],
            status: $params['status'],
            cover: $params['cover'],
            createat: $params['createat'],
            updateat: $params['updateat']
        );
    }
}
