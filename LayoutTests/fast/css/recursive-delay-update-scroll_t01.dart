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
     <style media="all" type="text/css">
        body {
          display: -webkit-box;
        }

        .test {
          margin-right: -1000000;
          overflow-y: auto;
        }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <!-- This would previously trigger an assertion failure. Thanks to Robert
           Swiecki for the test case. -->

      <form class="test">
        <select class="test">
          <option>1</option>
        </select>
      </form>

      <p>PASS</p>
      ''', treeSanitizer: new NullTreeSanitizer());
}
