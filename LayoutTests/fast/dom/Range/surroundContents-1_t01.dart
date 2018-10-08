/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This tests for HIERARCHY_REQUEST_ERRs when calling
 * Range::surroundContents.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div id="select" style="border: 1px solid blue;">Hello world.</div>
    <div id="insert" style="border: 1px solid red;"></div>
    ''', treeSanitizer: new NullTreeSanitizer());

  Range range = document.createRange();
  var select = document.getElementById("select");
  Text text = select.firstChild;

  var insert = document.getElementById("insert");

  range.setStart(text, 0);
  range.setEnd(text, text.length);

  shouldThrow(() {
    range.surroundContents(select);
  }, (e) => e is DomException && e.name == DomException.HIERARCHY_REQUEST);
  
  range.surroundContents(insert);
}
