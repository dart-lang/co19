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
      <div id="test" style="display: none"></div>
      <div id="result"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var style = getComputedStyle(document.getElementById("test"), "");
  shouldBe(style.display, "none");
}
