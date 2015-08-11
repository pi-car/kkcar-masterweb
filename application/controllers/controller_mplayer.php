<?php

class Controller_mplayer extends Controller
{

	function __construct()
	{
	//	$this->model = new Model_Portfolio();
		$this->view = new View();
	}
	
	function action_index()
	{
		//$data = $this->model->get_data();		
		$this->view->generate('mplayer_view.php', 'template_view.php', null);
	}
}
