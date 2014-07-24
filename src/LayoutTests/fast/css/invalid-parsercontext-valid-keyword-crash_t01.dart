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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <svg xmlns="http://www.w3.org/2000/svg">
          <!-- This test passes if there is no crash. -->
          <rect>
                  <animate attributeName="display" to="bevel"></animate>
          </rect>

          <text x="10" y="20">Excellent - did not crash. See bug https://bugs.webkit.org/show_bug.cgi?id=105275</text>
      </svg>
      <div>PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());
}
