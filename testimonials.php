<?php 
require('global.php');

$thumbsUp = $_GET['thumbsUp'];
$thumbsDown = $_GET['thumbsDown'];

if ($thumbsUp) {
	sql("call thumbsUpTestimonial($thumbsUp);");
}
else if ($thumbsDown) {
	sql("call thumbsDownTestimonial($thumbsDown);");
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

$result = sql("call $procedure('$lang_code');");

while ($row = mysql_fetch_array($result, MYSQL_ASSOC)) {
?>
	<div class="testimonial">
		<div class="details">
			<p class="name"><?php echo $row["Name"]; ?></p>
			<p><?php 			
			$db = $row["Timestamp"];
			$timestamp = strtotime($db);
			echo date("F d, Y", $timestamp); ?></p>
			<p><?php echo $row["Location"]; ?></p>
			<?php if($row["TipNo"]) { ?>
				<p><a href="tip.php?tip=<?php echo $row["TipNo"]; ?>">Tip <?php echo $row["TipNo"]; ?></a></p>
			<?php } ?>
		</div>
		<div class="story">
			<p><?php echo $row["Testimonial"]; ?></p>
		</div>
		<div class="clear rating">
			<p>
				<a href="?thumbsUp=<?php echo $row["ID"]; ?>" class="up">
					<img src="images/thumbs-up.png">
				</a>
				<?php echo $row["ThumbsUp"]; ?> &nbsp; &nbsp; 
				<a href="?thumbsDown=<?php echo $row["ID"]; ?>" class="down">
					<img src="images/thumbs-down.png">
				</a>
				<?php echo $row["ThumbsDown"]; ?></p>
		</div>
	</div>
<?php 
}

require('footer.php');
?>