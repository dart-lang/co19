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
      <p>This tests for a crash when inserting text into a textarea that has been shrunk to zero rows just before the insertion.</p>
      <textarea id="textarea" rows="1"></textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  var e = document.getElementById("textarea");
  e.setSelectionRange(0, 0);
  e.rows = 0;
  document.execCommand("InsertText", false, "x");
}
