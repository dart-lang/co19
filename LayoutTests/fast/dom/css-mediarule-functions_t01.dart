/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests the insertRule(rule, index) and deleteRule(index)
 * methods of the CSSMediaRule interface.
 */
import "dart:html";
import "../../testcommon.dart";

_shouldThrow(func(), name) =>
  shouldThrow(func, (e) => e is DomException && e.name == name);

main() {
  var style = new Element.html('''
    <style id="style1">
        @media all { .test { color: green; } }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  CssStyleSheet styleSheet =
      (document.getElementById('style1') as StyleElement).sheet;
  CssMediaRule mediaRule = styleSheet.cssRules[0];

  // CSSMediaRule.insertRule(rule, index) tests

  debug('Test that insertRule works.');
  mediaRule.insertRule(".test2 { color: blue; }", mediaRule.cssRules.length);

  debug('Test that insertRule raises an exception for indexes greater than the length of the list.');
  _shouldThrow(() {
    mediaRule.insertRule("p {color: red; }", mediaRule.cssRules.length + 1);
  }, DomException.INDEX_SIZE);

  debug('Test that insertRule raises an exception for indexes less than 0.');
  _shouldThrow(() {
    mediaRule.insertRule("p {color: red; }", -1);
  }, DomException.INDEX_SIZE);

  debug('Test that insertRule raises an exception for malformed rules.');
  _shouldThrow(() {
    mediaRule.insertRule("badbeef }{", mediaRule.cssRules.length);
  }, DomException.SYNTAX);

  // Test that insertRule raises an exception for illegally placed rules.
  debug('ImportRule illegal inside a MediaRule.');
  _shouldThrow(() {
    // ImportRule illegal inside a MediaRule.
    mediaRule.insertRule("@import url(sheet.css);", mediaRule.cssRules.length);
  }, DomException.HIERARCHY_REQUEST);
  debug('CharsetRule illegal inside a MediaRule.');
  _shouldThrow(() {
    // CharsetRule illegal inside a MediaRule.
    mediaRule.insertRule("@charset \"ISO-8859-1\";", mediaRule.cssRules.length);
  }, DomException.SYNTAX);
  debug('Nested MediaRule illegal inside a MediaRule.');
  _shouldThrow(() {
    // Nested MediaRule illegal inside a MediaRule.
    mediaRule.insertRule(
        "@media screen { p { color: red; } };", mediaRule.cssRules.length);
  }, DomException.SYNTAX);

  // CSSMediaRule.deleteRule(index) tests

  debug('Test that deleteRule works.');
  mediaRule.deleteRule(mediaRule.cssRules.length - 1);

  debug('Test that deleteRule raises an exception for specified indexes not corresponding to a rule in the media rule list. Greater');
  _shouldThrow(() {
    mediaRule.deleteRule(mediaRule.cssRules.length);
  }, DomException.INDEX_SIZE);
  debug('Test that deleteRule raises an exception for specified indexes not corresponding to a rule in the media rule list. Less');
  _shouldThrow(() {
    mediaRule.deleteRule(-1);
  }, DomException.INDEX_SIZE);
}
