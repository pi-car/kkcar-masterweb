-- MySQL dump 10.13  Distrib 5.7.9, for Win32 (AMD64)
--
-- Host: localhost    Database: kkcar
-- ------------------------------------------------------
-- Server version	5.7.9-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` longtext,
  `login` longtext,
  `pass` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'ea8eaad7-317d-4735-b076-842dc9b0c75e\r\n','garikk','b40fd97e4e19cfa2d7996e82a0b62c8c31d89507');
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confeditor_blockview`
--

DROP TABLE IF EXISTS `confeditor_blockview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confeditor_blockview` (
  `id` int(11) NOT NULL,
  `configuration` int(11) DEFAULT NULL,
  `plugin` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confeditor_blockview`
--

LOCK TABLES `confeditor_blockview` WRITE;
/*!40000 ALTER TABLE `confeditor_blockview` DISABLE KEYS */;
/*!40000 ALTER TABLE `confeditor_blockview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_types`
--

DROP TABLE IF EXISTS `config_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_types`
--

LOCK TABLES `config_types` WRITE;
/*!40000 ALTER TABLE `config_types` DISABLE KEYS */;
INSERT INTO `config_types` VALUES (1,'MainConfiguration'),(2,'PluginConfiguration');
/*!40000 ALTER TABLE `config_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configurations`
--

DROP TABLE IF EXISTS `configurations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configurations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` longtext,
  `name` longtext,
  `description` longtext,
  `configuration` longtext,
  `stamp` longtext,
  `configurationtype` int(11) DEFAULT NULL,
  `ownerconf` int(11) DEFAULT NULL,
  `kkcar` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKI_kkcar` (`kkcar`),
  KEY `configurations_configurationtype_fkey` (`configurationtype`),
  CONSTRAINT `FK_kkcar` FOREIGN KEY (`kkcar`) REFERENCES `kkcar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `configurations_configurationtype_fkey` FOREIGN KEY (`configurationtype`) REFERENCES `config_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configurations`
--

LOCK TABLES `configurations` WRITE;
/*!40000 ALTER TABLE `configurations` DISABLE KEYS */;
INSERT INTO `configurations` VALUES (1,'c44bcdfc-d72b-4db7-ab99-37916cc55bd1','Garikk\'s car configuration','','{\"ConfigurationUID\":\"c44bcdfc-d72b-4db7-ab99-37916cc55bd1\",\"ConfigurationStamp\":\"201f7df6-bedc-4942-b295-bd98249e5514\",\"Features\":[{\"FeatureName\":\"ODB Diag Displ\",\"FeatureUUID\":\"c01287e6-3e5c-48bb-9eae-680a20210531\",\"IsSystemFeature\":false,\"Connections\":[{\"ConnectionName\":\"ODB to Data Display processor\",\"SourcePluginName\":\"KKODB2Reader\",\"TargetPluginName\":\"KKDataDisplay\",\"SourcePluginUID\":\"44b5dab1-f596-458a-b09b-d9565b91464e\",\"TargetPluginUID\":\"b5b50412-c02a-4674-a112-ddc5805ea4e5\",\"PinName\":[\"PIN_KK_ODB2_DATA\"],\"Enabled\":false},{\"ConnectionName\":\"Data Display processor to ODB\",\"SourcePluginName\":\"KKDataDisplay\",\"TargetPluginName\":\"KKODB2Reader\",\"SourcePluginUID\":\"b5b50412-c02a-4674-a112-ddc5805ea4e5\",\"TargetPluginUID\":\"44b5dab1-f596-458a-b09b-d9565b91464e\",\"PinName\":[\"PIN_KK_ODB2_COMMAND\"],\"Enabled\":false},{\"ConnectionName\":\"Data Display processor to LED\",\"SourcePluginName\":\"KKDataDisplay\",\"TargetPluginName\":\"KKLEDDisplay\",\"SourcePluginUID\":\"b5b50412-c02a-4674-a112-ddc5805ea4e5\",\"TargetPluginUID\":\"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf\",\"PinName\":[\"PIN_KK_LED_COMMAND\",\"PIN_KK_LED_DATA\"],\"Enabled\":false},{\"ConnectionName\":\"LED to DataProcessor\",\"SourcePluginName\":\"KKLEDDisplay\",\"TargetPluginName\":\"KKDataDisplay\",\"SourcePluginUID\":\"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf\",\"TargetPluginUID\":\"b5b50412-c02a-4674-a112-ddc5805ea4e5\",\"PinName\":[\"PIN_KK_LED_DATA\"],\"Enabled\":false},{\"ConnectionName\":\"Controls to DataProcessor\",\"SourcePluginName\":\"KKControls\",\"TargetPluginName\":\"KKDataDisplay\",\"SourcePluginUID\":\"62d1026f-5297-4951-890d-61d75ae67d02\",\"TargetPluginUID\":\"b5b50412-c02a-4674-a112-ddc5805ea4e5\",\"PinName\":[\"PIN_KK_CTRL_DATA\"],\"Enabled\":false}],\"MinVersion\":0},{\"FeatureName\":\"Version info\",\"FeatureUUID\":\"00000000-0000-0000-0000-100000000002\",\"IsSystemFeature\":true,\"MinVersion\":0},{\"FeatureName\":\"Settings\",\"FeatureUUID\":\"00000000-0000-0000-0000-100000000001\",\"IsSystemFeature\":true,\"MinVersion\":0}],\"SystemDisplay_UID\":\"7fbac0f7-6939-4380-bcb0-0ef8b1580fbf\",\"SystemHID_UID\":\"62d1026f-5297-4951-890d-61d75ae67d02\",\"SystemMenuItems\":[{\"DisplayName\":\"Settings\",\"ItemCommand\":\"KK_SUBMENU\",\"SubItems\":[{\"DisplayName\":\"Test Prm11\",\"ItemCommand\":\"\"},{\"DisplayName\":\"Test Prm12\",\"ItemCommand\":\"\"},{\"DisplayName\":\"Test Prm13\",\"ItemCommand\":\"\"},{\"DisplayName\":\"test submenu\",\"ItemCommand\":\"KK_SUBMENU\",\"SubItems\":[{\"DisplayName\":\"Test Prm21\",\"ItemCommand\":\"\"},{\"DisplayName\":\"Test Prm22\",\"ItemCommand\":\"\"}]}]},{\"DisplayName\":\"Board tools\",\"ItemCommand\":\"KK_SUBMENU\",\"SubItems\":[{\"DisplayName\":\"System Info\",\"ItemCommand\":\"KKSYSCMD TOOLS BOARDINFO\"},{\"DisplayName\":\"Reboot\",\"ItemCommand\":\"KKSYSCMD TOOLS REBOOT\"},{\"DisplayName\":\"Power Off\",\"ItemCommand\":\"KKSYSCMD TOOLS POWEROFF\"}]},{\"DisplayName\":\"KK Info\",\"ItemCommand\":\"KK_SUBMENU\",\"SubItems\":[{\"DisplayName\":\"Plugins\",\"ItemCommand\":\"KKSYSCMD INFO PLUGINS\"},{\"DisplayName\":\"Version\",\"ItemCommand\":\"KKSYSCMD INFO VERSION\"}]}]}','201f7df6-bedc-4942-b295-bd98249e5514',1,1,1),(2,'62d1026f-5297-4951-890d-61d75ae67d02','KKControlsConf','Controls plugin configuration','{\"Adapters\":[{\"Name\":\"Raspberry\",\"ID\":\"KK_RPI_Adapter\",\"Type\":\"RaspberryPI_B\"},{\"Name\":\"Debug\",\"ID\":\"DBG_Adapter\",\"Type\":\"Debug\"}],\"Controls\":[{\"Name\":\"SelectUP\",\"ID\":\"BTN_UP\",\"AdapterID\":\"DBG_Adapter\",\"AdapterSource\":\"3\",\"Global\":false,\"FixedFeature\":false},{\"Name\":\"SelectDown\",\"ID\":\"BTN_DOWN\",\"AdapterID\":\"DBG_Adapter\",\"AdapterSource\":\"12\",\"Global\":false,\"FixedFeature\":false},{\"Name\":\"Enter\",\"ID\":\"BTN_ENTER\",\"AdapterID\":\"DBG_Adapter\",\"AdapterSource\":\"13\",\"Global\":false,\"FixedFeature\":false},{\"Name\":\"Back\",\"ID\":\"BTN_BACK\",\"AdapterID\":\"DBG_Adapter\",\"AdapterSource\":\"14\",\"Global\":true,\"FixedFeature\":false}]}','21e0c350-515f-4207-8ab6-372b6d901020',2,1,1),(3,'b5b50412-c02a-4674-a112-ddc5805ea4e5','KKDataDisplayConf','DataDisplayConf','{\"FeatureID\":\"c01287e6-3e5c-48bb-9eae-680a20210531\",\"Processors\":[{\"ProcessorName\":\"ODB_MAIN\",\"ProcessorType\":\"PROC_BASIC_ODB2_DISPLAY\",\"Pages\":[{\"PageName\":\"MAIN\",\"PageCMD\":\"CHPROCESSOR CE_READER\",\"DiagPIDs\":[5,13]},{\"PageName\":\"DETAIL\",\"PageCMD\":\"CHPROCESSOR CE_READER\",\"DiagPIDs\":[5,66,13,12]}]},{\"ProcessorName\":\"CE_READER\",\"ProcessorType\":\"PROC_BASIC_ODB2_CEREADER\",\"Pages\":[{\"PageName\":\"CE_READER\",\"PageCMD\":\"CHPROCESSOR ODB_MAIN\"}]},{\"ProcessorName\":\"ERROR\",\"ProcessorType\":\"PROC_BASIC_ODB2_ERROR\",\"Pages\":[{\"PageName\":\"CE_READER\",\"PageCMD\":\"CHPROCESSOR ODB_MAIN\"}]},{\"ProcessorName\":\"WAIT\",\"ProcessorType\":\"PROC_BASIC_ODB2_WAIT\",\"Pages\":[{\"PageName\":\"WAIT\",\"PageCMD\":\"\"}]}]}','0abbdd8a-264e-4c1f-a6fa-0c7ec5d0a100',2,1,1),(4,'7fbac0f7-6939-4380-bcb0-0ef8b1580fbf','KKLCDDisplayConf','KKLCDDisplayConf','{\"ConfName\":\"Default config\",\"DisplayPages\":[{\"PageName\":\"MAIN\",\"HaveDynamicElements\":true,\"IsDefaultPage\":false,\"Features\":[\"c01287e6-3e5c-48bb-9eae-680a20210531\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_lcddisplay_uiframe_main_1.frame\",\"kk_lcddisplay_uiframe_main_2.frame\",\"kk_lcddisplay_uiframe_main_3.frame\",\"kk_lcddisplay_uiframe_main_4.frame\",\"kk_lcddisplay_uiframe_main_1.frame\",\"kk_lcddisplay_uiframe_main_5.frame\",\"kk_lcddisplay_uiframe_main_3.frame\",\"kk_lcddisplay_uiframe_main_4.frame\"]},{\"PageName\":\"DETAIL\",\"HaveDynamicElements\":false,\"IsDefaultPage\":false,\"Features\":[\"c01287e6-3e5c-48bb-9eae-680a20210531\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_lcddisplay_uiframe_detail_1.frame\"]},{\"PageName\":\"WAIT\",\"HaveDynamicElements\":false,\"IsDefaultPage\":true,\"Features\":[\"c01287e6-3e5c-48bb-9eae-680a20210531\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_lcddisplay_uiframe_wait_1.frame\"]},{\"PageName\":\"ERROR\",\"HaveDynamicElements\":false,\"IsDefaultPage\":false,\"Features\":[\"c01287e6-3e5c-48bb-9eae-680a20210531\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_lcddisplay_uiframe_error_1.frame\"]},{\"PageName\":\"SYSMENU_1\",\"HaveDynamicElements\":false,\"IsDefaultPage\":true,\"Features\":[\"00000000-0000-0000-0000-100000000000\",\"00000000-0000-0000-0000-200000000001\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_sysmenu_p1_uiframe_1.frame\"]},{\"PageName\":\"SYSMENU_VI\",\"HaveDynamicElements\":false,\"IsDefaultPage\":false,\"Features\":[\"00000000-0000-0000-0000-100000000000\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_sysmenu_vi_uiframe_1.frame\"]},{\"PageName\":\"CE_READER\",\"HaveDynamicElements\":false,\"IsDefaultPage\":false,\"Features\":[\"00000000-0000-0000-0000-100000000000\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_sysmenu_sett_uiframe_1.frame\"]},{\"PageName\":\"CE_READER\",\"HaveDynamicElements\":false,\"IsDefaultPage\":false,\"Features\":[\"c01287e6-3e5c-48bb-9eae-680a20210531\"],\"HWDisplays\":[\"DEBUG\"],\"UIFrameFiles\":[\"kk_ddisplay_cereader_uiframe_1.frame\"]}],\"HWDisplays\":[{\"HWDisplayName\":\"DEBUG\",\"HWBoard\":\"DisplayDebug\",\"HWDisplay\":\"HostDebug\"}],\"DefaultFeature\":\"00000000-0000-0000-0000-100000000000\"}','ec65f6ce-24c8-4c79-bca7-e6660f967576',2,1,1),(5,'b5b50412-c02a-4674-a112-ddc5805ea4e5','KKODB2ConnectorConf','KKODB2ConnectorConf','{\"ODBAdapter\":\"ODB2_Emulator\",\"RS232ConnectPort\":\"none\",\"RS232Speed\":0,\"RS232AutoFind\":false}','57e0cf11-e0b5-42fe-9ab9-f99c6208202d',2,1,1);
/*!40000 ALTER TABLE `configurations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extconnector`
--

DROP TABLE IF EXISTS `extconnector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extconnector` (
  `timestamp` int(11) DEFAULT NULL,
  `direction` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `pinid` longtext,
  `pinmessage` longtext,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kkcar_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKI_KKCarId` (`kkcar_id`),
  CONSTRAINT `FK_KKCarId` FOREIGN KEY (`kkcar_id`) REFERENCES `kkcar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extconnector`
--

LOCK TABLES `extconnector` WRITE;
/*!40000 ALTER TABLE `extconnector` DISABLE KEYS */;
INSERT INTO `extconnector` VALUES (5555,0,0,'PIN_KK_COMMAND','{}',1,1),(6666,1,0,'PIN_KK_COMMAND','{}',2,1);
/*!40000 ALTER TABLE `extconnector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_types`
--

DROP TABLE IF EXISTS `file_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_types`
--

LOCK TABLES `file_types` WRITE;
/*!40000 ALTER TABLE `file_types` DISABLE KEYS */;
INSERT INTO `file_types` VALUES (1,'JarFile'),(2,'ExternalConf');
/*!40000 ALTER TABLE `file_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` longtext,
  `owner_conf` int(11) DEFAULT NULL,
  `name` longtext,
  `version` int(11) DEFAULT NULL,
  `filetype` int(11) DEFAULT NULL,
  `owner_plugin` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fki_owconf` (`owner_conf`),
  KEY `fki_plugin` (`owner_plugin`),
  CONSTRAINT `files_owner_conf_fkey` FOREIGN KEY (`owner_conf`) REFERENCES `configurations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_plugin` FOREIGN KEY (`owner_plugin`) REFERENCES `plugins` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES (5,'http://localhost/rep/extconf/datadisplay/kk_display_cereader_uiframe_1.frame',4,'kk_display_cereader_uiframe_1.frame',1,2,NULL),(6,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_error_1.frame',4,'kk_lcddisplay_uiframe_error_1.frame',1,2,NULL),(7,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_detail_1.frame',4,'kk_lcddisplay_uiframe_detail_1.frame',1,2,NULL),(8,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_1.frame',4,'kk_lcddisplay_uiframe_main_1.frame',1,2,NULL),(9,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_2.frame',4,'kk_lcddisplay_uiframe_main_2.frame',1,2,NULL),(10,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_3.frame',4,'kk_lcddisplay_uiframe_main_3.frame',1,2,NULL),(11,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_4.frame',4,'kk_lcddisplay_uiframe_main_4.frame',1,2,NULL),(12,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_main_5.frame',4,'kk_lcddisplay_uiframe_main_5.frame',1,2,NULL),(13,'http://localhost/rep/extconf/datadisplay/kk_lcddisplay_uiframe_wait_1.frame',4,'kk_lcddisplay_uiframe_wait_1.frame',1,2,NULL),(14,'http://localhost/rep/extconf/datadisplay/kk_sysmenu_sett_uiframe_1.frame',4,'kk_sysmenu_sett_uiframe_1.frame',1,2,NULL),(15,'http://localhost/rep/extconf/datadisplay/kk_sysmenu_vi_uiframe_1.frame',4,'kk_sysmenu_vi_uiframe_1.frame',1,2,NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kkcar`
--

DROP TABLE IF EXISTS `kkcar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kkcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `owner` int(11) DEFAULT NULL,
  `vehicle` int(11) DEFAULT NULL,
  `uuid` longtext,
  `activeconfiguration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kkcar_ActiveConfiguration_fkey` (`activeconfiguration`),
  CONSTRAINT `kkcar_ActiveConfiguration_fkey` FOREIGN KEY (`activeconfiguration`) REFERENCES `configurations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kkcar`
--

LOCK TABLES `kkcar` WRITE;
/*!40000 ALTER TABLE `kkcar` DISABLE KEYS */;
INSERT INTO `kkcar` VALUES (1,'Garikk\'s Chrysler',1,1,'2e2efd7b-ab83-42fa-9c00-2e45bb4b3ba1',1);
/*!40000 ALTER TABLE `kkcar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kkcar_commands`
--

DROP TABLE IF EXISTS `kkcar_commands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kkcar_commands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kkcar` int(11) DEFAULT NULL,
  `description` longtext,
  `command` longtext,
  `status` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fki_kkcar_cmd` (`kkcar`),
  CONSTRAINT `fk_kkcar_cmd` FOREIGN KEY (`kkcar`) REFERENCES `kkcar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kkcar_commands`
--

LOCK TABLES `kkcar_commands` WRITE;
/*!40000 ALTER TABLE `kkcar_commands` DISABLE KEYS */;
INSERT INTO `kkcar_commands` VALUES (1,1,'test ommand23213','{}',1,12321313),(2,1,'update DTC','{}',1,1234324);
/*!40000 ALTER TABLE `kkcar_commands` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kkcar_confinfo`
--

DROP TABLE IF EXISTS `kkcar_confinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kkcar_confinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kkcar` int(11) DEFAULT NULL,
  `carinfo` longtext,
  `currentconfig` int(11) DEFAULT NULL,
  `configversion` longtext,
  `kkcontrollerversion` longtext,
  `osversion` longtext,
  `confstatus` longtext,
  `carstatus` longtext,
  `timestamp` int(11) DEFAULT NULL,
  `enginestatus` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fki_currconf` (`currentconfig`),
  KEY `fki_kkcar_confinfo` (`kkcar`),
  CONSTRAINT `fk_currconf` FOREIGN KEY (`currentconfig`) REFERENCES `kkcar_confinfo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_kkcar_confinfo` FOREIGN KEY (`kkcar`) REFERENCES `kkcar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kkcar_confinfo`
--

LOCK TABLES `kkcar_confinfo` WRITE;
/*!40000 ALTER TABLE `kkcar_confinfo` DISABLE KEYS */;
INSERT INTO `kkcar_confinfo` VALUES (1,1,'Chrysler Concorde 3.2',1,'test','---not active--','Raspberry','Ok','Sleep',1111111,0);
/*!40000 ALTER TABLE `kkcar_confinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kkcar_messages`
--

DROP TABLE IF EXISTS `kkcar_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kkcar_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kkcar` int(11) DEFAULT NULL,
  `message` longtext,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kkcar_messages_kkcar_fkey` (`kkcar`),
  CONSTRAINT `kkcar_messages_kkcar_fkey` FOREIGN KEY (`kkcar`) REFERENCES `kkcar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kkcar_messages`
--

LOCK TABLES `kkcar_messages` WRITE;
/*!40000 ALTER TABLE `kkcar_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `kkcar_messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveinfo`
--

DROP TABLE IF EXISTS `liveinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kkcar_id` int(11) DEFAULT NULL,
  `name` longtext,
  `param_id` int(11) DEFAULT NULL,
  `value` double DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `liveinfo_ODB_PID_fkey` (`param_id`),
  CONSTRAINT `liveinfo_ODB_PID_fkey` FOREIGN KEY (`param_id`) REFERENCES `odb_pids` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveinfo`
--

LOCK TABLES `liveinfo` WRITE;
/*!40000 ALTER TABLE `liveinfo` DISABLE KEYS */;
INSERT INTO `liveinfo` VALUES (1,1,NULL,1,92,NULL),(2,1,NULL,2,222,NULL),(3,1,NULL,3,0,NULL),(4,1,NULL,4,12.1,NULL);
/*!40000 ALTER TABLE `liveinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liveinfo_request`
--

DROP TABLE IF EXISTS `liveinfo_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `liveinfo_request` (
  `id` int(11) NOT NULL,
  `configuration_id` int(11) NOT NULL,
  `PID` int(11) DEFAULT NULL,
  `interval` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liveinfo_request`
--

LOCK TABLES `liveinfo_request` WRITE;
/*!40000 ALTER TABLE `liveinfo_request` DISABLE KEYS */;
INSERT INTO `liveinfo_request` VALUES (1,1,NULL,NULL);
/*!40000 ALTER TABLE `liveinfo_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacture`
--

DROP TABLE IF EXISTS `manufacture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacture`
--

LOCK TABLES `manufacture` WRITE;
/*!40000 ALTER TABLE `manufacture` DISABLE KEYS */;
INSERT INTO `manufacture` VALUES (0,'Generic ODB2'),(1,'Chrysler');
/*!40000 ALTER TABLE `manufacture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odb_dtc`
--

DROP TABLE IF EXISTS `odb_dtc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odb_dtc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacture` int(11) DEFAULT NULL,
  `dtc` int(11) DEFAULT NULL,
  `descriptionlocal` longtext,
  `descriptionodb` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odb_dtc`
--

LOCK TABLES `odb_dtc` WRITE;
/*!40000 ALTER TABLE `odb_dtc` DISABLE KEYS */;
INSERT INTO `odb_dtc` VALUES (1,0,0,'Fuel Volume Regulator Control Circuit/Open','Fuel Volume Regulator Control Circuit/Open'),(2,1,1684,'Batt disconnect','Battery Disconnected Within Last 50 Starts'),(3,1,1486,'Evap Leak Monitor Pinched Hose','Evap Leak Monitor Pinched Hose\r\n');
/*!40000 ALTER TABLE `odb_dtc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odb_pids`
--

DROP TABLE IF EXISTS `odb_pids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `odb_pids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `manufacture` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `descriptionlocal` longtext,
  `descriptionodb` longtext,
  `PID_MODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fki_manufacture` (`manufacture`),
  CONSTRAINT `fk_manufacture` FOREIGN KEY (`manufacture`) REFERENCES `manufacture` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odb_pids`
--

LOCK TABLES `odb_pids` WRITE;
/*!40000 ALTER TABLE `odb_pids` DISABLE KEYS */;
INSERT INTO `odb_pids` VALUES (1,0,5,'Engine coolant temperature','Engine coolant temperature',1),(2,0,12,'Engine RPM','Engine RPM',1),(3,0,13,'Vehicle speed','Vehicle speed',1),(4,0,66,'Control Module Voltage','Control Module Voltage',NULL);
/*!40000 ALTER TABLE `odb_pids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` longtext,
  `name` longtext,
  `description` longtext,
  `version` int(11) DEFAULT NULL,
  `pins_in` longtext,
  `pins_out` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plugins_uuid_key` (`uuid`(255))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
INSERT INTO `plugins` VALUES (1,'44b5dab1-f596-458a-b09b-d9565b91464e','KKODB2Reader','Basic ODB2 Reader',1,'{\r\n  \"pins\": [\r\n    \"PIN_KK_ODB2_COMMAND\"\r\n    ]\r\n }','{\r\n  \"pins\": [\r\n    \"KK_PLUGIN_BASE_ODB2_DATA\",\r\n   \"KK_PLUGIN_BASE_ODB2_RAW\"\r\n    ]\r\n }'),(2,'7fbac0f7-6939-4380-bcb0-0ef8b1580fbf','KKLEDDisplay','Basic LED Display',1,'{\r\n  \"pins\": [\r\n    \"PIN_KK_LED_COMMAND\",\r\n    \"PIN_KK_LED_DATA\",\r\n    \"PIN_KK_LED_RAW\"\r\n    ]\r\n }','{\r\n  \"pins\": [\r\n    \"PIN_KK_LED_DATA\"\r\n    ]\r\n }'),(3,'b5b50412-c02a-4674-a112-ddc5805ea4e5','KKDataDisplay','Simple ODB diag display processor',1,'{\r\n  \"pins\": [\r\n    \"PIN_KK_LED_DATA\",\"PIN_KK_ODB2_DATA\",\"PIN_KK_CTRL_DATA\"\r\n    ]}','{\r\n  \"pins\": [\r\n    \"PIN_KK_LED_COMMAND\",\r\n    \"PIN_KK_LED_DATA\"\r\n    ]}'),(4,'62d1026f-5297-4951-890d-61d75ae67d02','KKControls','hardware buttons plugin',1,NULL,'{\r\n  \"pins\": [\r\n    \"PIN_KK_CTRL_DATA\"\r\n    ]}'),(5,'10000000-0000-0000-0000-000000000000','KKController','KKController',1,NULL,NULL);
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_state`
--

DROP TABLE IF EXISTS `system_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_state` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext,
  `kkcontroller_version` longtext,
  `state` int(11) DEFAULT NULL,
  `base_version` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_state`
--

LOCK TABLES `system_state` WRITE;
/*!40000 ALTER TABLE `system_state` DISABLE KEYS */;
INSERT INTO `system_state` VALUES (1,'Testing','0.9',1,'0.9'),(2,'Production','1.0',0,'1.0');
/*!40000 ALTER TABLE `system_state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-04 19:05:07
