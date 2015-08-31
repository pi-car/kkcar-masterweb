/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var kk_conf_configurations_raw;
var kk_conf_configurations_obj;
var kk_conf_configuration_mainconf;

var kk_conf_featureslist_id = "#kk_config_configuration_features_selector";

function InitConfigEditor()
{
    //kk_diag_livedata_timerInterval = 2000;
    initPageObjects(); //init graphIt
    RequestConfigurationToEditor();
}

function RequestConfigurationToEditor(Data)
{
    var LiveData;
    $.getJSON('/configuration/getconfdata', function (Data) {
        LoadConfigurationToEditor(Data);
    });
}

function LoadConfigurationToEditor(Data)
{
    //
    kk_conf_configurations = Data;
    kk_conf_configurations_obj = new Array(Data.length);
    //
    for (var i = 0; i < Data.length; i++)
    {
        kk_conf_configurations_obj[i] = JSON.parse(Data[i].configuration);
        if (Data[i].conftype === "1")
        {
            kk_conf_configuration_mainconf = i;

        }
    }
    //
    //load Features selector
    //
    for (var i = 0; i < kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features.length; i++)
    {
        $(kk_conf_featureslist_id).append("<option tag="+kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features[i].FeatureUUID+">" + kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features[i].FeatureName + "</option>");


    }
}

function LoadFeatureToEditor(FeatureID)
{
    //$("#mainCanvas")
}

