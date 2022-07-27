<?php

namespace app\Core;

use Exception;


class Repository
{
    public DataBase $db;
    protected string $table = '';

    function __construct(DataBase $db)
    {
        $this->config();
        $this->db = $db;
    }

    function config()
    {
        $this->table;
    }

    function create(IModel $objet): string|bool
    {
        $params = array_filter($objet->toArray());
        $dados = [];
        $table = $this->table;
        $query = "INSERT INTO $table (";
        foreach ($params as $key => $value) {
            $dados[$key] = $value;
            if (array_key_last($params) == $key) {
                $query .= " $key )";
            }
            else {
                $query .= " $key, ";
            }
        }
        $query .= " VALUES( ";
        foreach ($params as $key => $value) {
            if (array_key_last($params) == $key) {
                $query .= " :$key );";
            }
            else {
                $query .= " :$key, ";
            }
        }

        return $this->db->create($query, $dados);
    }
    function list(array $params = []): array
    {
        $table = $this->table;
        $query = "SELECT * FROM $table";

        return $this->db->read($query, $params)->fetchAll();
    }
    function update(array $params): int
    {
        $table = $this->table;
        $query = "UPDATE $table SET ";
        foreach ($params as $key => $value) {
            if (array_key_last($params) == $key) {
                $query .= " $key = :$key";
            }
            else {
                $query .= " $key = :$key, ";
            }
        }
        $query .= " WHERE id = :id";

        if (empty($params['id'])) {
            throw new Exception("Par�metro id � obrigat�rio, $table");
        }
        return $this->db->update($query, $params);
    }

    function delete(array $params): int
    {
        $table = $this->table;
        $query = "DELETE FROM $table WHERE id = :id";
        if (empty($params['id'])) {
            throw new Exception("Par�metro id � obrigat�rio, $table");
        }
        return $this->db->delete($query, $params);
    }
    function get(array $params)
    {
        $table = $this->table;
        $query = "SELECT * FROM $table WHERE id = :id";

        if (empty($params['id'])) {
            throw new Exception("Par�metro id � obrigat�rio, $table");
        }
        return $this->db->read($query, $params)->fetch();
    }
}