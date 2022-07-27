<?php
namespace app\modules\chapter\models;
use app\Core\IModel;
class ChapterModel implements IModel
{
    public ?int $id;
    public int $id_comic;
    public string $title;
    public float $number;
    public string $date_up;

    function __construct(
        $id,
        $id_comic,
        $title,
        $number,
        $date_up
        )
    {
        $this->id = $id;
        $this->id_comic = $id_comic;
        $this->title = $title;
        $this->number = $number;
        $this->date_up = $date_up;
    }

    function toArray(): array
    {
        return [
            'id' => $this->id,
            'id_comic' => $this->id_comic,
            'title' => $this->title,
            'number' => $this->number,
            'date_up' => $this->date_up
        ];
    }
    static function arrayTo(array $params): self
    {
        return new self(
            id: $params['id'],
            id_comic: $params['id_comic'],
            title: $params['title'],
            number: $params['number'],
            date_up: $params['date_up']
        );
    }

}