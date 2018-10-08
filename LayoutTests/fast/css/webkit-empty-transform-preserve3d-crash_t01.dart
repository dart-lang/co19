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
      span {
        display: table-column;
        -webkit-transform-style: preserve-3d;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <span></span>
      <p>Test for bug <a href="https://bugs.webkit.org/show_bug.cgi?id=51465">51465</a>: chrome.dll!WebCore::RenderLayer::currentTransform ReadAV@NULL (8968fc97874fa23b6799ff8f09c142e4)</p>
      <p>If it did not crash, this test has PASSED</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}
