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
                        . "     odb_pids.descriptionlocal as localdesc,"
                        . "     liveinfo.value as value,"
                        . "     liveinfo.timestamp as timestamp"
                        . " FROM "
                        . " \"odb_pids\", liveinfo "
                        . " WHERE "
                        . "     (odb_pids.id=liveinfo.param_id)"
                        . " AND"
                        . "     liveinfo.kkcar_id = "
                        . "     (SELECT "
                        . "         kkcar.id "
                        . "      FROM "
                        . "         kkcar "
                        . "      WHERE "
                        . "         kkcar.uuid=$1)", array($MyID));
    }

    public function get_dtccodes($MyID) {

        return $this->dbc->ExecQuery(
                        "SELECT "
                        . "     liveinfo_dtc.id as paramid,"
                        . "     odb_dtc.dtc as value,"
                        . "     odb_dtc.descriptionlocal as localdesc,"
                        . "     liveinfo_dtc.timestamp as timestamp"
                        . " FROM "
                        . "     odb_dtc, liveinfo_dtc "
                        . " WHERE "
                        . "     (odb_dtc.id=liveinfo_dtc.dtc_val)"
                        . " AND"
                        . "     liveinfo_dtc.active=true"
                        . " AND"
                        . "     liveinfo_dtc.kkcar_id = "
                        . "     (SELECT "
                        . "         kkcar.id "
                        . "     FROM "
                        . "         kkcar "
                        . "     WHERE "
                        . "         kkcar.uuid=$1)", array($MyID));
    }
    
    public function registercmd_cleardtc($MyID) {

        return $this->dbc->ExecQuery(
                        "SELECT "
                        . "     liveinfo_dtc.id as paramid,"
                        . "     odb_dtc.dtc as value,"
                        . "     odb_dtc.descriptionlocal as localdesc,"
                        . "     liveinfo_dtc.timestamp as timestamp"
                        . " FROM "
                        . "     odb_dtc, liveinfo_dtc "
                        . " WHERE "
                        . "     (odb_dtc.id=liveinfo_dtc.dtc_val)"
                        . " AND"
                        . "     liveinfo_dtc.kkcar_id = "
                        . "     (SELECT "
                        . "         kkcar.id "
                        . "     FROM "
                        . "         kkcar "
                        . "     WHERE "
                        . "         kkcar.uuid=$1)", array($MyID));
    }

}
