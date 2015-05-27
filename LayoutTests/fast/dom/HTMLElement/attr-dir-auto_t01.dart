/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that directionality of an element with dir=auto set is 
 * determined by the first child text node of that element.
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
    .testDiv {-webkit-border-start: 5px solid green; -webkit-border-end: 5px solid red; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p id="description"></p>
    <div id="console"></div>
    <div id="result"></div>
    <div id="parentDiv">
    Test that the direction of english text is left-to-right.
    <div id="left-to-right" dir="auto" class="testDiv">Test test test</div>
    Test that the direction of hebrew text is right-to-left.
    <div id="right-to-left1" dir="auto" class="testDiv">מקור השם עברית</div>
    Test that '?' does not affect the directionality.
    <div id="right-to-left2" dir="auto" class="testDiv"><span>??</span>מקור השם עברית<span>??</span></div>
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
