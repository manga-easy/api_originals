<?php
namespace app\modules\chapter\models;
use app\Core\IModel;
class ChapterModel implements IModel
{
    public ?int $id;
    public int $id_comic;
    public string $title;
    public float $number;
    public string $updateAt;
    public string $createAt;

    function __construct(
        $id,
        $id_comic,
        $title,
        $number,
        $updateAt,
        $createAt
        )
    {
        $this->id = $id;
        $this->id_comic = $id_comic;
        $this->title = $title;
        $this->number = $number;
        $this->updateAt = $updateAt;
        $this->createAt = $createAt;
    }

    function toArray(): array
    {
        return [
            'id' => $this->id,
            'id_comic' => $this->id_comic,
            'title' => $this->title,
            'number' => $this->number,
            'updateAt' => $this->updateAt,
            'createAt' => $this->createAt
        ];
    }
    static function arrayTo(array $params): self
    {
        return new self(
            id: $params['id'],
            id_comic: $params['id_comic'],
            title: $params['title'],
            number: $params['number'],
            createAt:$params['createAt'],
            updateAt: $params['updateAt']
        );
    }

}