<?php

namespace app\modules\comic\repositories;
use app\Core\Repository;


class ComicRepository extends Repository
{
    function config()
    {
        $this->table = 'comic';
    }

}