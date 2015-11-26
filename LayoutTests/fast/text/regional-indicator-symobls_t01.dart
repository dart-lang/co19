/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description Test that regional indicator symobol letters can combine into national flags.
 */
import "../../testharness.dart";

const String htmlEL2 = r'''
<style>
    span { border: solid; }
    span#reference { text-rendering: optimizelegibility; }
</style>
<p>
    The two boxes below should look the same.
</p>
<p style="font-size: 48px;">
    <span id="test">&#x1f1ec;&#x1f1e7; &#x1f1fa;&#x1f1f8;</span>
    <span id="reference">&#x1f1ec;&#x1f1e7; &#x1f1fa;&#x1f1f8;</span>
</p>
''';

void main() {
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    var test = document.getElementById("test");
    var reference = document.getElementById("reference");
    Expect.equals(test.offsetWidth, reference.offsetWidth);
}
