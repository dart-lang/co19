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

main() {
  StyleElement style = new Element.html('''
    <style>
    div { margin: 1px; }
    div { margin: 1px 2px; }
    div { margin: 1px 2px 3px; }
    div { margin: 1px 2px 3px 4px; }

    div { padding: 1px; }
    div { padding: 1px 2px; }
    div { padding: 1px 2px 3px; }
    div { padding: 1px 2px 3px 4px; }

    div { border-top: red; }
    div { border-bottom: red; }
    div { border-left: red; }
    div { border-right: red; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  CssStyleSheet styleSheet = style.sheet;

  var expected = [
    '1px',
    '1px 2px',
    '1px 2px 3px',
    '1px 2px 3px 4px',
    '1px',
    '1px 2px',
    '1px 2px 3px',
    '1px 2px 3px 4px',
    'red',
    'red',
    'red',
    'red'
  ];

  for (var i = 0; i < styleSheet.cssRules.length; i++) {
    CssStyleRule rule = styleSheet.cssRules[i];
    var prop = null;
    if (i < 4) prop = "margin";
    else if (i >= 4 && i < 8) prop = "padding";
    else if (i == 8) prop = "border-top";
    else if (i == 9) prop = "border-bottom";
    else if (i == 10) prop = "border-left";
    else if (i == 11) prop = "border-right";
    //var s = rule.style.getPropertyValue(prop) + " (" + rule.style[prop] + ")";
    var s = rule.style.getPropertyValue(prop);
    shouldBe(s, expected[i]);
  }
}
