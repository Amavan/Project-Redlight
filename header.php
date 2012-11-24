<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-16">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>
      <?php  
        
        if($page_title) {
          echo $page_title . ' - ';
        }
        
        echoTranslation('site-name');
        
      ?>
    </title>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700,300,400italic&amp;v2' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Arvo:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href="css/default.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/body.ico">
    <script src="//closure-library.googlecode.com/svn/trunk/closure/goog/base.js"></script>
    <script src="js/global.php"></script>
  </head>
  <body>
    
    <div class="red-light-nav">
    
      <a class="logo" href="index.php"><?php echoTranslation('site-name-html'); ?></a>

      <div>
        <a href="index.php" <?php selectionHandler('symptom-finder'); ?>><span><?php echoTranslation('symptom-finder-title'); ?></span></a>
      </div>
      <div id="rl-browse-btn">
        <a href="#" <?php selectionHandler('browse'); ?>><span><?php echoTranslation('browse-by-section'); ?></span></a>
        <div>
          <ul>
            <li><a href="browse.php?toc=1"><span>1</span> Body Part-Specific Health Problems</a>
            <li><a href="browse.php?toc=2"><span>2</span> General Symptoms & Signs</a>
            <li><a href="browse.php?toc=3"><span>3</span> Pregnancy & Post-Pregnancy</a>
            <li><a href="browse.php?toc=4"><span>4</span> Pediatrics</a>
            <li><a href="browse.php?toc=5"><span>5</span> Prevention of Errors in Hospital</a>
          </ul>
        </div>
      </div>
      <div>
    		  <a href="testimonials.php" <?php selectionHandler('testimonials'); ?>><span><?php echoTranslation('testimonials-title'); ?></span></a>
      </div>
    </div>

    	<div class="red-light-page">
	
	
			<div class="red-light-sidebar">
		  		<?php	if($sidebar_file) { include($sidebar_file); } ?>
			</div>
			
			<div class="red-light-page-inner">