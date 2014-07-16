/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests if the Deprecated Flex boxes with max-width: intrinsic
 * and width:0 has non-zero calculated width
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";

main() {
  var style = new Element.html('''
      <style>
      #outer {
          display: -webkit-box;
      }
      #inner {
          overflow: hidden;
          max-width: intrinsic;
          width: 0px;
          -webkit-box-flex: 60;
      }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="outer">
          <div id="inner">PASS</div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var x = document.getElementById('inner');
  var flexBoxDiv = x.getClientRects()[0];
  shouldBeNonZero(flexBoxDiv.width);
}
