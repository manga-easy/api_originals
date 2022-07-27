<?php

namespace app\modules\detalhes;
use app\Core\Repository;


class DetalhesMangaRepository extends Repository
{
    function config()
    {
        $this->table = 'comic';
    }

}