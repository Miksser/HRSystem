<?php

class DataBase
{
    private $db_host = 'localhost';
    private $db_port = '5432';
    private $db_name = 'hr';
    private $db_user = 'postgres';
    private $db_pass = '1';
    protected $psqlconn;
    private $con;

    /**
     * Connect to the DB. Check "con" on a lie.
     * If lie - start connect, and return con-true.
     * @return bool
     */
    public function connect()

    {
        if (!$this->con) {
            $this->psqlconn = @pg_connect("host = $this->db_host port = $this->db_port 
            dbname = $this->db_name user = $this->db_user password = $this->db_pass");

            if ($this->psqlconn) {
                $this->con = true;
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * Disconnect to the DB
     * Check "con" on a true. If true - discon, and return con-false
     */
    public function disconnect()
    {
        if ($this->con) {
            if (@pg_close()) {
                $this->con = false;
                return false;
            } else {
                return false;
            }
        }
        return false;
    }

    /**
     * Check the table in the database
     * @param $table - table name
     * @return bool
     */
    public function tableExists($table)
    {
        $tablesInDb = @pg_query($this->psqlconn, 'SELECT * FROM pg_tables WHERE tablename= ' . "'$table'");

        if ($tablesInDb) {
            if (pg_num_rows($tablesInDb) == 1) {

                return true;
            } else {
                return false;
            }
        }
        return false;
    }

    /**
     * Getting information from the database
     * @param $table - table name
     * @param string $rows
     * @param null $where
     * @param null $order
     * @return array - return fetch_assoc
     */
    public function select($table, $rows = '*', $where = null, $order = null)
    {
        $result = [];

        $q = 'SELECT ' . $rows . ' FROM ' . $table;
        if ($where != null)
            $q .= ' WHERE ' . $where;
        if ($order != null)
            $q .= ' ORDER BY ' . $order;
        if ($this->tableExists($table)) {
            $query = @pg_query($this->psqlconn, $q);

            if ($query) {
                $arr = $this->createArray($query);
                return $arr;
            } else {
                return false;
            }
        } else
            return false;
    }

    /**
     * Delete info from database;
     */
    public function delete($table, $where = null)
    {
        if ($this->tableExists($table)) {
            if (isset($where)) {
                $delete = 'DELETE FROM ' . $table . ' WHERE ' . $where;
            } else {
                $delete = 'DELETE FROM ' . $table;
            }
            $query = @pg_query($this->psqlconn, $delete);
            if ($query) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * Update info from the DB
     * The cycle takes values from the info[$_GET] and collects the list of cells to be updated.
     * @param $info
     * @return bool
     */

    public function update($info, $where = null)
    {
        if (isset($info['table'])) {
            $table = $info['table'];
        } else {
            return false;
        }

        if ($this->tableExists($table)) {

            unset($info['table']);

            $set = null;
            $k = array_keys($info);

            for ($i = 0; $i < count($info); $i++) {
                if ($i + 1 < count($info)) {
                    $set .= $k[$i] . ' = $' . ($i+1) . ', ';
                } else {
                    $set .= $k[$i] . ' = $' . ($i+1);
                }
            };

            $q = 'UPDATE ' . $table . ' SET ' . $set;

            if ($where) {
                $q .= ' WHERE ' . $where;
            }
            $query = @pg_query_params($this->psqlconn, $q, $info);

            if ($query) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    /**
     * Insert new info from DB
     * @param $info $_POST request
     * @return bool
     *
     */
    public function insert($info)
    {
        if (isset($info['table'])) {
            $table = $info['table'];
        } else {
            return false;
        }

        if ($this->tableExists($table)) {

            unset($info['table']);
            $info = array_diff($info, array(''));
            $column = implode(', ', array_keys($info));
            $ph = [];

            for ($i = 0; $i < count($info); $i++) {
                $n = $i + 1;
                array_push($ph, "$$n");
            }
        } else {
            return false;
        }

        $ph = implode(", ", $ph);
        $q = 'INSERT INTO ' . $table . "($column)" . ' VALUES ' . "($ph)";
        $query = @pg_query_params($this->psqlconn, $q, $info);

        if ($query) {
            return true;
        } else {
            return false;
        }
    }


    /**
     *Make an associative array for the return
     * @param $array
     * @return array
     */
    protected function createArray($array)
    {
        $result = [];

        $numResults = pg_num_rows($array);

        for ($i = 0; $i < $numResults; $i++) {
            $r = pg_fetch_assoc($array);
            array_push($result, $r);
        }
        return $result;
    }
}