<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
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
    
        <a href="index.php"><h1 class="logo"><?php echoTranslation('site-name-html'); ?></h1></a>
        
        <div class="right">
          <a href="search.php" <?php selectionHandler('search'); ?>><span><?php echoTranslation('search-title'); ?></span></a>
        </div>
        <div class="right">
          <a href="testimonials.php" <?php selectionHandler('testimonials'); ?>><span><?php echoTranslation('testimonials-title'); ?></span></a>
        </div>
        <div>
          <a href="index.php" <?php selectionHandler('symptom-finder'); ?>><span><?php echoTranslation('symptom-finder-title'); ?></span></a>
        </div>
        <div id="rl-browse-btn">
          <a href="#"><span><?php echoTranslation('browse-by-section'); ?></span></a>
          <div>
            <ul>
              <li><span>1</span> Body Part-Specific Health Problems
              <li><span>2</span> General Symptoms & Signs
              <li><span>3</span> Pregnancy & Post-Pregnancy
              <li><span>4</span> Pediatrics
              <li><span>5</span> Prevention of Errors in Hospital
            </ul>
          </div>



        </div>

    </div>
    
        
        <div class="red-light-sidebar">    
          <h1>Introduction</h1>
          <p>People do not always know when it is urgent for them to see a doctor or to get a child, friend, or loved one to the doctor. They don't know whether to go to the emergency room or to make an appointment with their primary care doctor or a specialist. <a href="#">Read more</a></p>
        </div>

    <div class="red-light-page">