/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that directionality of an element with dir=auto set is 
 * re-evaluated when the first child text node of that element is added or 
 * removed. Also test that directionality does not change if the element does 
 * not have the attribute dir=auto.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var meta = new Element.html('''
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(meta);

  var style = new Element.html('''
    <style>
    .testDiv {-webkit-border-start: 5px solid green; -webkit-border-end: 5px solid red; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="parentDiv">
    <div id="parent1" dir="auto" class="testDiv">
    <div id="child1">מקור השם עברית</div>
    <div id="child2">Test</div>
    </div>
    <div id="parent2" dir="auto" class="testDiv">
    <div id="child3">Test</div>
    </div>
    <div id="parent3" class="testDiv">
    <div id="child4">מקור השם עברית</div>
    </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var parent1 = document.getElementById("parent1");
  var parent2 = document.getElementById("parent2");
  var parent3 = document.getElementById("parent3");

  var child1 = document.getElementById("child1");
  var child3 = document.getElementById("child3");
  var child4 = document.getElementById("child4");

  shouldBe(parent1.getComputedStyle().getPropertyValue('border-right-color'),
     'rgb(0, 128, 0)');
  shouldBe(parent2.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(255, 0, 0)');
  shouldBe(parent3.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(255, 0, 0)');

  child1.remove();
  shouldBe(parent1.getComputedStyle().getPropertyValue('border-right-color'),
     'rgb(255, 0, 0)');
  
  parent2.insertBefore(child1, child3);
  shouldBe(parent2.getComputedStyle().getPropertyValue('border-right-color'),
     'rgb(0, 128, 0)');

  child1.remove();
  shouldBe(parent2.getComputedStyle().getPropertyValue('border-right-color'),
     'rgb(255, 0, 0)');

  parent3.insertBefore(child1, child4);
  shouldBe(parent3.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(255, 0, 0)');

  document.getElementById("parentDiv").style.display = "none";
}
