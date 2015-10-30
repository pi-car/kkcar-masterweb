<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of kk_constants
 *
 * @author blinov_is
 */

        const ACT_CTRLR_GET_MYCONF_INFO = 1;           //get ctrlr configuration, ID, stamp
        const ACT_CTRLR_GET_MYCONF_DATA = 2;           //get ctrlr configuration
        const ACT_CTRLR_GET_PLUGIN_INFO = 5;          //get plugins id, version and config stamp
        const ACT_CTRLR_GET_PLUGIN_DATA = 6;          //get extended plugins info (with file names)
        const ACT_CTRLR_GET_FILES_INFO_BIN = 10;          //get bin files info
        const ACT_CTRLR_GET_FILES_INFO_EXTCONF = 11;        //get conf files info
        const ACT_CTRLR_DATA_KKPIN = 50;               //KKSystem PIN
        //EXTConnector
        const ACT_CTRLR_EXTCONN_GETPINDATA = 80;          
        const ACT_CTRLR_EXTCONN_PUTPINDATA = 81;          


        const PARAM_CTRLR_POST_REQUEST_ACT = "action";
        const PARAM_CTRLR_POST_REQUEST_MYUUID = "myid";
        const PARAM_CTRLR_POST_REQUEST_CONFUUID = "confuid";
        const PARAM_CTRLR_POST_REQUEST_REQFILESBIN = "reqfilesbin";
        const PARAM_CTRLR_POST_REQUEST_OBJ = "json_object";
        //EXTConnector


