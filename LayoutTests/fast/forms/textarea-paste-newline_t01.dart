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
      <p><textarea id="ta"></textarea></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  TextAreaElement ta = document.getElementById("ta") as TextAreaElement;
  ta.value = "abc\n";
  ta.focus();
  ta.setSelectionRange(0, 4);
  document.execCommand("cut", false, '');
  document.execCommand("paste", false, '');
  String result1 = ta.value;
  ta.setSelectionRange(0, 0);
  document.execCommand("paste", false, '');
  String result2 = ta.value;

  shouldBe(result1, "abc\n");
  shouldBe(result2, "abc\nabc\n");
}
