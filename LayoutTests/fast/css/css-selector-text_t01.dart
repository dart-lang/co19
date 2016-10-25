/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests parsing and re-serialization of some CSS selectors.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.head.id = "head";

  parseThenSerializeRule(rule) {
    dynamic styleElement = document.getElementById("style");
    var head = document.getElementById("head");
    if (styleElement != null)
      styleElement.remove();

    styleElement = document.createElement("style");
    styleElement.id = "style";
    head = document.getElementById("head");
    head.append(styleElement);

    styleElement.append(new Text(rule));
    return styleElement.sheet.cssRules[0].cssText;
  }

  testSelectorRoundTrip(selector) {
    shouldBeLikeString(parseThenSerializeRule("$selector {}"), "$selector {}");
  }

  testSelectorRoundTrip('*');
  testSelectorRoundTrip('a');
  testSelectorRoundTrip('#a');
  testSelectorRoundTrip('.a');
  testSelectorRoundTrip(':active');
  testSelectorRoundTrip('[a]');
  testSelectorRoundTrip('[a="b"]');
  testSelectorRoundTrip('[a~="b"]');
  testSelectorRoundTrip('[a|="b"]');
  testSelectorRoundTrip('[a^="b"]');
  testSelectorRoundTrip(r'[a$="b"]');
  testSelectorRoundTrip('[a*="b"]');

  testSelectorRoundTrip('a:active');
  testSelectorRoundTrip('a b');
  testSelectorRoundTrip('a + b');
  testSelectorRoundTrip('a ~ b');
  testSelectorRoundTrip('a > b');

  testSelectorRoundTrip(":active");
  testSelectorRoundTrip(":checked");
  testSelectorRoundTrip(":disabled");
  testSelectorRoundTrip(":empty");
  testSelectorRoundTrip(":enabled");
  testSelectorRoundTrip(":first-child");
  testSelectorRoundTrip(":first-of-type");
  testSelectorRoundTrip(":focus");
  testSelectorRoundTrip(":hover");
  testSelectorRoundTrip(":indeterminate");
  testSelectorRoundTrip(":link");
  testSelectorRoundTrip(":root");
  testSelectorRoundTrip(":target");
  testSelectorRoundTrip(":visited");

  testSelectorRoundTrip(":lang(a)");
  testSelectorRoundTrip(":not(a)");

  shouldBeLikeString(parseThenSerializeRule('*:active { }'), ':active { }');

  shouldBeLikeString(parseThenSerializeRule('a+b { }'), 'a + b { }');
  shouldBeLikeString(parseThenSerializeRule('a~b { }'), 'a ~ b { }');
  shouldBeLikeString(parseThenSerializeRule('a>b { }'), 'a > b { }');
}
