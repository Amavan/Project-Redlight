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
	//SQL here
	header("Location: testimonials.php");
}

?>

<div class="submit-story">

<h1>Submit Story</h1>

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
		  <p><span>Tip</span><input type="text" name="tip" spellcheck="false" autocomplete="off" value="<?php echo $_POST['tip']; ?>">
          <p><span>Message*</span><textarea rows="5" name="message" id="message-input"><?php echo $_POST['message']; ?></textarea>
	
          <p><button type="submit" name="submit" value="submit" id="submit-btn" >Submit</button>
        </fieldset>
		<p class="required">*Required</p>
	</form>	

</div>

<?php require('footer.php'); ?>