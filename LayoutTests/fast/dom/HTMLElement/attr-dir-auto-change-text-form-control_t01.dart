/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that directionality is re-evaluated when dir attribute changes.
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
    <input type="text" id="text1" dir="auto" class="testElement" value="מקור השם עברית">
    <textarea id="text2" dir="auto" class="testElement">מקור השם עברית</textarea>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var el = document.getElementById("text1");
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(0, 128, 0)');
  el.setAttribute("dir", "ltr");
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(255, 0, 0)');

  el = document.getElementById("text2");
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(0, 128, 0)');
  el.setAttribute("dir", "ltr");
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(255, 0, 0)');
  
  el = document.getElementById("parentDiv");
  el.style.display = "none";
}
