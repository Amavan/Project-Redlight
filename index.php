<?php

require('global.php');

$page_title = getTranslation('symptom-finder-title');
$page_id = "symptom-finder";
$sidebar_file = "introduction.php";

require('header.php');

?>

<div class="symptom-finder">

<div class="toggles">
  <div class="toggles-container">
	  <h1><?php echoTranslation('symptom-finder-title'); ?></h1>
  
	  <div class="toggle-container"><span>1</span>
	    <div class="toggle">
	      <ul>
	        <li><a class="adult-btn" href="javascript:void(0)">Adult</a>
	        <li><a class="child-btn" href="javascript:void(0)">Child</a>
	      </ul>
	    </div>
	  </div>
	  <div class="toggle-container"><span>2</span>
	    <div class="toggle">
	      <ul>
	        <li><a class="male-btn" href="javascript:void(0)">Male</a>
	        <li><a class="female-btn" href="javascript:void(0)">Female</a>
	      </ul>
	    </div>
	  </div>
	  <div class="toggle-container"><span>3</span>
	    <div class="toggle stacked">
	      <ul>
	        <li><a class="body-btn" href="javascript:void(0)">Body Part-specific Symptoms</a>
	        <li><a class="list-btn" href="javascript:void(0)">General Symptoms & Signs</a>
	      </ul>
	    </div>
	  </div>
  </div>
</div>


<div class="symptom-finder-canvas start">
  
  <div class="message">
	<p><span class="step-num">4</span> Select a body region:</p>
	<p class="back back-btn"><a href="#">◀</a></p>
  </div>

  <div class="body">
    <img class="male adult" src="images/male.png">
    <img class="female adult" src="images/female.png">
    <img class="male child" src="images/male.png">
    <img class="female child" src="images/female.png">
	<div class="dot-container">
	    <div class="dot head">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Head</span></div>
	      </a>
	    </div>
	    <div class="dot eyes">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Eyes</span></div>
	      </a>
	    </div>
	    <div class="dot ear-nose-mouth-throat-neck">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Ear, Nose, Mouth, Throat & Neck</span></div>
	      </a>
	    </div>
	    <div class="dot arms-hands">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Arms & Hands</span></div>
	      </a>
	    </div>
	    <div class="dot breast">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Breast</span></div>
	      </a>
	    </div>
	    <div class="dot chest-area">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Chest Area</span></div>
	      </a>
	    </div>
	    <div class="dot belly">
	      <a class="body-link" href="javascript:void(0);">
	        <div class="label"><span>Belly, Stomach Area & Abdomen</span></div>
	      </a>
	    </div>
	    <div class="dot genitalia">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Genitalia</span></div>
	      </a>
	    </div>
	    <div class="dot bowel-movement">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Bowel Movement</span></div>
	      </a>
	    </div>
	    <div class="dot urine">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Urine</span></div>
	      </a>
	    </div>
	    <div class="dot menstruation-menopause-pms">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Menstruation (Peroids), Menopause & PMS</span></div>
	      </a>
	    </div>
	    <div class="dot groin">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Groin</span></div>
	      </a>
	    </div>
	    <div class="dot hips-buttocks-legs-ankles">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Hips, Buttocks, Legs & Ankles</span></div>
	      </a>
	    </div>
	    <div class="dot skin">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Skin</span></div>
	      </a>
	    </div>
	    <div class="dot back">
	      <a href="javascript:void(0);">
	        <div class="label"><span>Back</span></div>
	      </a>
	    </div>
	</div>
  </div>

</div>

<div class="symptom-finder-results hidden">
  <h1>Belly, Stomach Area & Abdomen</h1>
  <ul>
	<li><a class="result-link" href="javascript:void(0);">Appetite</a>
		<ul class="sub-result hidden">
			<li><a href="tip.php?id=152">Loss of Appetite</a></li>
			<li><a href="tip.php?id=153">Increased Appetite, Thirst, Urination, Weight Loss</a></li>
		</ul>
	</li>
	<li><a href="#">Bowel Movement</a></li>
	<li><a href="#">Indigestion and Heartburn</a></li>
	<li><a href="#">Upset Stomach</a></li>
	<li><a href="#">Belly Pain</a></li>
	<li><a href="#">Upper-Right Belly Pain</a></li>
	<li><a href="#">Upper-Left Belly Pain</a></li>
	<li><a href="#">Lower Belly Pain</a></li>
	<li><a href="#">Bulges and Swelling in the Belly</a></li>
	<li><a href="#">Sense of Fullness</a></li>
	<li><a href="#">Nausea</a></li>
	<li><a href="#">Vomiting</a></li>
 </ul>

</div>

</div>

<script>
  new redlight.SymptomFinder();
</script>

<?php require('footer.php'); ?>