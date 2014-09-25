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

const String htmlEL2 = r'''
<div style="margin: 0; width: 300px">
    <div id="test" style="width: 200px; height: 200px; margin: 0.5px 1.5px 2.5px 3.5px; background: blue;"></div>
    <div id="test2" style="width: 299px; height: 200px; margin: 5px auto; background: blue;"></div>
</div>
''';

void main() {
    document.body.attributes['style']="margin: 0; padding: 0;";
    document.body.appendHtml(htmlEL2);

    // Fixed width margins.
    var style = document.getElementById('test').getComputedStyle();
    shouldBe(style.marginTop, '0.5px');
    shouldBe(style.marginRight, '1.5px');
    shouldBe(style.marginBottom, '2.5px');
    shouldBe(style.marginLeft, '3.5px');
    
    // Auto left/right margin.
    style = document.getElementById('test2').getComputedStyle();
    shouldBe(style.marginLeft, '0.5px');
    shouldBe(style.marginRight, '0.5px');

    checkTestFailures();
}
