<script src="/js/kk.config.js" type="text/javascript"></script>
<link rel="stylesheet" href="/js/jointjs/joint.css" />
<script src="/js/jointjs/joint.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        InitConfigEditor();
    })</script>
<div>
    <h1>Автомобиль</h1>
</div>

<div id="kk_config_main">
    <div id="kk_config_config_features">
        <select id="kk_config_configuration_features_selector" onchange="LoadFeatureToEditor(this.selectedIndex)"></select>
        <button id="kk_config_configuration_button_save" >Сохранить</button>
        <button id="kk_config_configuration_button_refresh" onclick="LoadCurrentFeatureToEditor()">Обновить</button>
    </div>
    <div id="kk_config_plugin_editor_overlay" class="popup_overlay">
        <div id="kk_config_plugin_editor_linkprop" class="popup">
            Плагин:
            <h3 id="kk_config_plugineditor_pluginname">plugin_name</h2>
                <h4 id="kk_config_plugineditor_plugindescription">plugin_description</h2>
                    Соединения:
                    <div id="kk_config_plugineditor_connections">
                        <div id="kk_config_plugineditor_connection">
                            <p class="pconnection_name">conn</p>
                            <p class="pconnection_targetplugin">conn_pl</p>
                            <ul class="pconnection_targetpins">
                            </ul>
                        </div>
                    </div>


                    <select id="kk_config_plugin_editor_linkprop_linktype"></select>
                    <button onclick="CloseLinkProperty()">Ok</button>
                    </div>
                    </div>

                    <div id="kk_config_plugin_editor">

                    </div>


                    </div>