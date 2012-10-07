goog.require('goog.dom');
goog.require('goog.events');
goog.require('goog.events.EventType');
goog.require('goog.dom.classes');

goog.provide('redlight.SymptomFinder');


redlight.SymptomFinder = function() {

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
  
  this._canvas;
  this._body;
  this._label;

  this.init();

}

redlight.SymptomFinder.prototype.init = function() {

  this._adultBtn = goog.dom.getElementByClass('adult-btn');
  this._childBtn = goog.dom.getElementByClass('child-btn');
  this._maleBtn = goog.dom.getElementByClass('male-btn');
  this._femaleBtn = goog.dom.getElementByClass('female-btn');
  this._bodyBtn = goog.dom.getElementByClass('body-btn');
  this._listBtn = goog.dom.getElementByClass('list-btn');
  this._canvas = goog.dom.getElementByClass('symptom-finder-canvas');
  this._body = goog.dom.getElementByClass('body', this._canvas);
  this._label = goog.dom.getElementByClass('body-link', this._canvas);
  this._results = goog.dom.getElementByClass('symptom-finder-results');

  goog.events.listen(this._adultBtn, goog.events.EventType.CLICK, function() { this.setAdultBtnState(true); }, null, this);
  goog.events.listen(this._childBtn, goog.events.EventType.CLICK, function() { this.setAdultBtnState(false); }, null, this);
  goog.events.listen(this._maleBtn, goog.events.EventType.CLICK, function() { this.setMaleBtnState(true); }, null, this);
  goog.events.listen(this._femaleBtn, goog.events.EventType.CLICK, function() { this.setMaleBtnState(false); }, null, this);
  goog.events.listen(this._bodyBtn, goog.events.EventType.CLICK, function() { this.setBodyBtnState(true); }, null, this);
  goog.events.listen(this._listBtn, goog.events.EventType.CLICK, function() { this.setBodyBtnState(false); }, null, this);
  goog.events.listen(this._label, goog.events.EventType.CLICK, function() { this.bodyClick(); }, null, this);

}

redlight.SymptomFinder.prototype.setAdultBtnState = function(boolean) {
  goog.dom.classes.enable(this._adultBtn, 'selected', boolean);
  goog.dom.classes.enable(this._childBtn, 'selected', !boolean);
  this._adultBtnSelected = boolean;
  this.updateState();
}

redlight.SymptomFinder.prototype.setMaleBtnState = function(boolean) {
  goog.dom.classes.enable(this._maleBtn, 'selected', boolean);
  goog.dom.classes.enable(this._femaleBtn, 'selected', !boolean);
  this._maleBtnSelected = boolean;
  this.updateState();
}

redlight.SymptomFinder.prototype.setBodyBtnState = function(boolean) {
  goog.dom.classes.enable(this._bodyBtn, 'selected', boolean);
  goog.dom.classes.enable(this._listBtn, 'selected', !boolean);
  this._bodyBtnSelected = boolean;
  this.updateState();
}

redlight.SymptomFinder.prototype.updateState = function() {
  if(this._adultBtnSelected != null && this._maleBtnSelected != null && this._bodyBtnSelected != null) {
    goog.dom.classes.enable(this._canvas, 'start', false);

    goog.dom.classes.enable(this._body, 'male', this._maleBtnSelected);
    goog.dom.classes.enable(this._body, 'female', !this._maleBtnSelected);
    goog.dom.classes.enable(this._body, 'adult', this._adultBtnSelected);
    goog.dom.classes.enable(this._body, 'child', !this._adultBtnSelected);
  
  }
  else {
    goog.dom.classes.enable(this._canvas, 'start', true);
  } 
}

redlight.SymptomFinder.prototype.bodyClick = function() {
  goog.dom.classes.enable(this._canvas, 'shift', true);
  goog.dom.classes.enable(this._results, 'hidden', false);
}