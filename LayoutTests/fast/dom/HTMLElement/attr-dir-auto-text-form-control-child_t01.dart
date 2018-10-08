/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that directionality of an element with dir=auto set is 
 * not determined by the value of its child text form control.
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
    .testElement {-webkit-border-start: 5px solid green; -webkit-border-end: 5px solid red; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="parentDiv">
    Test that the direction of the div is left-to-right, ignoring its child that is a text form control.
    <div id="left-to-right" dir="auto" class="testElement">
    <input type="text" value="מקור השם עברית">Test test test
    </div>
    Test that the direction of the div is right-to-left, ignoring its child that is a text form control.
    <div id="right-to-left1" dir="auto" class="testElement">
    <input type="text" value="Test test test">מקור השם עברית
    </div>
    <div id="right-to-left2" dir="auto" class="testElement">
    <textarea>Test test test</textarea>מקור השם עברית
    </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var el = document.getElementById("left-to-right");
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(255, 0, 0)');
  el = document.getElementById("right-to-left1");
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(0, 128, 0)');
  el = document.getElementById("right-to-left2");
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(0, 128, 0)');
  document.getElementById("parentDiv").style.display = "none";
}
