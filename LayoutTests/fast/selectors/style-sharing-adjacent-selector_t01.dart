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
import "../../../Utils/expect.dart";
import "../../testharness.dart";

const String htmlEL1 = r'''
<style> 
    p.foo + p { color: red; }
</style> 
''';

const String htmlEL2 = r'''
    <p class="foo">This text should be black.</p> 
    <p>This text should be red.</p> 
    <p id="p2">This text should be black.</p>
    <div id="result">FAIL</div>
''';

void main() {
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());
    document.body.appendHtml(htmlEL2, treeSanitizer: new NullTreeSanitizer());
    Expect.equals("rgb(0, 0, 0)", document.getElementById('p2').getComputedStyle().color);
    document.getElementById("result").text = "PASS";
}
