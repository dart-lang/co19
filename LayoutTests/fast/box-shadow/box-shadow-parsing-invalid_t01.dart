/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the parsing of box-shadow.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  // These have to be global for the test helpers to see them.
  var stylesheet, cssRule, declaration;
  dynamic styleElement = document.createElement("style");
  document.head.append(styleElement);
  stylesheet = styleElement.sheet;

  testInvalidFilterRule(description, rule)
  {
    debug(description + " : " + rule);

    stylesheet.insertRule("body { box-shadow: " + rule + "; }", 0);
    cssRule = stylesheet.cssRules.item(0);

    shouldBe(cssRule.type, 1);

    declaration = cssRule.style;
    shouldBe(declaration.length, 0);
    //shouldBe(declaration.getPropertyValue('box-shadow'), null);
    shouldBe(declaration.getPropertyValue('box-shadow'), '');
  }

  // FIXME A whole bunch of negative parsing tests are missing, see bug
  // http://webkit.org/b/111498
  testInvalidFilterRule("Negative blur radius value", "10px 10px -1px rgb(255, 0, 0)");
  testInvalidFilterRule("Negative blur radius value, with a spread defined", "10px 10px -1px 10px rgb(255, 0, 0)");
  testInvalidFilterRule("Negative blur radius value, with a negative spread defined", "10px 10px -1px -1px rgb(255, 0, 0)");
}
