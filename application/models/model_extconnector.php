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
class model_extconnector extends Model {

    function __construct() {
        $this->dbc = new dbconnection();
    }

    public function get_pinmessages($MyID) {
        $ReqTS = time();

        $MyID = '2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1';

        $Ret = $this->dbc->ExecQuery(
                "UPDATE "
                . "   extconnector "
                . "   SET "
                . "    status=false "
                . "  WHERE "
                . "     direction=1 "
                . "     AND "
                . "     kkcar_id = "
                . "     (SELECT "
                . "         kkcar.id "
                . "      FROM "
                . "         kkcar "
                . "      WHERE "
                . "         kkcar.uuid=$1)"
                . "   AND "
                . "   timestamp<=$2"
                . "    AND"
                . "   status=true "
                . " RETURNING "
                . "  pinmessage, "
                . "    pinid, "
                . "    kkcar_id, "
                . "    status", array($MyID, $ReqTS));



        return $Ret;
    }
    public function put_pinmessages($MyID, $direction,$pinid,$pindata) {
        $ReqTS = time();

        $MyID = '2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1';

        $Ret = $this->dbc->ExecQuery(
                "INSERT INTO"
                . "   extconnector "
                . "   ( "
                . "     timestamp, "
                . "     direction,"
                . "     pinid,"
                . "     pindata,"
                . "     status"
                . "     kkcar_conf_id"
                . "    ) "
                . "     VALUES ("
                . "    ". $ReqTS .","
                . "    ". $direction .","
                . "    ". $pinid .","
                . "    ". $pinid .","
                . "    true,"
                . "    (SELECT "
                . "         kkcar.activeconfiguration "
                . "      FROM "
                . "         kkcar "
                . "      WHERE "
                . "         kkcar.uuid=$1)"
                . "    ) ", array($MyID, $ReqTS));

        return $Ret;
    }
}
