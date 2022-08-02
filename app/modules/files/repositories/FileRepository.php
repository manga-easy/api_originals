<?php
namespace app\modules\files\repositories;
use app\Core\Repository;
use app\modules\files\models\FileModel;

class FileRepository extends Repository
{
    function config()
    {
        $this->table = 'file';
    }

    function get(array $params)
    {
        $dados = parent::get(['id' => $params['id']]);
        return FileModel::arrayTo($dados);
    }
}