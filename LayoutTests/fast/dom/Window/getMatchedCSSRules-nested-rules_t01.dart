/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test getMatchedCssRules to output deeply nested CssRules.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
    <style>
        @import url($root/resources/matched-rules-import-stylesheet.css);
        @supports (display: block) {
            @media (min-width: 1px) {
                div {
                    color: blue;
                }
            }
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p>Test getMatchedCssRules to output deeply nested CssRules.</p>
    <div>All this text should be blue.</div>
    <span class="test-element">This span should have border.</span>
    ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    var expectedResult1 = "div { color: blue; }";
    shouldBeEqualToString(
        window.getMatchedCssRules(document.querySelector('div'), '')[0].cssText,
        expectedResult1);

    var expectedResult2 = ".test-element { border: 2px solid black; }";
    shouldBeEqualToString(
        window.getMatchedCssRules(document.querySelector('.test-element'), '')[0].cssText,
        expectedResult2);
    asyncEnd();
  });
}

