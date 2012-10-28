<?php
error_reporting(E_ERROR | E_WARNING | E_PARSE);

require('translations/translations.php');

function selectionHandler($id) {
  global $page_id;
  if($id == $page_id) {
    echo " class=\"selected\" ";
  }
}

?>