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
      <p>This is a test for <a href="https://bugs.webkit.org/show_bug.cgi?id=7363">https://bugs.webkit.org/show_bug.cgi?id=7363</a>.  Taking focus away from a text field that no longer had focus was crashing Safari.</p>
      <input id="field1" type="text" value="field1">
      <input id="field2" type="text" value="field2">
      <ul id="console"></ul>
      ''', treeSanitizer: new NullTreeSanitizer());

  runTest(_) {
    var field1 = document.getElementById("field1");
    var field2 = document.getElementById("field2");

    field1.remove();
    field2.focus();
    debug("Success: finished the test without crashing.");
    asyncEnd();
  }

  document.getElementById("field1").onFocus.listen(runTest);

  asyncStart();
  window.onLoad.listen((_) {
    document.getElementById('field1').focus();
  });
}
