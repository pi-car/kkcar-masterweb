<script src="/js/kk.config.js" type="text/javascript"></script>
<link rel="stylesheet" href="/js/jointjs/joint.css" />
<script src="/js/jointjs/joint.min.js"></script>
<script src="/js/jointjs/joint.shapes.devs.min.js"></script>

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
            </div>
    <div id="kk_config_config_editor">
        
    </div>
    

</div>