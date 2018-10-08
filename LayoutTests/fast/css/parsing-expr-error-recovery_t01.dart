/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests that CSS parser correctly recovers after {}, () and []
 * invalid blocks.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <div id="tests"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var BASE_EXPR = "1px,\"x\",var(y) /calc(1px + (((5px)))),-webkit-min(1px,2px)";
  var INVALID_BLOCKS = ["#", "{}", "()", "[]", "{(){{}{{}}[]}}", "(})", "(])", "[}]", "[)]", "{)}", "{]}", "#({})"];

  var tests = document.getElementById("tests");
  for (var i = 0; i <= BASE_EXPR.length; i++) {
    for (var j = 0; j < INVALID_BLOCKS.length; j++) {
      var invalidExpr = BASE_EXPR.substring(0, i) + INVALID_BLOCKS[j] + BASE_EXPR.substring(i);
      var test = document.createElement("DIV");
      test.text = "failed: " + invalidExpr;
      test.style.cssText = "color:" + invalidExpr + "; display: none;";
      tests.append(test);
    }
  }

  var failed = 0;
  for (var test = tests.firstChild; test != null; test = test.nextNode) {
    if (getComputedStyle(test).display != "none")
      failed++;
  }

  shouldBeTrue(failed==0);
}
