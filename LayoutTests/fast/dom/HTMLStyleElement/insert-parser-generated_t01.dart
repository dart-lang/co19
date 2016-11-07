/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests that re-inserting a <style> element that was created by 
 * the parser applies its stylesheet.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.head.append(new DocumentFragment.html('''
    <style>
        div { width: 100px; height: 100px; background-color: red; }
    </style>
    <style id="style">
        div#green { background-color: green; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer()));
    
  document.body.setInnerHtml('''
    <div id="green"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  StyleElement style = document.getElementById("style");
  var head = style.parentNode;
  style.remove();
  head.append(style);

  var div = document.getElementById("green");
  shouldBe(div.getComputedStyle().getPropertyValue('background-color'),
      "rgb(0, 128, 0)");
}
