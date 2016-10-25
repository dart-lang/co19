/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var style = new Element.html('''
      <style>
      .x > .y { font-weight: bold; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This tests the behavior of child rules when tbody elements are created by the HTML parser.
      The implicitly-created tbody element should not be treated specially.
      In older versions of Safari it was.</p>
      <table class="x"><tr class="y"><td id="cell1">This text should not be bold.</td></tr></table>
      <table class="x"><tbody class="y"><tr><td id="cell2">This text should be bold.</td></tr></tbody></table>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBe(getComputedStyle(document.getElementById("cell1")).fontWeight, "normal");
  shouldBe(getComputedStyle(document.getElementById("cell2")).fontWeight, "bold");
}
