<?php 

require('global.php');

$thumbsUp = $_GET['thumbsUp'];
if ($thumbsUp) {
	$result = mysql_query("call thumbsUpTestimonial($thumbsUp);");
	if (!$result) {
	    $message  = 'Invalid query: ' . mysql_error() . "\n";
	    $message .= 'Whole query: ' . $query;
	    die($message);
	}
}

$thumbsDown = $_GET['thumbsDown'];
if ($thumbsDown) {
	$result = mysql_query("call thumbsDownTestimonial($thumbsDown);");
	if (!$result) {
	    $message  = 'Invalid query: ' . mysql_error() . "\n";
	    $message .= 'Whole query: ' . $query;
	    die($message);
	}
}

if ($thumbsUp || $thumbsDown) {
	header("Location: testimonials.php");
}

$page_title = getTranslation('testimonials-title');
$page_id = "testimonials";
$sidebar_file = "testimonials-sidebar.php";

require('header.php');

?>


<h1>Testimonials <span class="testimonial-sort"><a <?php if($_GET['view'] == 'popular' || !$_GET['view']) { echo 'class="selected"'; } ?> href="?view=popular">Most popular</a> <a <?php if($_GET['view'] == 'recent') { echo 'class="selected"'; } ?> href="?view=recent">Most recent</a></span></h1>

<?php 

if($_GET['view'] == 'recent') {
	$procedure = "getTestimonialsByDate";
}
else {
	$procedure = "getTestimonialsByRating";
}

$result = mysql_query("call $procedure('$lang_code');");
if (!$result) {
    $message  = 'Invalid query: ' . mysql_error() . "\n";
    $message .= 'Whole query: ' . $query;
    die($message);
}
else {
	
	while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
?>

<div class="testimonial">
	<div class="details">
		<p class="name"><?php echo $row["Name"]; ?></p>
		<p><?php echo $row["Location"]; ?></p>
		<p><?php echo $row["Timestamp"]; ?></p>
	</div>
	<div class="story">
		<p><?php echo $row["Testimonial"]; ?></p>
	</div>
	<div class="clear rating">
		<p>
			<a href="?thumbsUp=<?php echo $row["ID"]; ?>" class="up">
				<img src="images/thumbs-up.png">
			</a>
			<?php echo $row["ThumbsUp"]; ?> &nbsp; 
			<a href="?thumbsDown=<?php echo $row["ID"]; ?>" class="down">
				<img src="images/thumbs-down.png">
			</a>
			<?php echo $row["ThumbsDown"]; ?></p>
	</div>
</div>


<?php 
	} 
} ?>
		

<?php require('footer.php'); ?>