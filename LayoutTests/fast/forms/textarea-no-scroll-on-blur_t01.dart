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
This tests that we don't scroll back to the top when leaving a textarea
<br>
<textarea id="ta">
1
2
3
4
5
</textarea>
      ''', treeSanitizer: new NullTreeSanitizer());

  TextAreaElement ta = document.getElementById('ta') as TextAreaElement;

  // Send caret to bottom of textarea
  ta.focus();
  ta.setSelectionRange(ta.value.length, ta.value.length);
  ta.blur();

  ta.focus();
  ta.blur();

  shouldNotBe(ta.scrollTop, 0);
}
