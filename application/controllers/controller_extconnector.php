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
class Controller_extconnector extends wservice {

    function __construct() {
        $this->model = new model_extconnector();
    }

    function Action_extconnector() {
        if (!isset($_POST[PARAM_CTRLR_POST_REQUEST_ACT])) {
            $this->AnswerError('bad request');
            return;
        }

        $action = (int) filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_ACT);
        $myid = filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_MYUUID);

        switch ($action) {
            case ACT_CTRLR_EXTCONN_GETPINDATA:
                $this->GetPinMessages($myid);
                break;
            case ACT_CTRLR_EXTCONN_PUTPINDATA:
                $this->GetConfigurationData($myid);
                break;
            default:
                $this->AnswerError("Not action");
                break;
        }
    }

    function GetPinMessages($MyID) {
        $resData = $this->model->get_pinmessages($MyID);

        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resData)
        );
        header('Content-type: application/json');
        echo json_encode($res);
        die();
    }

    function PutPinMessages($MyID) {
        $resData = $this->model->put_pinmessages($MyID);

        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resData)
        );
        header('Content-type: application/json');
        echo json_encode($res);
        die();
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
