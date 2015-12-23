/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the parsing of the cursor property in quirks mode.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  makeCursorRule(rule)
  {
    return "cursor: " + rule + ";";
  }

  roundtripCssRule(cssText)
  {
    var div = document.createElement("div");
    div.setAttribute("style", cssText);
    document.body.append(div);
    var result = div.style.cssText;
    div.remove();
    return result;
  }

  testCursorRule(rule, [expected])
  {
    var cssText = makeCursorRule(rule);
    if (expected == null)
      expected = cssText;
    else
      expected = makeCursorRule(expected);
    shouldBeEqualToString(stripQuotes(roundtripCssRule(cssText)), expected);
  }

  testInvalidCursorRule(rule)
  {
    shouldBeEqualToString(roundtripCssRule(makeCursorRule(rule)), '');
  }

  testCursorRule('pointer', 'pointer');
  testCursorRule('url(file:///foo.png), pointer', 'url(file:///foo.png), pointer');

  debug('Test invalid cursor rules which shouldn\'t parse at all.');
  testInvalidCursorRule('url(file:///foo.png), url(file:///foo2.png)');
}
