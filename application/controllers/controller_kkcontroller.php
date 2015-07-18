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
class Controller_kkcontroller extends wservice {

    function __construct() {
        $this->model = new model_kkcontroller();
    }

    function Action_request() {
        if (!isset($_POST['action'])) {
            $this->AnswerError('bad request');
            return;
        }

        $action = (int) filter_input(INPUT_POST, 'action');
        $myid =  filter_input(INPUT_POST, 'myid');

        switch ($action) {
            case ACT_CTRLR_GET_MYCONF_INFO:
                $this->GetConfigurationInfo($myid);
                break;
            case ACT_CTRLR_GET_MYCONF_DATA:
                $this->GetConfigurationData();
                break;
            case ACT_CTRLR_GET_PLUGIN_INFO:
                break;
            case ACT_CTRLR_GET_PLUGIN_DATA:
                break;
            default:
                AnswerError();
                break;
        }
    }

    function GetConfigurationInfo($MyID) {
        $resData = $this->model->get_config($MyID);
        $res = array(
            'AnswerState' => 'ANS_CONF_OK',
            'Version' => 1,
            'JsonData' => json_encode($resData)
        );
        echo json_encode($res);
    }

    function GetConfigurationData() {

        $resData = $this->model->get_config($MyID);
        $res = array(
            'AnswerState' => 'ANS_CONF_OK',
            'Version' => 1,
            'JsonData' => json_encode($resData)
        );
        echo json_encode($res);
    }

    function AnswerError($dat) {
        $res = array(
            'AnswerState' => 'ANS_ERR',
            'Version' => 1,
            'JsonData' => "Error: ".$dat
        );
        echo json_encode($res);
    }

}
