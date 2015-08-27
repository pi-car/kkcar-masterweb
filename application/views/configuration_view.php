<script src="/js/kk.config.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){InitConfigInfo();})</script>
<div>
<h1>Автомобиль</h1>
</div>

<div id="kk_config_main">
        <table>
    <div id="kk_config_confmanager">
        <div id="kk_config_carinfo">
            <table>
                <tr>
                    <td>Автомобиль</td>
                    <td id="kk_config_confinfo_carname">---</td>
                </tr>
                <tr>
                    <td>Конфигурация</td>
                    <td id="kk_config_confinfo_confname"></td>
                </tr>
                <tr>
                    <td>Версия (актуальная)</td>
                    <td id="kk_config_confinfo_confversion_act"></td>
                </tr>
                <tr>
                    <td>Версия (на контроллере)</td>
                    <td id="kk_config_confinfo_confversion_kkc"></td>
                </tr>
                <tr>
                    <td>Версия контроллера</td>
                    <td id="kk_config_confinfo_kkversion"></td>
                </tr>
                <tr>
                    <td>Версия ОС и Java</td>
                    <td id="kk_config_confinfo_osandjava"></td>
                </tr>
                <tr>
                    <td>Статус конфигурации</td>
                    <td id="kk_config_confinfo_kkstate"></td>
                </tr>
                <tr>
                    <td>Состояние авто</td>
                    <td id="kk_config_confinfo_carstate"></td>

                </tr>
                <tr>
                    <td>Контрольное напряжение</td>
                    <td id="kk_config_confinfo_carvoltage"></td>

                </tr>
                <tr>
                    <td>Отметка актуальности</td>
                    <td id="kk_config_confinfo_timestamp"></td>
                </tr>
            </table>
        </div>
        <div id="kk_config_actions">
             <table>
                 <tr>
                     <th>
                         Комманды контроллеру
                     </th>
                 </tr>
                <tr>
                    <td>Перезагрузка</td>
                    <td><button>Выполнить</button></td>
                </tr>
                 <tr>
                    <td>Полное отключание</td>
                     <td><button>Выполнить</button></td>
                </tr>
                <tr>
                    <td>Обновление бинарных компонентов</td>
                    <td><button>Выполнить</button></td>
                </tr>
               <tr>
                    <td>Сброс к базовой конфигурации</td>
                    <td><button>Выполнить</button></td>
                </tr>
            </table>
        </div>
        <div id="kk_config_editor">
        </div>
        </table>
    </div>

</div>