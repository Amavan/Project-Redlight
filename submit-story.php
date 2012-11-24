<?php 

require('global.php');

$page_title = getTranslation('testimonials-title');
$page_id = "testimonials";
$sidebar_file = "";

checkForm();

require('header.php');

function checkForm() {
	global $errorMessage;
	if ((!$_POST['name'] || !$_POST['message']) && $_POST['submit']!="" ) {
		$errorMessage = "Please complete all required fields.";
	}
	else if ($_POST['submit']) {
		submitForm();
	}
}

function submitForm() {
	global $lang_code;
	$name = mysql_real_escape_string($_POST['name']);
	$message = mysql_real_escape_string($_POST['message']);
	$email = mysql_real_escape_string($_POST['email']);
	$location = mysql_real_escape_string($_POST['location']);
	$tip = intval(mysql_real_escape_string($_POST['tip']));
	//TODO: check if Tip is valid entry
	$result = sql("call insertTestimonial('$lang_code', '$name', '$message', '$email', $tip, '$location');");
	header("Location: testimonials.php");
}

if($_POST['tip']) {
	$tip = $_POST['tip'];
}
else if ($_GET['tip']) {
	$tip = $_GET['tip'];
}
?>

<div class="submit-story">

	<h1>Share your story</h1>

<?php
	if ($errorMessage) { 
		echo '<p class="error">' . $errorMessage . '</p>';
	}
?>

	<form action="submit-story.php" method="post">
        <fieldset>
          <p><span>Name*</span><input type="text" name="name" spellcheck="false" autocomplete="off" value="<?php echo $_POST['name']; ?>">
          <p><span>Email</span><input type="email" name="email" spellcheck="false" autocomplete="off" value="<?php echo $_POST['email']; ?>">
	      <p><span>City, State</span><input type="text" name="location" spellcheck="false" autocomplete="off" value="<?php echo $_POST['location']; ?>">
		  <p><span>Tip</span><input type="text" name="tip" spellcheck="false" autocomplete="off" value="<?php echo $tip; ?>">
          <p><span>Message*</span><textarea rows="5" name="message" id="message-input"><?php echo $_POST['message']; ?></textarea>
	
          <p><button type="submit" name="submit" value="submit" id="submit-btn" >Submit</button>
        </fieldset>
		<p class="required">*Required</p>
	</form>	

</div>

<?php require('footer.php'); ?>