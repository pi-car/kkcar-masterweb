/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var kk_diag_livedata_timer;
var kk_diag_livedata_timerInterval;
var kk_diag_liveinfo_table_prefix = "kk_diag_liveinfo_table_";
var kk_diag_liveinfodtc_table_prefix = "kk_diag_liveinfodtc_table_";
var kk_main_kkcommand_cmdlist_prefix = "kk_kkcmd_commandslist_list_";

function InitConfigInfo()
{
    //kk_diag_livedata_timerInterval = 2000;
    RequestConfInfo();
}

function RequestConfInfo()
{
    var LiveData;
    $.getJSON('/configuration/getconfinfo', function (Data) {
        UpdateActiveCommandsList(Data);
    });
}

function UpdateActiveCommandsList(Data)
{
    Data=Data[0];
    $("#kk_config_confinfo_carname").text(Data.carinfo);
    $("#kk_config_confinfo_confname").text(Data.confname);
    $("#kk_config_confinfo_confversion_act").text(Data.confversion_act);
    $("#kk_config_confinfo_confversion_kkc").text(Data.confversion_kkc);
    $("#kk_config_confinfo_kkversion").text(Data.kkcversion);
    $("#kk_config_confinfo_osandjava").text(Data.osversion);
    $("#kk_config_confinfo_kkstate").text(Data.kkcconfstatus);
    $("#kk_config_confinfo_carstate").text(Data.carstatus);
    $("#kk_config_confinfo_carvoltage").text("n/a");
    $("#kk_config_confinfo_timestamp").text(new Date(parseInt(Data.timestamp)));
}

