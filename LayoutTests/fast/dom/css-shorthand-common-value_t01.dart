/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description getPropertyValue('border') should not return a value for any 
 * property that doesn't have the same value for top, left, right and bottom,
 * even if the values that differ are implicitly set by a shorthand.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  StyleElement style = new Element.html('''
    <style>
    #test {
        border: 10px solid red;
        border-top-width: 50px;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  CssStyleSheet sheet = style.sheet;
  var expected = 'solid red';
  var actual =
    (sheet.cssRules[0] as CssStyleRule).style.getPropertyValue('border');

  shouldBe(actual, expected);
}
