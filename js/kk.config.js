/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var kk_conf_configurations_obj;
var kk_conf_configuration_mainconf;
var kk_conf_configuration_currentfeature;

var kk_conf_confeditor_plugins_info;
var kk_conf_confeditor_plugins_rects;

var kk_conf_featureslist_id = "#kk_config_configuration_features_selector";
var kk_conf_configurationblock = "#kk_config_plugin_editor";
var kk_conf_plugineditor_pname = "#kk_config_plugineditor_pluginname";
var kk_conf_plugineditor_pdesc = "#kk_config_plugineditor_plugindescription";

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
    kk_conf_confeditor_plugins_info = [];
    for (var i = 0; i < Data.length; i++)
    {
        if (Data[i].pins_in !== null)
        {
            Data[i].pins_in = JSON.parse(Data[i].pins_in).pins;
            for (var ii = 0; ii < Data[i].pins_in.length; ii++)
            {
                Data[i].pins_in[ii] = Data[i].pins_in[ii] + "_in";
            }
        }

        if (Data[i].pins_out !== null)
        {
            Data[i].pins_out = JSON.parse(Data[i].pins_out).pins;
        }

        kk_conf_confeditor_plugins_info[Data[i].uuid] = Data[i];

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


function SaveCurrentConfiguration()
{

}

function LoadCurrentFeatureToEditor()
{
    LoadFeatureToEditor($("#kk_config_configuration_features_selector")[0].selectedIndex);
}


function LoadFeatureToEditor(FeatureIndex)
{
    var FeatureToLoad = kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features[FeatureIndex];
    
    kk_conf_configuration_currentfeature=FeatureIndex;
    
    kk_conf_confeditor_plugins_rects = [];
    //clear diagram
    // $(kk_conf_configurationblock).empty();
    //

    for (var i = 0; i < FeatureToLoad.Connections.length; i++)
    {
        if (kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].SourcePluginUID] === undefined)
        {
            Rect = AddDiagramBlock(FeatureToLoad.Connections[i].SourcePluginUID, FeatureToLoad.Connections[i].PinName);
            kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].SourcePluginUID] = Rect;

        }
        if (kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].TargetPluginUID] === undefined)
        {
            Rect = AddDiagramBlock(FeatureToLoad.Connections[i].TargetPluginUID, FeatureToLoad.Connections[i].PinName);
            kk_conf_confeditor_plugins_rects[FeatureToLoad.Connections[i].TargetPluginUID] = Rect;
        }
    }
    for (var i = 0; i < FeatureToLoad.Connections.length; i++)
    {
        var Conn = FeatureToLoad.Connections[i];
        AddDiagramLink(kk_conf_confeditor_plugins_rects[Conn.SourcePluginUID].id, kk_conf_confeditor_plugins_rects[Conn.TargetPluginUID].id, Conn.ConnectionName);
    }

}

function AddDiagramBlock(id)
{

    var rect = new joint.shapes.basic.Rect({
        size: {width: 120, height: 90},
        attrs: {
            '.label': {text: kk_conf_confeditor_plugins_info[id].name, 'ref-x': .4, 'ref-y': .2, 'font-size': 12},
            rect: {fill: '#2ECC71'}
        }
    });
    rect.id=id;
    graph.addCells([rect]);

    return rect;
}

function AddDiagramLink(Rid, Rid2, LinkName)
{
    var link = new joint.dia.Link({
        source: {id: Rid},
        target: {id: Rid2}
    });


    link.label(0, {
        position: 0.5,
        attrs: {
            rect: {fill: 'white'},
            text: {fill: 'blue', text: LinkName}
        }
    });

    link.on('change:source', function () {
        SetLinkType();
    })
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

    var myAdjustVertices = _.partial(adjustVertices, graph);

// adjust vertices when a cell is removed or its source/target was changed
    graph.on('add remove change:source change:target', myAdjustVertices);

// also when an user stops interacting with an element.
    paper.on('cell:pointerup', myAdjustVertices);

    paper.on("cell:pointerdblclick", function (cellView, evt, x, y) {
        if (!cellView.model.isLink())
        {
            OpenPluginEditor(cellView.model.id);
        }

    });

}


function OpenPluginEditor(id)
{
    var Plugin=kk_conf_confeditor_plugins_info[id];
    //Show Editor
    p = $(".popup_overlay");
    p.css('display', 'block')
    //Fill
    //Head
    $(kk_conf_plugineditor_pname).text(Plugin.name);
    $(kk_conf_plugineditor_pdesc).text(Plugin.description);
    //Connections
    var CurrentFeature = kk_conf_configurations_obj[kk_conf_configuration_mainconf].Features[kk_conf_configuration_currentfeature];
    //
    for (var i=0;i<CurrentFeature.Connections.length;i++)
    {
        $("#kk_config_plugineditor_connections").append($("#kk_config_plugineditor_connection").clone().attr('id',"kk_config_plugineditor_connection_"+i));
        $("#kk_config_plugineditor_connection_"+i).text(CurrentFeature.Connections[i].ConnectionName);
    }
    
}

function GetPluginConnections(id)
{
    
    
    
}
function CloseLinkProperty()
{
    p = $(".popup_overlay");
    p.css('display', 'none')
}


function adjustVertices(graph, cell) {

    // If the cell is a view, find its model.
    cell = cell.model || cell;

    if (cell instanceof joint.dia.Element) {

        _.chain(graph.getConnectedLinks(cell)).groupBy(function (link) {
            // the key of the group is the model id of the link's source or target, but not our cell id.
            return _.omit([link.get('source').id, link.get('target').id], cell.id)[0];
        }).each(function (group, key) {
            // If the member of the group has both source and target model adjust vertices.
            if (key !== 'undefined')
                adjustVertices(graph, _.first(group));
        });

        return;
    }

    // The cell is a link. Let's find its source and target models.
    var srcId = cell.get('source').id || cell.previous('source').id;
    var trgId = cell.get('target').id || cell.previous('target').id;

    // If one of the ends is not a model, the link has no siblings.
    if (!srcId || !trgId)
        return;

    var siblings = _.filter(graph.getLinks(), function (sibling) {

        var _srcId = sibling.get('source').id;
        var _trgId = sibling.get('target').id;

        return (_srcId === srcId && _trgId === trgId) || (_srcId === trgId && _trgId === srcId);
    });

    switch (siblings.length) {

        case 0:
            // The link was removed and had no siblings.
            break;

        case 1:
            // There is only one link between the source and target. No vertices needed.
            cell.unset('vertices');
            break;

        default:

            // There is more than one siblings. We need to create vertices.

            // First of all we'll find the middle point of the link.
            var srcCenter = graph.getCell(srcId).getBBox().center();
            var trgCenter = graph.getCell(trgId).getBBox().center();
            var midPoint = g.line(srcCenter, trgCenter).midpoint();

            // Then find the angle it forms.
            var theta = srcCenter.theta(trgCenter);

            // This is the maximum distance between links
            var gap = 20;

            _.each(siblings, function (sibling, index) {

                // We want the offset values to be calculated as follows 0, 20, 20, 40, 40, 60, 60 ..
                var offset = gap * Math.ceil(index / 2);

                // Now we need the vertices to be placed at points which are 'offset' pixels distant
                // from the first link and forms a perpendicular angle to it. And as index goes up
                // alternate left and right.
                //
                //  ^  odd indexes 
                //  |
                //  |---->  index 0 line (straight line between a source center and a target center.
                //  |
                //  v  even indexes
                var sign = index % 2 ? 1 : -1;
                var angle = g.toRad(theta + sign * 90);

                // We found the vertex.
                var vertex = g.point.fromPolar(offset, angle, midPoint);

                sibling.set('vertices', [{x: vertex.x, y: vertex.y}]);
            });
    }
}
;
