/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test for cssText of ':host-context()' rule.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new DocumentFragment.html(''' 
    <style id="style1">
    .foo:host-context(div, body.mytheme, p#myid, .bar::before, span:hover) > div { display: block; }
    :host-context(*) { display: block; }
    </style>
    <style id="style-invalid">
    :host-context(div div) { display: block }
    :host-context(div > div) { display: block }
    :host-context(div + div) { display: block }
    :host-context(div ~ div) { display: block }
    :host-context) { display: block }
    :host-context() { display: block; }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  shouldBeEqualToString(
      document.getElementById('style1').sheet.cssRules.item(0).cssText,
      ".foo:host-context(div,body.mytheme,p#myid,.bar::before,span:hover) > div { display: block; }");
  shouldBeEqualToString(
      document.getElementById('style1').sheet.cssRules.item(1).cssText,
      ":host-context(*) { display: block; }");
  shouldBe(document.getElementById('style-invalid').sheet.cssRules.length, 0);
}
