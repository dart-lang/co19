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
      <p>This tests to see that a line break inserted in a textarea is serialized as a '\n'.</p>
      <textarea rows="5" id="textarea"></textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  var textarea = document.getElementById("textarea");
  textarea.focus();
  document.execCommand("InsertText", false, "foo");
  document.execCommand("InsertLineBreak", false, "");
  document.execCommand("InsertText", false, "bar");

  shouldBe(textarea.value, "foo\nbar");
}
