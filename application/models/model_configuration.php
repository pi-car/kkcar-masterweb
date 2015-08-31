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
class model_configuration extends Model {

    function __construct() {
        $this->dbc = new dbconnection();
    }

    public function get_getconfinfo($MyID) {

        return $this->dbc->ExecQuery(
                        "SELECT "
                        . "  kkcar_confinfo.id as paramid, "
                        . "  kkcar_confinfo.carinfo as carinfo, "
                        . "  configurations.name as confname, "
                        . "  configurations.stamp as confversion_act, "
                        . "  kkcar_confinfo.configversion as confversion_kkc, "
                        . "  kkcar_confinfo.kkcontrollerversion as kkcversion,	"
                        . "  kkcar_confinfo.osversion as osversion,	"
                        . "  kkcar_confinfo.confstatus as kkcconfstatus,	"
                        . "  kkcar_confinfo.carstatus as carstatus,	"
                        . "  kkcar_confinfo.timestamp as timestamp	"
                        . " FROM "
                        . "  kkcar_confinfo,configurations "
                        . " WHERE "
                        . "  kkcar_confinfo.kkcar=configurations.id "
                        . " AND "
                        . "  kkcar_confinfo.kkcar = "
                        . "  (SELECT "
                        . "      kkcar.id "
                        . "   FROM "
                        . "      kkcar "
                        . "   WHERE "
                        . "      kkcar.uuid=$1)", array($MyID));
    }

    public function get_activecommands($MyID) {

        return $this->dbc->ExecQuery(
                        " SELECT"
                        . "     kkcar_commands.id as paramid,"
                        . "     kkcar_commands.description as desc,"
                        . "     kkcar_commands.status as status"
                        . " FROM "
                        . " kkcar_commands "
                        . " WHERE "
                        . "     (kkcar_commands.status>=1)"
                        . " AND"
                        . "     kkcar_commands.kkcar = "
                        . "     (SELECT "
                        . "         kkcar.id "
                        . "      FROM "
                        . "         kkcar "
                        . "      WHERE "
                        . "         kkcar.uuid=$1)", array($MyID));
    }
    
     public function get_pluginsconfiguration($MyID) {

        return $this->dbc->ExecQuery(
                       "SELECT "
                        . "  configurations.uuid as confuid, "
                        . "  configurations.configuration as configuration, "
                        . "  configurations.configurationtype as conftype, "
                        . "  configurations.description as confdescription	"
                        . " FROM "
                        . "  configurations,kkcar "
                        . " WHERE "
                        . "  configurations.ownerconf=kkcar.activeconfiguration "
                        . " AND "
                        . "  kkcar.uuid=$1 "
                        , array($MyID));
    

    }
}
    