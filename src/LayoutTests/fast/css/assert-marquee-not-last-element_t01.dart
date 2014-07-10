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
          marquee { display: run-in; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <p>Bug <a href="https://bugs.webkit.org/show_bug.cgi?id=12085">12085</a>: Assertion failure in WebCore::RenderFlow::rightmostPosition</p>
      <marquee>marquee</marquee>

      <p>If this test does not ASSERT, it has PASSED</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}

