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

function InitLiveInfo()
{
    kk_diag_livedata_timerInterval = 2000;
    RequestActiveCommands();
    RequestDTCCodes();
    RequestLiveData();
}

function RequestActiveCommands()
{
    var LiveData;
    $.getJSON('/configuration/getactivecommands', function (Data) {
        if (Data!==null)
        {
           UpdateActiveCommandsList(Data);
        }
    });
}
function RequestDTCCodes()
{
    var LiveData;
    $.getJSON('/diagnostic/getdtccodes', function (Data) {
        if (Data!==null)
        {
           UpdateLiveInfoTableDTC(Data);
        }
    });
}

function RequestLiveData()
{
    var LiveData;
    $.getJSON('/diagnostic/getliveinfo', function (Data) {
         if (Data!==null)
        {
           UpdateLiveInfoTable(Data);
        }

        setTimeout("RequestLiveData();", kk_diag_livedata_timerInterval);
    });

    
}

function SendDTCClear()
{
   $.post("/diagnostic/sendcleardtc");
    
    
}

function UpdateLiveInfoTable(Data)
{
    for (var i = 0; i < Data.length; i++) {
        if ($("#kk_diag_liveinfo_table").find("#"+kk_diag_liveinfo_table_prefix+Data[i].paramid).length===0)
        {
            $("#kk_diag_liveinfo_table").append("<tr id='"+kk_diag_liveinfo_table_prefix+Data[i].paramid+"'><td tag='desc'>"+Data[i].localdesc+"</td><td tag='val'>"+Data[i].value+"</td><td tag='timestamp'>"+Data[i].timestamp+"</td></tr>");
        }
        else
        {
            $("#"+kk_diag_liveinfo_table_prefix+Data[i].paramid + " td[tag='desc']").text(Data[i].localdesc);
            $("#"+kk_diag_liveinfo_table_prefix+Data[i].paramid + " td[tag='val']").text(Data[i].value);
            $("#"+kk_diag_liveinfo_table_prefix+Data[i].paramid + " td[tag='timestamp']").text(Data[i].timestamp);
        }
    }

}

function UpdateLiveInfoTableDTC(Data)
{
    for (var i = 0; i < Data.length; i++) {
        if ($("#kk_diag_errortable").find("#"+kk_diag_liveinfodtc_table_prefix+Data[i].paramid).length===0)
        {
            $("#kk_diag_errortable").append("<tr id='"+kk_diag_liveinfodtc_table_prefix+Data[i].paramid+"'><td tag='desc'>"+Data[i].localdesc+"</td><td tag='val'>"+Data[i].value+"</td><td tag='timestamp'>"+Data[i].timestamp+"</td></tr>");
        }
        else
        {
            $("#"+kk_diag_liveinfodtc_table_prefix+Data[i].paramid + " td[tag='desc']").text(Data[i].localdesc);
            $("#"+kk_diag_liveinfodtc_table_prefix+Data[i].paramid + " td[tag='val']").text(Data[i].value);
            $("#"+kk_diag_liveinfodtc_table_prefix+Data[i].paramid + " td[tag='timestamp']").text(Data[i].timestamp);
        }
    }
}

function UpdateActiveCommandsList(Data)
{
    for (var i = 0; i < Data.length; i++) {
        if ($("#kk_kkcmd_commandslist_list").find("#"+kk_main_kkcommand_cmdlist_prefix+Data[i].paramid).length===0)
        {
            $("#kk_kkcmd_commandslist_list").append("<option id='"+kk_main_kkcommand_cmdlist_prefix+Data[i].paramid+"'>"+Data[i].desc+"</option>");
        }
        else
        {
            $("#"+kk_main_kkcommand_cmdlist_prefix+Data[i].paramid).text(Data[i].desc);

        }
    }
}