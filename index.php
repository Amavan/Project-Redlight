<?php

require('global.php');

$page_title = getTranslation('symptom-finder-title');
$page_id = "symptom-finder";
$sidebar_file = "introduction.php";

require('header.php');

$result = sql("SELECT * FROM  `Hierarchy`");
$hierarchy = array();
while($row = mysql_fetch_assoc($result)) {
  array_push($hierarchy, $row);
}

$adult_male = array();
$adult_female = array();
$child_male = array();
$child_female = array();

foreach($hierarchy as $row) {

  if($row['Gender'] == 'MALE' || $row['Gender'] == 'BOTH') {
    if($row['Age'] == 'ADULT' || $row['Age'] == 'BOTH') {
      array_push($adult_male, $row);
    }
    if($row['Age'] == 'CHILD' || $row['Age'] == 'BOTH') {
      array_push($child_male, $row);
    }
  }
  
  if($row['Gender'] == 'FEMALE' || $row['Gender'] == 'BOTH') {
    if($row['Age'] == 'ADULT' || $row['Age'] == 'BOTH') {
      array_push($adult_female, $row);
    }
    if($row['Age'] == 'CHILD' || $row['Age'] == 'BOTH') {
      array_push($child_female, $row);
    }
  }
  
}


$result = sql("SELECT * FROM  `Region_Translations` WHERE LangID = getLangID('$lang_code');");
$regions = array();
while($row = mysql_fetch_assoc($result)) {
  $id = $row['RegionID'];
  $name = $row['Name'];
  $regions[$id] = $name;
}

$result = sql("SELECT * FROM  `Category_Translations` WHERE LangID = getLangID('$lang_code');");
$categories = array();
while($row = mysql_fetch_assoc($result)) {
  $id = $row['CategoryID'];
  $name = $row['Name'];
  $categories[$id] = $name;
}

$result = sql("SELECT * FROM  `Hierarchy_Translation` WHERE LangID = getLangID('$lang_code');");
$hierarchies = array();
while($row = mysql_fetch_assoc($result)) {
  $id = $row['HierarchyID'];
  $name = $row['Title'];
  $hierarchies[$id] = $name;
}

$result = sql("SELECT * FROM  `Category_List`");
$category_list = array();
while($row = mysql_fetch_assoc($result)) {
  $id = $row['CategoryID'];
  $name = $row['WorkingName'];
  $category_list[$id] = $name;
}


?>

<div class="symptom-finder">

  <div class="symptom-finder-results">
    <h1 class="results-heading"></h1>
    <div class="results-list">  
    </div>
  </div>

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
    	<p class="back back-btn"><a href="javascript:void(0)">◀</a></p>
    </div>
  
    <div class="body">
      <img class="male adult" src="images/male.png">
      <img class="female adult" src="images/female.png">
      <img class="male child" src="images/male.png">
      <img class="female child" src="images/female.png">
    	<div class="dot-container">
    	</div>
    </div>
  
  </div>

</div>

<script>
  var adult_male = <?php echo json_encode($adult_male); ?>;
  var adult_female = <?php echo json_encode($adult_female); ?>;
  var child_male = <?php echo json_encode($child_male); ?>;
  var child_female = <?php echo json_encode($child_female); ?>;
  var hierarchies = <?php echo json_encode($hierarchies); ?>;
  var categories = <?php echo json_encode($categories); ?>;
  var regions = <?php echo json_encode($regions); ?>;
  var category_list = <?php echo json_encode($category_list); ?>;
  new redlight.SymptomFinder(regions, categories, hierarchies, category_list, child_female, child_male, adult_female, adult_male);
</script>

<?php require('footer.php'); ?>