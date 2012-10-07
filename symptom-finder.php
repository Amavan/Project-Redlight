<div class="symptom-finder">

<div class="toggles">
  
  <h1><? getTranslation('symptom-finder'); ?></h1>
  
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


<div class="symptom-finder-canvas start">
  
  <div class="body">
    <img class="male adult" src="images/male.png">
    <img class="female adult" src="images/female.png">
    <img class="male child" src="images/male.png">
    <img class="female child" src="images/female.png">
    <div class="dot">
      <a class="body-link" href="javascript:void(0);">
        <div class="label">Belly, Stomach Area or Abdomen</div>
      </a>
    </div>
  </div>

</div>

<div class="symptom-finder-results hidden">
  <h1>Belly, Stomach Area or Abdomen</h1>
  

</div>

</div>

<script src="closure/goog/base.js"></script>
<script src="js/symptom-finder.js"></script>

<script>
  new redlight.SymptomFinder();
</script>