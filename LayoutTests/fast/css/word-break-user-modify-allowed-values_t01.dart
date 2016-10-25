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
  var style = new Element.html('''
      <style>
      body {
          word-break: solid;
          -webkit-user-modify: solid;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>This page tests that invalid values for the <tt>word-break</tt> and <tt>-webkit-user-modify</tt> properties are rejected by the CSS parser.</p>
      <pre id="log"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());

  var rules = window.getMatchedCssRules(document.body, "");
  shouldBeNull(rules);
}
