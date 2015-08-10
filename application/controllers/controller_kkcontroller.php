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
        if (!isset($_POST[PARAM_CTRLR_POST_REQUEST_ACT])) {
            $this->AnswerError('bad request');
            return;
        }

        $action = (int) filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_ACT);
        $myid = filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_MYUUID);

        switch ($action) {
            case ACT_CTRLR_GET_MYCONF_INFO:
                $this->GetConfigurationInfo($myid);
                break;
            case ACT_CTRLR_GET_MYCONF_DATA:
                $this->GetConfigurationData($myid);
                break;
            case ACT_CTRLR_GET_PLUGIN_INFO:
                break;
            case ACT_CTRLR_GET_PLUGIN_DATA:
                break;
            case ACT_CTRLR_GET_FILES_INFO_BIN:
                $this->GetFilesInfo($myid,True);
                break;
            case ACT_CTRLR_GET_FILES_INFO_EXTCONF:
                $this->GetFilesInfo($myid,False);
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

    function GetConfigurationData($MyID) {

        $resData = $this->model->get_config_data($MyID);
        if ($resData == FALSE)
            $this->AnswerError('request error, wrong uuid?');

        $resPre = array(
            'kkcaruid' => $MyID,
            'configurations' => $resData
        );
        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resPre)
        );
        header('Content-type: application/json');
        echo json_encode($res);
    }

    function GetFilesInfo($MyID,$IsBinFile) {
        $reqFiles="";
        $confUID="";
        if ($IsBinFile) {
            $reqFiles = filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_REQFILESBIN);
        } else {
            $confUID = filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_CONFUUID);
        }

        $resData = $this->model->get_files_info($MyID,$reqFiles, $confUID, $IsBinFile);
        if ($resData == FALSE) {
            $this->AnswerError('request error, wrong uuid?');
        }

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
            'JsonData' => "Error: " . $dat
        );
        header('Content-type: application/json');
        echo json_encode($res);
        die();
    }

}
