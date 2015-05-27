/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description getMatchedCssRules with invalid Psuedo Elements
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../../Utils/async_utils.dart";
import "../../../testcommon.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
    <style>
        p { color: green; }
        div:first-letter { color: red; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=83298">https://bugs.webkit.org/show_bug.cgi?id=83298</a></p>
    <div>First letter of this sentence should be red.</div>
    ''', treeSanitizer: new NullTreeSanitizer());

  var expectedResult1 = "p { color: green; }";
  shouldBeEqualToString(
      window.getMatchedCssRules(document.querySelector('p'), '')[0].cssText,
      expectedResult1);
  shouldBeEqualToString(
      window.getMatchedCssRules(document.querySelector('p'), null)[0].cssText,
      expectedResult1);

  shouldBe(
      window.getMatchedCssRules(document.querySelector('p'), 'before'),
      null);
  shouldBe(window.getMatchedCssRules(document.querySelector('p'), 'foo'),
      null);

  var expectedResult2 = "div::first-letter { color: red; }";
  shouldBeEqualToString(
      window.getMatchedCssRules(document.querySelector('div'), 'first-letter')[0].cssText,
      expectedResult2);
  shouldBeEqualToString(
      window.getMatchedCssRules(document.querySelector('div'), ':first-letter')[0].cssText,
      expectedResult2);
  shouldBeEqualToString(
      window.getMatchedCssRules(document.querySelector('div'), '::first-letter')[0].cssText,
      expectedResult2);

  var div = document.body.querySelector('div');
  //shouldBe(div.getComputedStyle('::first-letter').getPropertyValue('color'),
  //    'rgb(255, 0, 0)');
}

