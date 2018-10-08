/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/** 
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p>
          Test the behavior of <tt>getComputedStyle</tt> when it is called on an element with
          <tt>display: none;</tt> while there are pending style sheets.
      </p>
      <link rel="stylesheet" href="data:text/css,">
      <div id="target" style="display: none; width: 100px; height: 100px;"></div>
      <div id="result"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var computedWidth = getComputedStyle(document.getElementById("target")).width;
  document.getElementById("result").text = computedWidth == "100px" ? "PASS" : "FAIL";
}
