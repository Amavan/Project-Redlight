<?

$lang_code = 'en';

require('translations/en.php');

$langs = array(
  'en' => $en
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

function getTranslation($id) {
  global $string;

  echo $string[$id];
}



?>