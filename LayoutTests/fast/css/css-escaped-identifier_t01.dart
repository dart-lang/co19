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
import "../../../Utils/async_utils.dart";
import "../../resources/testharness.dart";
import "pwd.dart";

getComputedStyle(x, [pseudoElement]) => x.getComputedStyle(pseudoElement);

main() {
  var index = document.getElementsByTagName("style").length; // skip test framework's ones

  var style = new Element.html(r'''
      <style>
          d\eeeex {}
          D\eeeeX {}
          x { background-image: url('http://w/\aaaa/1b\aaaa.gif'); }
          y { background-image: url(http://w/\aaaa/1b\aaaa.gif); }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''<!-- Intentionally left empty -->''', treeSanitizer: new NullTreeSanitizer());

  test(() {
    var styleElm = document.getElementsByTagName("style")[index];
    assert_not_equals(styleElm, null, "Style element exists");
    var stylesheet = styleElm.sheet;
    assert_not_equals(stylesheet, null, "style.sheet exists");
    var rules = stylesheet.cssRules;
    assert_equals(rules.length, 4, "cssRules.length == 4");
    assert_equals(rules[0].selectorText, "d\ueeeex", "Lowercase identifier with escapes");
    assert_equals(rules[1].selectorText, "d\ueeeex", "Uppercase identifier with escapes");
    assert_equals(rules[2].style.cssText, "background-image: url(http://w/%EA%AA%AA/1b%EA%AA%AA.gif);", "Escaped url string");
    assert_equals(rules[3].style.cssText, "background-image: url(http://w/%EA%AA%AA/1b%EA%AA%AA.gif);", "Escaped url without string");
  }, "Correctly parsed identifier with escapes");
}
