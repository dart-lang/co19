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
    <div id="test1">
    <input id="test2"/>
    <input id="test3"/>
    <ol></ol>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  runTest(_) {
    var range = document.createRange();
    var test1 = document.getElementById("test1");
    var test2 = document.getElementById("test2");
    var test3 = document.getElementById("test3");

    range.setStartBefore(test2);
    range.selectNodeContents(test3);
    range.setEndAfter(test1);
    range.commonAncestorContainer;
    range.deleteContents();
  }

  document.addEventListener("DOMSubtreeModified", runTest, true);
  document.body.append(new Text("PASS"));
}
