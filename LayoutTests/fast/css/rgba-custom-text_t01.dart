/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description Tests the CSS custom text implementation for rgba(). Note that
 * WebKit internally stores alpha as an 8 bit value, and that 255 * 0.2 = 51
 * exactly. So 0.2 is able to be stored with no rounding.
 */
import "dart:html";
import "../../testcommon.dart";
import "../../../Utils/async_utils.dart";
import "pwd.dart";

main() {
  var style = new Element.html('''
      <style>
         #test {
             color: rgba(0, 0, 0, 0.2);
         }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  shouldBeEqualToString(getComputedStyle(document.getElementById("test"), null).color, "rgba(0, 0, 0, 0.2)");
}
