<? require('global.php'); ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>
      <? getTranslation('site-name'); ?>
    </title>
    <link href='//fonts.googleapis.com/css?family=Open+Sans:400italic,400,600,700,300,400italic&amp;v2' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Arvo:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href="css/default.css" rel="stylesheet">
    <link rel="shortcut icon" href="images/body.ico">
  </head>
  <body>
    
    <div class="red-light-nav">
    
        <h1 class="logo"><? getTranslation('site-name-html'); ?></h1>
        
        <div class="right">
          <a href="#"><span>Search</span></a>
        </div>
        <div class="right">
          <a href="#"><span>Testimonials</span></a>
        </div>
        <div>
          <a href="#" class="selected"><span>Symptom Finder</span></a>
        </div>
        <div id="rl-browse-btn">
          <a href="#"><span>Browse by Section</span></a>
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

    <? include "symptom-finder.php"; ?>

    </div>

  </body>
</html>