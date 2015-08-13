/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var kk_diag_livedata_timer;
var kk_diag_livedata_timerInterval;

function InitLiveInfo()
{
    kk_diag_livedata_timerInterval=20000;
    RequestLiveData();
}

function RequestLiveData()
{
    var LiveData;
    LiveData=$.getJSON('/diagnostic/getliveinfo');
    UpdateLiveInfoTable(LiveData);
    kk_diag_livedata_timer=setTimeout(RequestLiveData(),kk_diag_livedata_timerInterval);
}

function UpdateLiveInfoTable(Data)
{
    
    
}