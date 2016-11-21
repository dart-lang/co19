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
      <p>This tests for a bug where text pasted into a textarea would appear one character before the position where it was pasted.</p>
      <textarea rows=5 id="test">xx</textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  TextAreaElement e = document.getElementById("test") as TextAreaElement;
  e.setSelectionRange(1, 1);
  document.execCommand("InsertHTML", false, 
      "(There should be one 'x' before and after this sentence.)");

  shouldBe(e.value, "x(There should be one 'x' before and after this sentence.)x");
}
