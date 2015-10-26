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
                "SELECT "
                . "    pinmessage, "
                . "    pinid, "
                . "    kkcar_id, "
                . "    status"
                . "  FROM "
                . "   extconnector"
                . "  WHERE "
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
                . "   status=true;", array($MyID, $ReqTS));


        $this->dbc->ExecQuery(
                "UPDATE "
                . "   extconnector "
                . "   SET "
                . "    status=false "
                . "  WHERE "
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
                . "   status=true;", array($MyID, $ReqTS));
 


        return $Ret;
    }

}
