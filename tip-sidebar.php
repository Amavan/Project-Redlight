<?php 

if($tipID) {

?>

<h1><?php echoTranslation('tools'); ?></h1>

<p><?php echoTranslation("tools-story-promo"); ?><br><a href="submit-story.php?tip=<?php echo $_GET['id']; ?>"><?php echoTranslation( "tools-story-promo-link"); ?></a></p>


<div class="tip">
	<div class="social">
		<span class='st_facebook_hcount' displayText='Facebook'></span>
		<span class='st_twitter_hcount' displayText='Tweet'></span>
		<span class='st_plusone_hcount' displayText='Google +1'></span>
		<span class='st_linkedin_hcount' displayText='LinkedIn'></span>
	</div>
</div>


<?php 
$result = sql("call getTestimonialsByRating('$lang_code', 0, 1);");
$row = mysql_fetch_assoc($result);

if($row) {

  $text = $row['Testimonial'];
  $name = $row['Name'];

?>

<h1><?php echoTranslation('featured-story'); ?></h1>

<p><?php echo $text . " - " . $name; ?></p>

<p><a href="testimonials.php?tip=<?php echo $_GET['id']; ?>"><?php echoTranslation('featured-story-link'); ?></a></p>


<?php

}

} 

?>