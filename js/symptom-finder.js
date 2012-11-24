goog.require('goog.dom');
goog.require('goog.events');
goog.require('goog.events.EventType');
goog.require('goog.dom.classes');
goog.require('goog.net.cookies');
goog.provide('redlight.SymptomFinder');


redlight.SymptomFinder = function(regions, categories, hierarchies, category_list, child_female, child_male, adult_female, adult_male) {

  this._category_list = category_list;
  this._regions = regions;
  this._categories = categories;
  this._hierarchies = hierarchies;
  this._child_female = child_female;
  this._child_male = child_male;
  this._adult_female = adult_female;
  this._adult_male = adult_male;    

  // Adult-child toggle
  this._adultBtn;
  this._adultBtnSelected;
  this._childBtn;

  // Male-female toggle
  this._maleBtn;
  this._maletBtnSelected;
  this._femaleBtn;

  // Body-list toggle
  this._bodyBtn;
  this._bodyBtnSelected;
  this._listBtn;
  
  // Categories
  this._currentRegion;
  this._currentCategory;
  this._currentSubcategory;
  
  this._canvas;
  this._body;
  this._label;

  this.init();

}

redlight.SymptomFinder.prototype.init = function() {

  this._syptomFinder = goog.dom.getElementByClass('symptom-finder');
  this._adultBtn = goog.dom.getElementByClass('adult-btn', this._syptomFinder);
  this._childBtn = goog.dom.getElementByClass('child-btn', this._syptomFinder);
  this._maleBtn = goog.dom.getElementByClass('male-btn', this._syptomFinder);
  this._femaleBtn = goog.dom.getElementByClass('female-btn', this._syptomFinder);
  this._bodyBtn = goog.dom.getElementByClass('body-btn', this._syptomFinder);
  this._listBtn = goog.dom.getElementByClass('list-btn', this._syptomFinder);
  this._canvas = goog.dom.getElementByClass('symptom-finder-canvas');
  this._body = goog.dom.getElementByClass('body', this._canvas);
  this._results = goog.dom.getElementByClass('symptom-finder-results', this._syptomFinder);
  this._subResults = goog.dom.getElementByClass('sub-result', this._syptomFinder);
  this._backBtn = goog.dom.getElementByClass('back-btn', this._syptomFinder);
  this._dotContainerEl = goog.dom.getElementByClass('dot-container', this._syptomFinder);
  this._resultsHeadingEl = goog.dom.getElementByClass('results-heading', this._syptomFinder);
  this._resultsListEl = goog.dom.getElementByClass('results-list', this._syptomFinder);

  goog.events.listen(this._adultBtn, goog.events.EventType.CLICK, function() { this.setAdultBtnState(true); }, null, this);
  goog.events.listen(this._childBtn, goog.events.EventType.CLICK, function() { this.setAdultBtnState(false); }, null, this);
  goog.events.listen(this._maleBtn, goog.events.EventType.CLICK, function() { this.setMaleBtnState(true); }, null, this);
  goog.events.listen(this._femaleBtn, goog.events.EventType.CLICK, function() { this.setMaleBtnState(false); }, null, this);
  goog.events.listen(this._bodyBtn, goog.events.EventType.CLICK, function() { this.setBodyBtnState(true); }, null, this);
  goog.events.listen(this._listBtn, goog.events.EventType.CLICK, function() { this.setBodyBtnState(false); }, null, this);
  goog.events.listen(this._backBtn, goog.events.EventType.CLICK, function() { this.backClick(); }, null, this);

  this.getCookies();  
  this.setAdultBtnState();
  this.setMaleBtnState();
  this.setBodyBtnState();
  this.setRegion();
  this.setCategory();
  
  goog.dom.classes.add(this._syptomFinder, 'visible');
}

redlight.SymptomFinder.prototype.getCookies = function(boolean) {
  this.getCookie('adultBtnSelected');
  this.getCookie('maleBtnSelected');
  this.getCookie('bodyBtnSelected');
  this.getCookie('currentRegion');
  this.getCookie('currentCategory');
  this.getCookie('currentSubcategory');
}

redlight.SymptomFinder.prototype.getCookie = function(name) {
    if(goog.net.cookies.containsKey(name)) {
    this['_' + name] = Number(goog.net.cookies.get(name));
  }
}

redlight.SymptomFinder.prototype.setAdultBtnState = function(boolean) {
  if(boolean != null) {
    this._adultBtnSelected = boolean;
  }
  if(this._adultBtnSelected != null) {
    goog.dom.classes.enable(this._adultBtn, 'selected', this._adultBtnSelected);
    goog.dom.classes.enable(this._childBtn, 'selected', !this._adultBtnSelected);
    goog.net.cookies.set('adultBtnSelected',Number(this._adultBtnSelected));
    this.updateState();
  }
}

redlight.SymptomFinder.prototype.setMaleBtnState = function(boolean) {
  if(boolean != null) {
    this._maleBtnSelected = boolean;
  }
  if(this._maleBtnSelected != null) {
    goog.dom.classes.enable(this._maleBtn, 'selected', this._maleBtnSelected);
    goog.dom.classes.enable(this._femaleBtn, 'selected', !this._maleBtnSelected);
    goog.net.cookies.set('maleBtnSelected', Number(this._maleBtnSelected));
    this.updateState();
  }
}

redlight.SymptomFinder.prototype.setBodyBtnState = function(boolean) {
  if(boolean != null) {
    this._bodyBtnSelected = boolean;
    if(boolean == true) {
      this._currentRegion = null;
      goog.net.cookies.remove('currentRegion');
    }
  }
  if(this._bodyBtnSelected != null) {
    goog.dom.classes.enable(this._bodyBtn, 'selected', this._bodyBtnSelected);
    goog.dom.classes.enable(this._listBtn, 'selected', !this._bodyBtnSelected);
    goog.net.cookies.set('bodyBtnSelected',Number(this._bodyBtnSelected));
    if(!this._bodyBtnSelected) {
      this._currentRegion = -1;
      goog.net.cookies.set('currentRegion', -1);
    }
    this.updateState();
  }
}

redlight.SymptomFinder.prototype.updateState = function() {
  if(this._adultBtnSelected != null && this._maleBtnSelected != null && this._bodyBtnSelected != null) {
    // Body canvas
    if(this._bodyBtnSelected) {
      goog.dom.classes.enable(this._canvas, 'hidden', false);
      goog.dom.classes.enable(this._canvas, 'start', false);
      goog.dom.classes.enable(this._body, 'male', this._maleBtnSelected);
      goog.dom.classes.enable(this._body, 'female', !this._maleBtnSelected);
      goog.dom.classes.enable(this._body, 'adult', this._adultBtnSelected);
      goog.dom.classes.enable(this._body, 'child', !this._adultBtnSelected);
      this.setBodyDots();
    }  
    // Symptom list
    else {
      this.setRegion();
    }
  }
  else {
    goog.dom.classes.enable(this._canvas, 'start', true);
  } 
}

redlight.SymptomFinder.prototype.backClick = function() {
  goog.dom.classes.enable(this._canvas, 'annimate', true);
  goog.dom.classes.enable(this._canvas, 'shift', false);
  goog.net.cookies.remove('currentRegion');
  goog.net.cookies.remove('currentCategory');
  goog.net.cookies.remove('currentSubcategory');
  this._currentRegion = null;
  this._currentCategory = -1;
  this._currentSubcategory = -1;
}

redlight.SymptomFinder.prototype.getCurrentHierarchy = function() {
  var current;
  if(this._maleBtnSelected && this._adultBtnSelected) {
    current = this._adult_male;
  }
  else if(!this._maleBtnSelected && this._adultBtnSelected) {
    current = this._adult_female;
  }
  else if(this._maleBtnSelected && !this._adultBtnSelected) {
    current = this._child_female;
  }
  else if(!this._maleBtnSelected && !this._adultBtnSelected) {
    current = this._child_male;
  }
  return current;
}

redlight.SymptomFinder.prototype.setBodyDots = function() {

  var current = this.getCurrentHierarchy();
  
  if(current) {
    var html = "";
    var last = -1;
    for(item in current) {
      item = current[item];
      var regionID = item.RegionID;
      if(regionID == last) {
        continue;
      }
      var regionLabel = this._regions[regionID];
      var regionName = this._category_list[regionID];
      html += '<a red-light-region="' + regionID + '" class="dot ' + regionName + '" href="javascript:void(0);"><div class="label"><span>' + regionLabel + '</span></div></a>';
      last = regionID;
    }
    this._dotContainerEl.innerHTML = html;
  }

  var dotEls = goog.dom.getElementsByTagNameAndClass('a', null, this._dotContainerEl);
  for(var i = 0; i < dotEls.length; i++) {
    goog.events.listen(dotEls[i], goog.events.EventType.CLICK, this.setRegion, null, this);
  }

}

redlight.SymptomFinder.prototype.setRegion = function(event) {
  if(this._adultBtnSelected == null || this._maleBtnSelected ==null) {
    return;
  }
  if(event != null) {
    var regionID = event.currentTarget.getAttribute('red-light-region');
    this._currentRegion = regionID;
    goog.net.cookies.set('currentRegion', regionID);
  }
  else if(this._currentRegion != null) {
    regionID = this._currentRegion;
  }
  else {
    return;
  }

  var regionLabel = this._regions[regionID];
  this._resultsHeadingEl.innerHTML = regionLabel;
  var html = "<ul>";
  var current = this.getCurrentHierarchy();
  var lastCategory = -1;
  var lastSubcategory = -1;
  var level = 0;
  if(current) {
    for(item in current) {
      item = current[item];
      if(item.RegionID == regionID) {
        // Display a new category heading
        if(lastCategory != item.CategoryID) {
          //End previous category and subcategory if needed
          while(level > 0) {
            html += "</ul>";
            level--;
          }
          if(item.CategoryID != -1) {
            level = 1;
            var categoryLabel = this._categories[item.CategoryID];
            html += '<li><a red-light-results-category="' + item.CategoryID + '" href="javascript:void(0);">' + categoryLabel + '</a><ul>';
          }
        }
        // Display a new subcategory heading
        if(lastSubcategory != item.SubcategoryID) {
          if(item.SubcategoryID != -1) {
            if(level == 2) {
              html += "</ul>";
              level--;
            }
            level = 2;
            var subcategoryLabel = this._categories[item.SubcategoryID];
            html += '<li><a red-light-results-sub-category="' + item.SubcategoryID + '" href="javascript:void(0);">' + subcategoryLabel + '</a><ul>';
          }
        }
        var label = "Tip " + item.TipID;
        if(this._hierarchies[item.HierarchyID]) {
          label = this._hierarchies[item.HierarchyID];
        }
        html += '<li><a class="tip-link" href="tip.php?id=' + item.TipID + '">' + label + '</a>';
        lastCategory = item.CategoryID;
        lastSubcategory = item.SubcategoryID;
      }
    }

  }

  while(level > 0) {
    html += "</ul>";
    level--;
  }

  html += "</ul>";
  
  this._resultsListEl.innerHTML = html;

  var resultsEls = goog.dom.getElementsByTagNameAndClass('a', null, this._resultsListEl);
  for(var i = 0; i < resultsEls.length; i++) {
    goog.events.listen(resultsEls[i], goog.events.EventType.CLICK, this.setCategory, null, this);
  }

  if(regionID != -1 ) {
    if(event) {
      goog.dom.classes.enable(this._canvas, 'annimate', true);
    }
    goog.dom.classes.enable(this._canvas, 'shift', true);
  }
  else {
    this._resultsHeadingEl.innerHTML = this._listBtn.innerHTML;
    goog.dom.classes.enable(this._canvas, 'hidden', true);
  }
}

redlight.SymptomFinder.prototype.resultClick = function() {
  goog.dom.classes.enable(this._subResults, 'hidden', !goog.dom.classes.has(this._subResults, 'hidden'));
}

redlight.SymptomFinder.prototype.setCategory = function(event) {
  if(event) {  
    var currentTarget = event.currentTarget;
    var hasResultCategoryAtr = currentTarget.hasAttribute('red-light-results-category');
    var hasResultSubcategoryAtr = currentTarget.hasAttribute('red-light-results-sub-category');
    
    //Add selection to newly selected category
    if(hasResultCategoryAtr || hasResultSubcategoryAtr) {
      var parentEl = goog.dom.getParentElement(currentTarget);
      goog.dom.classes.toggle(parentEl, 'selected');
    }
  
    //Update category and subcategory variables
    var newResultCategory = Number(currentTarget.getAttribute('red-light-results-category'));
    var newResultSubcategorty = Number(currentTarget.getAttribute('red-light-results-sub-category'));
    if(hasResultCategoryAtr) {
      if(this._currentCategory == newResultCategory) {
        this._currentCategory = -1;
      }
      else {
        this._currentCategory = newResultCategory;
      }
      this._currentSubcategory = -1;
    }
    else if(hasResultSubcategoryAtr) {
      if(this._currentSubcategory == newResultSubcategorty) {
        this._currentSubcategory = -1;
      }
      else {
        this._currentSubcategory = newResultSubcategorty;    
      }
    }
  }
  else if(this._currentCategory) {
    var resultLinkEls = goog.dom.getElementsByTagNameAndClass('a', null, this._resultsListEl);
    for(var i = 0; i < resultLinkEls.length; i++) {
      var resultLinkEl = resultLinkEls[i];
      if((resultLinkEl.hasAttribute('red-light-results-category') && Number(resultLinkEl.getAttribute('red-light-results-category')) == this._currentCategory) ||
      (resultLinkEl.hasAttribute('red-light-results-sub-category') && Number(resultLinkEl.getAttribute('red-light-results-sub-category')) == this._currentSubcategory)) {
        var parentEl = goog.dom.getParentElement(resultLinkEl);
        goog.dom.classes.add(parentEl, 'selected');
      } 
    }
  }
  else {
    return;
  }  
  
  //Remove selected class from old categories
  var selectedResultEls = goog.dom.getElementsByClass('selected', this._resultsListEl);
  for(var i = 0; i < selectedResultEls.length; i++) {
    var childEl = goog.dom.getElementsByTagNameAndClass('a', null, selectedResultEls[i])[0];
    if(childEl.hasAttribute('red-light-results-category') && Number(childEl.getAttribute('red-light-results-category')) != this._currentCategory) {
      goog.dom.classes.remove(selectedResultEls[i], 'selected');
    }
    if(childEl.hasAttribute('red-light-results-sub-category') && Number(childEl.getAttribute('red-light-results-sub-category')) != this._currentSubcategory) {
      goog.dom.classes.remove(selectedResultEls[i], 'selected');
    }   
  }
  
  goog.net.cookies.set('currentCategory', this._currentCategory);
  goog.net.cookies.set('currentSubcategory', this._currentSubcategory);  
}
