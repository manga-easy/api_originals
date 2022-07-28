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

    function __construct(
        $id,
        $title,
        $id_user,
        $uniqueid,
        $sinopse,
        $autor,
        $year_up,
        $scans,
        $status,
        $cover
        )
    {
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
            'cover' => $this->cover
        ];
    }
    static function arrayTo(array $params): self
    {
        return new self(
            id: $params['id'],
            id_user:$params['id_user'],
            title: $params['title'],
            uniqueid: $params['uniqueid'],
            sinopse: $params['sinopse'],
            autor: $params['autor'],
            year_up: $params['year_up'],
            scans: $params['scans'],
            status: $params['status'],
            cover: $params['cover']
        );
    }

}