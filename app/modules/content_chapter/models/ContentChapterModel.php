<?php
namespace app\modules\content_chapter\models;
use app\Core\IModel;

class ContentChapterModel implements IModel
{
    public ?int $id;
    public int $id_chapter;
    public string $content;
    public string $type;
    public string $date_at;
    public string $date_up;
    function __construct(
        $id,
        $id_chapter,
        $content,
        $type,
        $date_at,
        $date_up
        )
    {
        $this->id = $id;
        $this->id_chapter = $id_chapter;
        $this->content = $content;
        $this->type = $type;
        $this->date_at = $date_at;
        $this->date_up = $date_up;
    }
    function toArray(): array
    {
        return [
            'id' => $this->id,
            'id_chapter' => $this->id_chapter,
            'content' => $this->content,
            'type' => $this->type,
            'date_at' => $this->date_at,
            'date_up' => $this->date_up
        ];
    }

    static function arrayTo(array $params): self
    {
       return new self(
            id: $params['id'],
            id_chapter: $params['id_chapter'],
            content: $params['content'],
            type: $params['type'],
            date_at: $params['date_at'] ?? 'now()',
            date_up: $params['date_up'] ?? 'now()'
       );
    }
}
enum TypeContent: string
{
  case text = 'text';
  case image = 'image';
}