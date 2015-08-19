<?php

class Controller_diagnostic extends Controller {

    function __construct() {
        $this->view = new View();
        $this->model = new model_diagnostic();
    }


    function action_index() {
        $this->view->generate('diagnostic_view.php', 'template_view.php', null);
    }

    function action_getliveinfo() {
        $action = (int) filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_ACT);
        $myid = '2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1'; //in this must be a session!!!

        $this->GetLiveInfo($myid);
    }
  function action_getdtccodes() {
        $action = (int) filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_ACT);
        $myid = '2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1'; //in this must be a session!!!

        $this->GetLiveInfoDTC($myid);
    }
    function action_sendcleardtc() {
        $action = (int) filter_input(INPUT_POST, PARAM_CTRLR_POST_REQUEST_ACT);
        $myid = '2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1'; //in this must be a session!!!

        $this->GetLiveInfoDTC($myid);
    }
    
    function GetLiveInfo($MyID) {
        $resData = $this->model->get_liveinfo($MyID);

       // header('Content-type: application/json');
        echo json_encode($resData);
    }
    function GetLiveInfoDTC($MyID) {
        $resData = $this->model->get_dtccodes($MyID);

       // header('Content-type: application/json');
        echo json_encode($resData);
    }
    
      function SendClearDTC($MyID) {
        $resData = $this->model->registercmd_cleardtc($MyID);

       // header('Content-type: application/json');
        echo json_encode($resData);
    }

}
