<script src="/js/kk.diag.js" type="text/javascript"></script>
    
<script type="text/javascript">
    $(document).ready(function(){InitLiveInfo();})</script>
 
<h1>Диагностика и мониторинг</h1>

<div id="kk_diag_main">
    <div id="kk_diag_carselector">
        
    </div>
    <div id="kk_diag_main_liveinfo">
       <div id="kk_diag_main_liveinfo_table">
            <table id="kk_diag_liveinfo_table">
                 <tr id="kk_diag_liveinfo_table_head">
                    <th>
                        Параметр    
                    </th>
                    <th>
                        Значение
                    </th>
                    <th>
                        Время
                    </th>
                </tr> 
            </table>
        </div>  
    </div>
    <br>
    
    <div id="kk_diag_main_errors">
        <div id="kk_diag_main_errors_table">
            <table id="kk_diag_errortable">
                <tr id="kk_diag_errortable_head">
                    <th>
                        Код ошибки    
                    </th>
                    <th>
                        Описание (ODB)
                    </th>
                    <th>
                        Описание (RUS)
                    </th>
                </tr>
            </table>
        </div>
             
        <div id="kk_diag_main_errors_buttons">
            <button onclick="RequestDTCCodes()">Обновить список ошибок</button>
            <button onclick="SendDTCClear()">Очистить ошибки (сброс ошибок автомобиля)</button>
        </div>
    </div>
    
</div>

