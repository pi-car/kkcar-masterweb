<html>
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <title>KKCoche Webservice</title>
        <link rel="stylesheet" type="text/css" href="/css/style.css" />
        <script src="/js/jquery.js" type="text/javascript"></script>
        <script src="/js/kk.confinfo.js" type="text/javascript"></script>
        <script type="text/javascript">
            $(document).ready(function () {
                UpdateRightBarConfigInfo();
            })</script>
    </head>
    <body>
        <div id="wrapper">
            <div id="header">
                <div id="logo">
                    <a href="/"><span class="kkletters">KK</span>Coche</a>
                </div>
                <div id="menu">
                    <ul>
                        <li class="first active"><a href="/">Главная</a></li>
                        <li><a href="/diagnostic">Диагностика</a></li>
                        <li><a href="/portfolio">Карта</a></li>
                        <li><a href="/mplayer">Медиаплеер</a></li>
                        <li class="last"><a href="/configuration">Конфигурация</a></li>
                    </ul>
                    <br class="clearfix" />
                </div>
            </div>
            <div id="page">
                <div id="sidebar">
                    <div class="side-box">
                        <h3>Основное меню</h3>
                        <ul class="list">
                            <li class="first "><a href="/">Главная</a></li>
                        </ul>
                    </div>
                </div>
                <div id="sidebar_right">
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
                    <div id="kk_kkcmd_commandslist">
                        <h4>Команды контроллеру</h3>
                            <select multiple id="kk_kkcmd_commandslist_list"></select>
                            <button onclick="RequestActiveCommands()">Обновить</button>
                    </div>
                </div>
                <div id="content">
                    <div class="box">
                        <?php include 'application/views/' . $content_view; ?>

                    </div>
                </div>

            </div>
        </div>
        <div id="footer">
            <a href="/">Garikk Development</a> &copy; 2015</a>
    </div>
</body>
</html>