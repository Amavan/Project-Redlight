<?php

//Global initializations
error_reporting(E_ERROR | E_WARNING | E_PARSE);
require('translations/translations.php');
sqlConnect();

//Adds selected class if passed id matches page id
function selectionHandler($id) {
  global $page_id;
  if($id == $page_id) {
    echo " class=\"selected\" ";
  }
}

//Global SQL connection statement
function sqlConnect() {
	$domain = "";
	$username = "";
	$password = "";

	try {
	    include "sql.php";
	}
	catch (Exception $e) {
	    echo 'The SQL connection settings file does not exist.';
	}
	
	$link = mysql_connect($domain, $username, $password);
	if (!$link) {
	    die('Could not connect: ' . mysql_error());
	}
	mysql_select_db('willifor_redlight');
}

?>