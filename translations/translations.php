<?php

$lang_code = 'en_us';

require('translations/en.php');

$langs = array(
  'en_us' => $en
);

$string;
setupLang();

function setupLang() {

  global $lang_code, $langs, $string;
  
  if(!$lang_code) {
    $lang_code = 'en';
  }
  
  $string = $langs[$lang_code];

}

function translate($id, $array) {
  global $string;
  $result = $string[$id];
  if($array != null) {
    $replace = array();
    for($i = 0; $i < count($array); $i++) {
      $replace[$i] = "<<$i>>";
    }
    $result = str_replace($replace, $array, $result);
  }
  //return "X";
  return $result;
}

function echoTranslation($id, $array) {
  echo translate($id, $array);
}


function getTranslation($id, $array) {
  return translate($id, $array);
}



?>