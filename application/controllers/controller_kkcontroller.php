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
            case ACT_CTRLR_GET_FILES_INFO_BIN:
                GetFilesInfo(TRUE);
                break;
            case ACT_CTRLR_GET_FILES_INFO_EXTFILES:
                GetFilesInfo(FALSE);
                break;
            default:
                AnswerError();
                break;
        }
    }

    function GetConfigurationInfo($MyID) {
        $resData = $this->model->get_config($MyID);
        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resData)
        );
        header('Content-type: application/json');
        echo json_encode($res);
    }

    function GetConfigurationData() {

        $resData = $this->model->get_config_data($MyID);
        if ($resData==FALSE)
            AnswerError('request error, wrong uuid?');
        
        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resData)
        );
        header('Content-type: application/json');
        echo json_encode($res);
    }
     function GetFilesInfo($IsBinFile) {

        $resData = $this->model->get_files_info($MyID,$jsrequest,$IsBinFile);
        if ($resData==FALSE)
            AnswerError('request error, wrong uuid?');
        
        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resData)
        );
        header('Content-type: application/json');
        echo json_encode($res);
    }

    function AnswerError($dat) {
        $res = array(
            'AnswerState' => '1',
            'Version' => 1,
            'JsonData' => "Error: ".$dat
        );
        header('Content-type: application/json');
        echo json_encode($res);
        die();
    }

}
