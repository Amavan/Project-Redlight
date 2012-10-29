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
	global $sqlConnection;
	$domain = "";
	$username = "";
	$password = "";
	$db = "";

	try {
	    include "sql.php";
	}
	catch (Exception $e) {
	    echo 'The SQL connection settings file does not exist.';
	}
	
	$sqlConnection = mysql_connect($domain, $username, $password);
	if (!$sqlConnection) {
	    die('Could not connect: ' . mysql_error());
	}
	mysql_select_db($db, $sqlConnection);
}

//Basic SQL call with error handling
function sql($query) {
	$result = mysql_query($query);
	if (!$result) {
	    $message  = 'Invalid query: ' . mysql_error() . "\n";
	    $message .= 'Whole query: ' . $query;
	    die($message);
	}
	return $result;
}

?>