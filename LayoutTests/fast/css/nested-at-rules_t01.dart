/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Test nested at-rules.
 */
import "dart:html";
import "../../testcommon.dart";
import "pwd.dart";

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html('''
      <style>
      .test {
          content: "UNTOUCHED";
      }

      @media all {
          @media all {
              @font-face {
                  src: local('Courier');
                  font-family: Courier;
              }

              @page :left { top: 0 }

              #t0 { content: "APPLIED" }

              @import url("$root/resources/import.css");
              @charset "UTF-8";
              @namespace "";
          }
          @media all {
              @media none {
                  #t1 { content: "APPLIED" }
              }
          }
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <span id=t0 class=test></span>
      <span id=t1 class=test></span>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  asyncStart();
  window.onLoad.listen((_) {
    CssStyleSheet ss = document.styleSheets[index];
    dynamic rules = ss.cssRules;
    shouldEvaluateTo(rules.length, 2);

    shouldBe(rules[0].type, CssRule.STYLE_RULE);
    shouldBe(rules[1].type, CssRule.MEDIA_RULE);
    shouldEvaluateTo(rules[1].cssRules.length, 2);
    shouldBe(rules[1].cssRules[0].type, CssRule.MEDIA_RULE);
    shouldEvaluateTo(rules[1].cssRules[0].cssRules.length, 3);
    shouldBe(rules[1].cssRules[0].cssRules[0].type, CssRule.FONT_FACE_RULE);
    shouldBe(rules[1].cssRules[0].cssRules[1].type, CssRule.PAGE_RULE);
    shouldBe(rules[1].cssRules[0].cssRules[2].type, CssRule.STYLE_RULE);
    shouldBe(rules[1].cssRules[0].cssRules[0].parentStyleSheet, document.styleSheets[index]);
    shouldBe(rules[1].cssRules[0].cssRules[1].parentStyleSheet, document.styleSheets[index]);
    shouldBe(rules[1].cssRules[0].cssRules[2].parentStyleSheet, document.styleSheets[index]);

    shouldBe(rules[1].cssRules[1].type, CssRule.MEDIA_RULE);
    shouldEvaluateTo(rules[1].cssRules[1].cssRules.length, 1);
    shouldBe(rules[1].cssRules[1].cssRules[0].type, CssRule.MEDIA_RULE);
    rules[1].cssRules[1].insertRule('@media all { @page :left { top: 0; } }', 1);
    shouldEvaluateTo(rules[1].cssRules[1].cssRules.length, 2);
    shouldBe(rules[1].cssRules[1].cssRules[1].type, CssRule.MEDIA_RULE);
    shouldBe(rules[1].cssRules[1].cssRules[1].cssRules[0].type, CssRule.PAGE_RULE);

    shouldBeLikeString(getComputedStyle(document.getElementById('t0')).content, "APPLIED");
    shouldBeLikeString(getComputedStyle(document.getElementById('t1')).content, "UNTOUCHED");

    asyncEnd();  
  });
}
