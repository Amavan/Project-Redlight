<?php 

require('global.php');

$page_title = getTranslation('testimonials-title');

$tipID = mysql_real_escape_string($_GET['id']);

if($tipID) {

  $result = sql("SELECT * FROM  `Tip_List` WHERE TipID = $tipID");
  
  $row = mysql_fetch_assoc($result);
  
  if($row) {
    $youtubeID = $row['YoutubeID'];
  }
  
  
  
  $result = sql("SELECT * FROM  `Tip_Translations` WHERE TipID = $tipID AND LangID = getLangID('$lang_code');");
  $row1 = mysql_fetch_assoc($result);
  if($row1) {
    $title = $row1['Title'];
    $shortDesc = $row1['ShortDesc'];
    $longDesc = $row1['LongDesc'];
  }
  
  if($row == null || $row1 == null) {
    $tipID = null;
  }

}

$sidebar_file = "tip-sidebar.php";

require('header.php');

if($tipID) {


?>

<div class="tip">

<h1><?php echoTranslation('tip-format', array($tipID)); ?></h1>

<h2><?php echo $shortDesc; ?></h2>

<?php 
if($youtubeID && $youtubeID != '') { ?>
<div class="video">
<iframe width="300" height="169" src="http://www.youtube.com/embed/<?php echo $youtubeID; ?>" frameborder="0" allowfullscreen></iframe>
</div>
<?php } ?>

<?php echo $longDesc; ?>

</div>


<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "ur-c6467fcd-9e5e-bd6c-543a-6a5be6937e1"});</script>


<?php

}

else {

?>

<h1><?php echoTranslation("tip-not-found"); ?></h1>

<p><?php echoTranslation("tip-not-found-desc"); ?>

<?php

}

require('footer.php');

?>