/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test for Bug: 105836 - computed value of float on positioned
 * elements.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
      #static { position: static; float: right; }
      #absolute { position: absolute; float: right; }
      #fixed { position: fixed; float: right; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="static"></div>
      <div id="absolute"></div>
      <div id="fixed"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.getElementById("static")).float, "right");
  shouldBe(getComputedStyle(document.getElementById("absolute")).float, "none");
  shouldBe(getComputedStyle(document.getElementById("fixed")).float, "none");
}
