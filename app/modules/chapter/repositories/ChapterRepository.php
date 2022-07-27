<?php

namespace app\modules\chapter\repositories;
use app\Core\Repository;
use app\modules\chapter\models\ChapterModel;


class ChapterRepository extends Repository
{
    function config()
    {
        $this->table = 'chapter';
    }
    function list(array $params = array()): array
    {
        $table = $this->table;
        $query = "SELECT * FROM $table WHERE 1=1";
        if (array_key_exists('id_comic', $params)) {
            $query .= "AND id_comic = :id_comic";
        }

        $dados = $this->db->read($query, $params)->fetchAll();
        $parse = [];
        foreach ($dados as $key => $value) {
            array_push($parse, ChapterModel::arrayTo($value));
        }
        return $parse;
    }
    function get(array $params)
    {
        $dados = parent::get(['id' => $params['id']]);
        return ChapterModel::arrayTo($dados);
    }
}