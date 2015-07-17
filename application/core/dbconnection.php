<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of dbconnection
 *
 * @author blinov_is
 */
class dbconnection {
    private $dbconn;
    
    function __construct() {
         $this->dbconn = pg_connect("host=localhost dbname=kkcar user=kkcar password=kkcar");
    }
    
    public function ExecQuery($query)
    {
        $result = pg_query($this->dbconn,$query) or die('Query failed: ' . pg_last_error());
        pg_close($this->dbconn);
        echo $result;
        return  pg_fetch_array($result);
    }
    
}
