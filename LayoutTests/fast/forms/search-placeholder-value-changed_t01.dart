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
  document.body.setInnerHtml('''
      <input type="search" placeholder="FAIL" id="test">
      ''', treeSanitizer: new NullTreeSanitizer());

  delayedTest() {
    var searchField = document.getElementById("test");
    searchField.setAttribute("placeholder", "PASS");
    asyncEnd();
  }

  asyncStart();
  setTimeout(delayedTest, 100);
}

