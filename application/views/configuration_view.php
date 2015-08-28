<script src="/js/kk.config.js" type="text/javascript"></script>
<script src="/js/js-graph-it/js-graph-it.js" type="text/javascript"></script> 
<link rel="stylesheet" type="text/css" href="/js/js-graph-it/js-graph-it.css">
<script type="text/javascript">
    $(document).ready(function () {
        InitConfigEditor();
    })</script>
<div>
    <h1>Автомобиль</h1>
</div>

<div id="kk_config_main">

    <div id="kk_config_confmanager">
        <div class="canvas" id="mainCanvas"
             style="width: 350px; height: 250px; border: 1px solid black;">
            <h1 class="block draggable" id="h1_block"
                style="left: 10px; top: 10px;">
                h1 block
            </h1>
            <h2 class="block draggable" id="h2_block"
                style="left: 200px; top: 100px;">
                h2 block
            </h2>
            <div class="connector h1_block h2_block down_start down_end">
                <img src="/js/js-graph-it/arrow.gif" class="connector-start">
                <img src="/js/js-graph-it/arrow.gif" class="connector-end">
                <label class="source-label">start</label>
                <label class="middle-label">middle</label>
                <label class="destination-label">end</label>
            </div>
        </div>

    </div>

</div>