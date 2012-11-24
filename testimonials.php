<?php 
require('global.php');

$thumbsUp = $_GET['thumbsUp'];
$thumbsDown = $_GET['thumbsDown'];

$view = $_GET['view'];
$page = intval($_GET['page']);

if ($thumbsUp) {
	sql("call thumbsUpTestimonial($thumbsUp);");
}
else if ($thumbsDown) {
	sql("call thumbsDownTestimonial($thumbsDown);");
}

if ($thumbsUp || $thumbsDown) {
	header('Location: testimonials.php?view=' . $view . '&page=' . $page);
}

$page_title = getTranslation('testimonials-title');
$page_id = "testimonials";
$sidebar_file = "testimonials-sidebar.php";

require('header.php');


?>

<h1>Testimonials <span class="testimonial-sort"><a <?php if($view == 'popular' || !$view) { echo 'class="selected"'; } ?> href="?view=popular">Most popular</a> <a <?php if($view == 'recent') { echo 'class="selected"'; } ?> href="?view=recent">Most recent</a></span></h1>

<?php 
if($_GET['view'] == 'recent') {
	$procedure = "getTestimonialsByDate";
}
else {
	$procedure = "getTestimonialsByRating";
}

$result = sql("SELECT COUNT(*) as count FROM Testimonials WHERE LangID = getLangID('$lang_code');");
$row = mysql_fetch_array($result, MYSQL_ASSOC);


// Page count stuff
$itemsPerPage = 5;
$maxItems = $row['count'];
$itemStart = $page * $itemsPerPage;
$pageNavHTML = "";

if($page > 0) {
	$prevPage = $page - 1;
	$pageNavHTML .= "<a class=\"pagination-prev\" href=\"?view=$view&page=$prevPage\">◀</a>";
}

if(($page * $itemsPerPage + $itemsPerPage)  < $maxItems) {
	$nextPage = $page + 1;
	$pageNavHTML .= "<a class=\"pagination-next\" href=\"?view=$view&page=$nextPage\">▶</a>";
}

$visualCurrentPage = $page + 1;
$visualEndPage = ceil($maxItems / $itemsPerPage);

if($visualEndPage==0) {
    $pageNavHTML .= "<p class=\"pagination-text\">No testimonials found that match the current criteria.";
}
else {
  $pageNavHTML .= "<p class=\"pagination-text\">" . $visualCurrentPage . " of " . $visualEndPage;
}

$result = sql("call $procedure('$lang_code', $itemStart, $itemsPerPage);");

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
			<?php if($row["TipNo"]) { 
				$linkTip = $row["TipNo"];
				?>
				<p><a href="<?php echo 'tip.php?id=' . $linkTip . '">Tip ' . $linkTip . '</a></p>'; ?>
			<?php } ?>
		</div>
		<div class="story">
			<p><?php echo $row["Testimonial"]; ?></p>
		</div>
		<div class="clear rating">
			<p>
				<a href="<?php echo '?view=' . $view . '&page=' . $page . '&thumbsUp=' . $row["ID"]; ?>" class="up">
					<img src="images/thumbs-up.png">
				</a>
				<?php echo $row["ThumbsUp"]; ?> &nbsp; &nbsp; 
				<a href="<?php echo '?view=' . $view . '&page=' . $page . '&thumbsDown=' . $row["ID"]; ?>" class="down">
					<img src="images/thumbs-down.png">
				</a>
				<?php echo $row["ThumbsDown"]; ?></p>
		</div>
	</div>
<?php 
}

echo $pageNavHTML;

require('footer.php');
?>