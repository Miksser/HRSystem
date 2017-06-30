<?php

/**
 * Created by PhpStorm.
 * User: mikser
 * Date: 23.06.17
 * Time: 23:24
 */
class DataBase
{
    private $db_host = 'localhost';
    private $db_port = '5432';
    private $db_name = 'hr';
    private $db_user = 'postgres';
    private $db_pass = '1';
    private $psqlconn;

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
     *
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
                $this->numResults = pg_num_rows($query);

                for ($i = 0; $i < $this->numResults; $i++) {
                    $r = pg_fetch_assoc($query);
                    array_push($result, $r);
                }
                return $result;
            } else {
                return false;
            }
        } else
            return false;
    }

    /**
     * Request to get Join Table. Trial version.
     * @param $ arrRow
     * @param $arrFrom
     * @param $arrJoin
     * @param $arrOn
     * @param $arrAnd
     * @return bool|string
     *
     */
    public function select_join($arrRow, $arrFrom, $arrJoin, $arrOn, $arrAnd)
    {
        if (isset($arrRow) && isset($arrFrom) && isset($arrJoin) && isset($arrAnd)) {

            $row = implode(", ", $arrRow);
            $from = implode(", ", $arrFrom);
            $join = implode(', ', $arrJoin);
            $on = implode(', ', $arrOn);

            $q = 'SELECT ' . $row . ' FROM ' . $from . ' JOIN ' . $join . ' on ' . $on;
        } else {
            return false;
        }
        if (isset($arrAnd)) {
            $and = implode($arrAnd);
            $q .= ' AND ' . $and;
        }
        $query = @pg_query($this->psqlconn, $q);

        if ($query) {
            $result = [];
            $this->numResults = @pg_num_rows($query);

            for ($i = 0; $i < $this->numResults; $i++) {
                $r = @pg_fetch_assoc($query);
                array_push($result, $r);
            }
            return $result;
        } else {
            return false;
        }


    }

    /**
     * Delete info from database;
     * @param $table
     * @param null $where
     * @return bool
     *
     */
    public function delete($table, $where = null)
    {
        if ($this->tableExists($table)) {
            if (isset($where)) {
                $delete = 'DELETE FROM ' . $table . 'WHERE' . $where;
            } else {
                $delete = 'DELETE FROM ' . $table;
            }

            $sqlD = @pg_query($this->psqlconn, $delete);
            if ($sqlD) {
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
     * @param null $table
     * @param $info
     * @return bool
     */

    public function update($table = null, $info)
    {
        $table = isset($table) ? $table : $info['table'];

        if ($this->tableExists($table)) {

            $set = null;

            $k = array_keys($info);

            for ($i = 3; $i < count($info); $i++) {

                if ($i + 1 < count($info)) {
                    $set .= $k[$i] . " = '" . $info[$k[$i]] . "'" . ', ';
                } else {
                    $set .= $k[$i] . " = '" . $info[$k[$i]] . "'";
                }
            }
            $q = 'UPDATE ' . $table . ' SET ' . $set;

            if (isset($info['id'])) {
                $q .= ' WHERE id = ' . $info['id'];
            }

            $query = @pg_query($this->psqlconn, $q);

            if ($query) {
                return true;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
}
