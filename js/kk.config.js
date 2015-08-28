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

function InitConfigEditor()
{
    //kk_diag_livedata_timerInterval = 2000;
    initPageObjects(); //init graphIt
}

function RequestConfiguration()
{
    var LiveData;
    $.getJSON('/configuration/getconf', function (Data) {
        LoadConfigurationToEditor(Data);
    });
}


function LoadConfigurationToEditor(Data)
{
    
}

