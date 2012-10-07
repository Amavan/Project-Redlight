<?

require('translations/translations.php');

function selectionHandler($id) {
  global $page_id;
  if($id == $page_id) {
    echo " class=\"selected\" ";
  }
}

?>