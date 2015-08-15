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
class model_diagnostic extends Model {

    function __construct() {
        $this->dbc = new dbconnection();
    }

    public function get_liveinfo($MyID) {
        
        return $this->dbc->ExecQuery(
                  " SELECT"
                . "     liveinfo.id as paramid,"
                . "     odbpids.descriptionlocal as localdesc,"
                . "     liveinfo.value as value,"
                . "     liveinfo.timestamp as timestamp"
                . " FROM "
                . " \"odbpids\", liveinfo "
                . " WHERE "
                . "     (odbpids.id=liveinfo.param_id)"
                . " AND"
                . "     liveinfo.kkcar_id = "
                . "     (SELECT "
                . "         kkcar.id "
                . "      FROM "
                . "         kkcar "
                . "      WHERE "
                . "         kkcar.uuid=$1)", array($MyID));
    }


}
