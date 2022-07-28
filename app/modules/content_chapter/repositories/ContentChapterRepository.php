<?php

namespace app\modules\content_chapter\repositories;
use app\Core\Repository;
use app\modules\content_chapter\models\ContentChapterModel;


class ContentChapterRepository extends Repository
{
    function config()
    {
        $this->table = 'content_chapter';
    }

    function get(array $params)
    {
        $dados = parent::get(['id' => $params['id']]);
        return ContentChapterModel::arrayTo($dados);
    }

}