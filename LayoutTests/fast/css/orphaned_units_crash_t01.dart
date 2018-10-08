/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description This should not crash.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var style = new Element.html('''
      <style>
          .test {
              -webkit-border-bottom-left-radius: 1 px;
          }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      This test verifies that styles with orphaned units do not crash the browser.  You should see the word "PASS" below.
      <div class="test">PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
