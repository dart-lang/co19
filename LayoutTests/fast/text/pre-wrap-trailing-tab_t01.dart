/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description This test ensures WebKit renders the trailing whitespace properly.
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
<div id="tests">
  <div style="width: 1ex; font-size: 1em; white-space: pre-wrap;"></div>
  <div style="width: 1ex; font-size: 1em; white-space: pre-wrap; word-wrap: break-word;"></div>
  <textarea style="width: 1ex; font-size: 1em;"></textarea>
</div>
<pre id="log"></pre>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var tests = document.getElementById('tests').children;

    var letter = 'a';
    var endOffset;
    for (int i = 0; i < tests.length; i++) {
        Element el=tests[i];
        if (el is TextAreaElement) {
            el.value = letter + '\t';
            el.focus();
            el.select();
            endOffset = el.selectionEnd;
        } else if (el is DivElement) {
            el.text = letter + '\t';
            window.getSelection().selectAllChildren(el);
            endOffset = window.getSelection().getRangeAt(0).endOffset;
        }
        shouldBe(2, endOffset, "$i ${el.runtimeType}");
        letter = new String.fromCharCode(letter.codeUnitAt(0) + 1);
    }
    checkTestFailures();
}
