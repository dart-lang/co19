/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description This tests that a line break is prohibited between an ideographic comma and a right corner bracket.
 */
import "../../testharness.dart";

const String htmlEL2 = '''
<div id="target" style="font-size: 72px;">&#x3046;&#x3001;&#x0300d;&#x3046;</div>
<p id="result">Test did not run.</p>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var target = document.getElementById("target");
    var range = document.createRange();
    range.setStart(target.firstChild, 0);
    range.setEnd(target.firstChild, 2);
    var width = (range.getBoundingClientRect().width).ceil();
    target.style.width = "${width}px";
    var rect = range.getBoundingClientRect();
    range.setStart(target.firstChild, 2);
    range.setEnd(target.firstChild, 3);
    Expect.equals(rect.top, range.getBoundingClientRect().top);
}