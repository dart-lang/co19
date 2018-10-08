/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for selectionStart and selectionEnd on read-only INPUT
 * and TEXTAREA.
 * href="https://bugs.webkit.org/show_bug.cgi?id=25444">bug 25444</a>:
 * SelectionStart, selectionEnd properties return wrong values when the
 * selection is in a form input.
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
      <p id="description"></p>
      <input id="text" readonly="readonly" value="2009-04-29"/><br/>
      <textarea id="area" readonly="readonly">2009-04-29</textarea></div>
      <div id="console"></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  startTest(element, start, end) {
    debug('Testing $element $start $end');
    element.setSelectionRange(start, end);

    start = start < 0 ? 0 : start;
    end = end > 10 ? 10 : end;
    start = start > end ? end : start;

    shouldBe(element.selectionStart, start);
    shouldBe(element.selectionEnd, end);
  }

  testHandler(element) {
    var offsets = [[0, 10], [0, 9], [1, 10], [5,5], [8,5], [-1,0], [-1,50]];
    for (var i = 0; i < offsets.length; i++)
      startTest(element, offsets[i][0], offsets[i][1]);
  }

  testHandler(document.getElementById('text'));
  testHandler(document.getElementById('area'));
}
