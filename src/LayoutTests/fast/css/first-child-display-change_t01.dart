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
      <style>
      .display-when-first-child { display: none; }
      .display-when-first-child:first-child { display: block; }
      </style>
      ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
      <div id="test"></div>
      <div class="display-when-first-child">PASS</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById("test").remove();
}