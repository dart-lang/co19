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
  document.body.setInnerHtml('''
      This tests that you can get and set the multiple attribute as a property in JavaScript.<br>
      <input type="file" id="up1" multiple>
      <input type="file" id="up2">
      <pre id="console"></pre>
      ''', treeSanitizer: new NullTreeSanitizer());
        
  check(testNum, expected, actual) {
    debug("Test $testNum");
    shouldBe(expected, actual);
  }

  test() {
    var up1 = document.getElementById("up1");
    var up2 = document.getElementById("up2");

    check(1, up1.multiple, true);
    check(2, up2.multiple, false);

    up1.multiple = false;
    up2.multiple = true;

    check(3, up1.multiple, false);
    check(4, up2.multiple, true);

    check(5, up1.getAttribute("multiple"), null);
    check(6, up2.getAttribute("multiple"), "");
  }

  test();
}
