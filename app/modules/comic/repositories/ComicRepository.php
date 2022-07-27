<?php

namespace app\modules\comic\repositories;
use app\Core\Repository;
use app\modules\comic\models\ComicModel;


class ComicRepository extends Repository
{
    function config()
    {
        $this->table = 'comic';
    }

    function get(array $params)
    {
        $dados = parent::get(['id' => $params['id']]);
        return ComicModel::arrayTo($dados);
    }

}