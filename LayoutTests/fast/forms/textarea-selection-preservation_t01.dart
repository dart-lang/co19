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
<p>This tests for problems where we'd lose the selection in a textarea when making style and value changes.</p>
<div id="console"></div>
<p><textarea id="ta">abc123
</textarea></p>
      ''', treeSanitizer: new NullTreeSanitizer());

  TextAreaElement ta = document.getElementById('ta') as TextAreaElement;
  ta.selectionStart = 3;
  ta.selectionEnd = 4;
  shouldBe(ta.selectionStart, 3);
  shouldBe(ta.selectionEnd, 4);
  debug("- add background style");
  ta.setAttribute("style", "background-color: yellow");
  shouldBe(ta.selectionStart, 3);
  shouldBe(ta.selectionEnd, 4);
  debug("- set value to same value");
  ta.value = "abc123\n";
  shouldBe(ta.selectionStart, 3);
  shouldBe(ta.selectionEnd, 4);
  debug("- set value to a different value");
  ta.value = "abc123";
  shouldBe(ta.selectionStart, 6);
  shouldBe(ta.selectionEnd, 6);
  debug("- set selection so we can test again without a trailing newline");
  ta.selectionStart = 3;
  ta.selectionEnd = 4;
  ta.attributes.remove("style");
  shouldBe(ta.selectionStart, 3);
  shouldBe(ta.selectionEnd, 4);
  debug("- add background style");
  ta.setAttribute("style", "background-color: yellow");
  shouldBe(ta.selectionStart, 3);
  shouldBe(ta.selectionEnd, 4);
  debug("- set value to same value");
  ta.value = "abc123";
  shouldBe(ta.selectionStart, 3);
  shouldBe(ta.selectionEnd, 4);
}
