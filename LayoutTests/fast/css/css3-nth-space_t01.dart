/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This test passes if the nth-of-type(3n + 1) is parsed correctly,
 * regardless of the whitespaces.
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html('''
      <style>
      div.class { background-color: red; }
      div.class:nth-of-type(3n
       +   1) {background-color: green;}
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div tabindex=1" id="first" class="class"></div>
      <div tabindex=2" id="second" class="class"></div>
      <div tabindex=3" id="third" class="class"></div>
      <div tabindex=4" id="fourth" class="class"></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var el = document.getElementById("first");
  shouldBe(getComputedStyle(el).getPropertyValue('background-color'), 'rgb(0, 128, 0)');

  el = document.getElementById("second");
  shouldBe(getComputedStyle(el).getPropertyValue('background-color'), 'rgb(255, 0, 0)');

  el = document.getElementById("third");
  shouldBe(getComputedStyle(el).getPropertyValue('background-color'), 'rgb(255, 0, 0)');

  el = document.getElementById("fourth");
  shouldBe(getComputedStyle(el).getPropertyValue('background-color'), 'rgb(0, 128, 0)');
}
