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
         $this->dbconn = mysqli_connect("127.0.0.1","u0133909_default","kkar123","u0133909_default");
    }
    
    public function ExecQuery($query)//,$params)
    {
        echo $query;
        die;
        $queryresult=$this->dbconn->query($query);

        if ($queryresult==false)
            return;
        
        $res=$queryresult->fetch_assoc();
        
        mysqli_free_result($queryresult);
        mysqli_close($this->dbconn);
        return  $res;
    }
   public function ExecQuerySingle($query)//,$params)
    {
      $queryresult=$this->dbconn->query($query);
        $res=$queryresult->mysqli_fetch_row();
        mysqli_free_result($queryresult);
        mysqli_close($this->dbconn);
        return  $res;
    }

}
