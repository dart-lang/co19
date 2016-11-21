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
<div>
<p>This tests the initial caret position for textareas.</p>
<p>Bug 11746: REGRESSION(r14931): Outlook Web Access incorrectly positions the insertion point when replying to e-mail<br>
<a href="http://bugs.webkit.org/show_bug.cgi?id=11746">http://bugs.webkit.org/show_bug.cgi?id=11746</a></p>
</div>
<div>
<textarea id="ta" rows="5" cols="10">
1
2
3
4
5
6
7
8
9
10
</textarea>
</div>
      ''', treeSanitizer: new NullTreeSanitizer());

  TextAreaElement ta = document.getElementById('ta') as TextAreaElement;
  ta.focus();
  shouldBe(ta.selectionStart, 0);
  shouldBe(ta.selectionEnd, 0);
}
