/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that directionality of a text form control with dir=auto
 * set is determined by the value of that form control.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
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
    Test that the direction of english text is left-to-right in the text form control.
    <input type="text" id="left-to-right" dir="auto" class="testElement" value="Test test test">
    Test that the direction of hebrew text is right-to-left in the text form control.
    <input type="text" id="right-to-left1" dir="auto" class="testElement" value="מקור השם עברית">
    <textarea id="right-to-left2" dir="auto" class="testElement">מקור השם עברית</textarea>
    Test that the direction of hebrew text is right-to-left in the text form control, even if inserted dynamically.
    <textarea id="right-to-left3" dir="auto" class="testElement"></textarea>
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
  el = document.getElementById("right-to-left3");
  el.text = "מקור השם עברית";
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(0, 128, 0)');

  document.getElementById("parentDiv").style.display = "none";
}
