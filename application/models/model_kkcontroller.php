<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of model_kkcontroller
 *
 * @author blinov_is
 */
class model_kkcontroller extends Model {
    
    function __construct() {
            $this->dbc=new dbconnection();
    }

    
    	public function get_data()
	{
            
        
        }
        
        
        public function get_config($MyID)
        {
            return $this->dbc->ExecQuery("SELECT kkcar.uuid AS kkcaruuid,configurations.uuid AS confuuid,configurations.stamp AS confstamp from kkcar INNER JOIN configurations ON (configurations.id=kkcar.activeconfiguration) WHERE kkcar.uuid='" . $MyID."'");
            
        }
         public function get_config_data()
        {
            return $this->dbc->ExecQuery("SELECT * FROM configurations");
            
        }
}
