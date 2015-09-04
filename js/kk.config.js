/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var kk_conf_configurations_raw;
var kk_conf_configurations_obj;
var kk_conf_configuration_mainconf;

var kk_conf_confeditor_plugins_info;
var kk_conf_confeditor_plugins_rects;

var kk_conf_featureslist_id = "#kk_config_configuration_features_selector";
var kk_conf_configurationblock = "#kk_config_config_editor";

var graph;


function InitConfigEditor()
{
    //kk_diag_livedata_timerInterval = 2000;
    InitDiagram();
    RequestAvailablePlugins();
}
function RequestAvailablePlugins()
{
    var LiveData;
    $.getJSON('/configuration/getplugins', function (Data) {
        FillPluginsList(Data);
        RequestConfigurationToEditor();
    });
}

function RequestConfigurationToEditor()
{
    var LiveData;
    $.getJSON('/configuration/getconfdata', function (Data) {
        LoadConfigurationToEditor(Data);
    });
}

function FillPluginsList(Data)
{
    kk_conf_confeditor_plugins_info=[];
    for (var i=0;i<Data.length;i++)
    {
        if (Data[i].pins_in!==null)
            Data[i].pins_in=JSON.parse(Data[i].pins_in).pins;
        
        if (Data[i].pins_out!==null)
            Data[i].pins_out=JSON.parse(Data[i].pins_out).pins;
        
        kk_conf_confeditor_plugins_info[Data[i].uuid]=Data[i];
        
    }
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
        $(kk_conf_featureslist_id).append("<option tag=" + kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features[i].FeatureUUID + ">" + kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features[i].FeatureName + "</option>");


    }
}

function LoadFeatureToEditor(FeatureIndex)
{
    var FeatureToLoad = kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features[FeatureIndex];
    kk_conf_confeditor_plugins_rects = [];
    //clear diagram
    // $(kk_conf_configurationblock).empty();
    //

    for (var i = 0; i < FeatureToLoad.Connections.length; i++)
    {
        if (kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].SourcePluginUID] === undefined)
        {
            Rect=AddDiagramBlock(FeatureToLoad.Connections[i].SourcePluginUID,FeatureToLoad.Connections[i].PinName);
            kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].SourcePluginUID] = Rect;
            
        }
        if (kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].TargetPluginUID] === undefined)
        {
            Rect=AddDiagramBlock(FeatureToLoad.Connections[i].TargetPluginUID,FeatureToLoad.Connections[i].PinName);
            kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].TargetPluginUID] = Rect;
        }
    }
    for (var i = 0; i < FeatureToLoad.Connections.length; i++)
    {
        var Conn=FeatureToLoad.Connections[i];
        for (var ii=0; ii<Conn.PinName.length;ii++)
        {
            AddDiagramLink(kk_conf_confeditor_plugins_rects[Conn.SourcePluginUID].id,kk_conf_confeditor_plugins_rects[Conn.SourcePluginUID].ports[Conn.PinName[ii]],kk_conf_confeditor_plugins_rects[Conn.TargetPluginUID].id,kk_conf_confeditor_plugins_rects[Conn.TargetPluginUID].ports[Conn.PinName[ii]]);
        }
    }

}

function AddDiagramBlock(id)
{
    
    var rect = new joint.shapes.devs.Model({
        size: {width: 120, height: 90},
        inPorts: kk_conf_confeditor_plugins_info[id].pins_in,
        outPorts: kk_conf_confeditor_plugins_info[id].pins_out,
        attrs: {
        '.label': { text: kk_conf_confeditor_plugins_info[id].name, 'ref-x': .4, 'ref-y': .2 },
        rect: { fill: '#2ECC71' },
        '.inPorts circle': { fill: '#16A085' },
        '.outPorts circle': { fill: '#E74C3C' }
    }
    });
    graph.addCells([rect]);

    return rect;
}

function AddDiagramLink(Rid,PinIn,Rid2,PinOut)
{
    var link = new joint.dia.Link({
    source: { id: Rid, port: PinIn },
    target: { id: Rid2, port: PinOut }
    });
    graph.addCells([link]);
}

function InitDiagram()
{

    graph = new joint.dia.Graph;

    var paper = new joint.dia.Paper({
        el: $(kk_conf_configurationblock),
        width: 800,
        height: 600,
        model: graph,
        gridSize: 1
    });
}