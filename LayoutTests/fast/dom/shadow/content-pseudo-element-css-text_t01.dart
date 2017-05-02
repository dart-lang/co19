/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for cssText of '::distributed' rule.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html(''' 
    <style id="style1">
    .foo::content div .bar::before { display: block; }
    ::content { display: block; }
    div content::content div content::content div.green { color: green; }
    *::content * { color: blue; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  shouldBeEqualToString(document.getElementById('style1').sheet.cssRules.item(0).cssText, ".foo::content div .bar::before { display: block; }");
  shouldBeEqualToString(document.getElementById('style1').sheet.cssRules.item(1).cssText, "::content { display: block; }");
  shouldBeEqualToString(document.getElementById('style1').sheet.cssRules.item(2).cssText, "div content::content div content::content div.green { color: green; }");
  shouldBeEqualToString(document.getElementById('style1').sheet.cssRules.item(3).cssText, "::content * { color: blue; }");
}
