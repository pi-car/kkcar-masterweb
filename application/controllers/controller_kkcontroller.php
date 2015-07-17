<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of kkcontroller
 *
 * @author blinov_is
 */
class Controller_kkcontroller extends wservice
{
    function __construct() {
            $this->model=new model_kkcontroller();
      }

    function Action_request()
	{
            if (!isset($_POST['action'])) {
                return;
            }

            $action=(int)filter_input(INPUT_POST,action);
            
            switch  ($action)
            {
                case ACT_CTRLR_GET_MYCONF_INFO:
                    GetConfigurationInfo();
                    break;
                case ACT_CTRLR_GET_MYCONF_DATA:
                    GetConfigurationData();
                    break;
                case ACT_CTRLR_GET_PLUGIN_INFO:
                    break;
                case ACT_CTRLR_GET_PLUGIN_DATA:
                    break;

            }
                
        
	}
    
        
        function GetConfigurationInfo()
        {
            
            $res=$this->model->get_config();
            $res=json_encode($res);
            echo $res;
        }

        function GetConfigurationData()
        {
            
            $res=$this->model->get_config();
            $res=json_encode($res);
            echo $res;
        }

}



