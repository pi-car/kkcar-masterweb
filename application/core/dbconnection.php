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
    
    public function ExecQuery($query,$params)
    {
        echo $query;
        echo $params;
        die();
        
        
        $result = pg_query_params($this->dbconn,$query,$params) or die('Query failed: ' . pg_last_error());
        pg_close($this->dbconn);
        return  pg_fetch_array($result);
    }
   
    
}
