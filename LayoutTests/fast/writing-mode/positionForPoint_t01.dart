/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion
 * @description
 */
import "dart:html";
import "../../testharness.dart";
import "../../../Utils/expect.dart";

const String htmlEL = r'''
<div id="test-1" style="width: 200px; outline: dashed lightblue;">
    <div style="height: 10px; background-color: silver;"></div>
    <div style="width: 200px; height: 10px; background-color: silver; -webkit-writing-mode: vertical-lr;"></div>
    <div class="target" style="margin-top: 40px; height: 20px; background-color: silver;"></div>
</div>
<br>
<div id="test-2" style="height: 200px; outline: dashed lightblue; -webkit-writing-mode: vertical-lr;">
    <div style="width: 10px; background-color: silver;"></div>
    <div class="target" style="margin-left: 40px; width: 10px; background-color: silver;"></div>
    <div style="width: 20px; background-color: silver;"></div>
</div>
''';

void test(id, x, y) {
    Element container = document.getElementById(id);
    Range range = document.caretRangeFromPoint(container.offsetLeft + x, container.offsetTop + y);
    Expect.equals("target", (range.startContainer as Element).className);
}

void main() {
    document.body.appendHtml(htmlEL, treeSanitizer: new NullTreeSanitizer());

    test("test-1", 20, 50);
    test("test-2", 20, 180);
    print("test passed");
}
