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

main() {
  var style = new Element.html('''
      <style type="text/css">
          dfn { content: "text"; content: initial; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Test for <a href="http://bugs.webkit.org/show_bug.cgi?id=12061">bug 12061</a>.</p>
      <p>PASS: If this doesn't crash, the test has succeeded.</p>
      <dfn>dfn</dfn>
      ''', treeSanitizer: new NullTreeSanitizer());
}
