<?php
namespace app\modules\content_chapter\models;
use app\Core\IModel;

class ContentChapterModel implements IModel
{
    public ?int $id;
    public int $id_chapter;
    public string $content;
    public string $type;
    public string $createAt;
    public string $updateAt;
    function __construct(
        $id,
        $id_chapter,
        $content,
        $type,
        $createAt,
        $updateAt
        )
    {
        $this->id = $id;
        $this->id_chapter = $id_chapter;
        $this->content = $content;
        $this->type = $type;
        $this->createAt = $createAt;
        $this->updateAt = $updateAt;
    }
    function toArray(): array
    {
        return [
            'id' => $this->id,
            'id_chapter' => $this->id_chapter,
            'content' => $this->content,
            'type' => $this->type,
            'createAt' => $this->createAt,
            'updateAt' => $this->updateAt
        ];
    }

    static function arrayTo(array $params): self
    {
       return new self(
            id: $params['id'],
            id_chapter: $params['id_chapter'],
            content: $params['content'],
            type: $params['type'],
            createAt: $params['createAt'] ?? 'now()',
            updateAt: $params['updateAt'] ?? 'now()'
       );
    }
}
enum TypeContent: string
{
  case text = 'text';
  case image = 'image';
}