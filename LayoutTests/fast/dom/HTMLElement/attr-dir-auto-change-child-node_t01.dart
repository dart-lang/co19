/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test that directionality is re-evaluated when an element with
 * dir=auto set, has it's first child modified.
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

    <div id="test" dir="auto" class="testDiv"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var el = document.getElementById("test");
  var child = document.createElement("div");
  child.innerHtml="test";
  el.append(child);
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(255, 0, 0)');

  var child2 = document.createElement("div");
  child2.innerHtml="מקור השם עברית";
  el.insertBefore(child2, child);
  shouldBe(el.getComputedStyle().getPropertyValue('border-right-color'),
      'rgb(0, 128, 0)');
  el.style.display = "none";
}
