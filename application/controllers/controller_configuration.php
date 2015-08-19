<?php

class Controller_configuration extends Controller {

    function __construct() {
        //	$this->model = new Model_Portfolio();
        $this->view = new View();
        $this->model = new model_configuration();
    }

    function action_index() {
        //$data = $this->model->get_data();		
        $this->view->generate('configuration_view.php', 'template_view.php', null);
    }

    function action_getactivecommands() {
         $myid = '2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1'; //in this must be a session!!!
        $this->GetActiveCommands($myid);
    }

    function GetActiveCommands($MyID) {
        $resData = $this->model->get_activecommands($MyID);

        // header('Content-type: application/json');
        echo json_encode($resData);
    }

}
