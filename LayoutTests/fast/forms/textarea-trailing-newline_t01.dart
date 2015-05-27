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
      <p><textarea id="ta"></textarea></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  var ta = document.getElementById("ta");
  ta.focus();
  document.execCommand("InsertLineBreak", false, '');
  var result = ta.value;
  shouldBe(result, "\n");
}
