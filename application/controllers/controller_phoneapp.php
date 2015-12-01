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
include "application/models/model_configuration.php";
include "application/models/model_diagnostic.php";

class Controller_phoneapp extends wservice {
    
    
    private $confmodel;
    
    function __construct() {
        $this->model = new model_phoneapp();
        $this->confmodel=new model_configuration();
        $this->diagmodel=new model_diagnostic();
    }

    function Action_request() {
        if (!isset($_POST[PARAM_PHONEAPP_POST_REQUEST_ACT])) {
            $this->AnswerError('bad request');
            return;
        }

        $action = (int) filter_input(INPUT_POST, PARAM_PHONEAPP_POST_REQUEST_ACT);
        $myid = filter_input(INPUT_POST, PARAM_PHONEAPP_POST_REQUEST_MYUUID);

        switch ($action) {
            case ACT_PHONEAPP_GET_CARINFO:
                $this->GetCarInfo($myid);
                break;
            case ACT_PHONEAPP_GET_DIAGINFO:
                $this->GetDiagInfo($myid);
            default:
                AnswerError();
                break;
        }
    }

    function GetCarInfo($MyID) {
        $resData = $this->confmodel->get_getconfinfo($MyID);

        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resData),
            'AnswerDescription'=>'Car data, Ok'
        );
        header('Content-type: application/json');
        echo json_encode($res);
    }
     function GetDiagInfo($MyID) {
        $resData = $this->diagmodel->get_dtccodes($MyID);

        $res = array(
            'AnswerState' => '0',
            'Version' => 1,
            'JsonData' => json_encode($resData),
            'AnswerDescription'=>'Car data, Ok'
        );
        header('Content-type: application/json');
        echo json_encode($res);
    }

    function AnswerError($dat) {
        $res = array(
            'AnswerState' => '1',
            'Version' => 1,
            'JsonData' => '',
            'AnswerDescription'=>"Error: " . $dat
        );
        header('Content-type: application/json');
        echo json_encode($res);
        die();
    }

}
