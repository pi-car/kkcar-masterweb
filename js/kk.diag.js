/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var kk_diag_livedata_timer;
var kk_diag_livedata_timerInterval;
var kk_diag_liveinfo_table_prefix = "kk_diag_liveinfo_table_";
var kk_diag_liveinfodtc_table_prefix = "kk_diag_liveinfodtc_table_";

function InitLiveInfo()
{
    kk_diag_livedata_timerInterval = 2000;
    RequestDTCCodes();
    RequestLiveData();
}

function RequestDTCCodes()
{
    var LiveData;
    $.getJSON('/diagnostic/getdtccodes', function (Data) {
        UpdateLiveInfoTableDTC(Data);
    });
}

function RequestLiveData()
{
    var LiveData;
    $.getJSON('/diagnostic/getliveinfo', function (Data) {
        UpdateLiveInfoTable(Data);

        setTimeout("RequestLiveData();", kk_diag_livedata_timerInterval);
    });

    
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