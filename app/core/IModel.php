<?php
namespace app\Core;
interface IModel
{
    static function arrayTo(array $params): self;
    function toArray(): array;
}