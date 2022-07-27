<?php

namespace app\Core;

use app\Core\Connect;
use PDO;
use PDOException;

/**
 * Description of WppModel
 *
 * @author Lucas Awade
 */
class DataBase
{
    private string $host;
    private string $porta_db;
    private string $base_db;
    private string $usuario;
    private string $senha;
    private PDO $instance;
    function __construct()
    {
        $this->host = getenv('DB_HOST');
        $this->porta_db = getenv('DB_PORT');
        $this->base_db = getenv('DB_BASE');
        $this->usuario = getenv('DB_USER');
        $this->senha = getenv('DB_PASSWD');

        $this->instance = new PDO(
            "pgsql:host=$this->host;port=$this->porta_db;dbname=$this->base_db",
            $this->usuario,
            $this->senha,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_CASE => PDO::CASE_NATURAL
        ]
            );
    }
    protected function strquery($stmt, $params)
    {
        foreach ($params as $key => $value) {
            if (is_null($value) || (is_string($value) && $value == '')) {
                $value = null;
            }
            $stmt->bindValue(":{$key}", $value, (is_int($value) ?PDO::PARAM_INT : PDO::PARAM_STR));
        }
    }

    public function begin()
    {
        $this->instance->beginTransaction();
        return 1;
    }

    public function commit()
    {
        $this->instance->commit();
        return 1;
    }

    public function rollback()
    {
        if ($this->instance->inTransaction()) {
            $this->instance->rollBack();
        }

        return 1;
    }

    function create($query, $data)
    {
        $stmt = $this->instance->prepare($query);
        $this->strquery($stmt, $data);
        $stmt->execute();
        return $this->instance->lastInsertId();
    }

    function read($query, $data = null)
    {
        $stmt = $this->instance->prepare($query);
        $this->strquery($stmt, $data);
        $stmt->execute();
        return $stmt;
    }

    function delete($query, $data): int
    {
        $stmt = $this->instance->prepare($query);
        $this->strquery($stmt, $data);
        $stmt->execute();
        return ($stmt->rowCount() ? 1 : 0);
    }

    function update($query, $data): int
    {
        $stmt = $this->instance->prepare($query);
        $this->strquery($stmt, $data);
        $stmt->execute();
        return ($stmt->rowCount() ? 1 : 0);
    }
}