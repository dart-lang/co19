/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description If this test passed, no crash occurs.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
      #target {
          background: -webkit-image-set(url(images/noise.png) 1x, url(images/noise@2x.png) 2x), #ff0000;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div>[bug 108409] <a href="https://bugs.webkit.org/show_bug.cgi?id=108409">https://bugs.webkit.org/show_bug.cgi?id=108409</a> Making -webkit-image-set() the first value of background property causes crash.</div>
      <div>If this test passed, no crash occurs.</div>
      <div id="target">PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
