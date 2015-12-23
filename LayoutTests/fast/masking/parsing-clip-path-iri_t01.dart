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
import "../../testcommon.dart" as c;

const String htmlEL1 = r'''
<style>
* { font-size: 16px; }
div { font-size: 8px; }
</style>
''';

String computedStyle(String property, String value) {
    var div = document.createElement("div");
    document.body.append(div);
    div.style.setProperty(property, value);
    var computedValue = div.getComputedStyle().getPropertyValue(property);
    div.remove();
    return computedValue;
}

String innerStyle(String property, String value) {
    var div = document.createElement("div");
    div.style.setProperty(property, value);
    return div.style.getPropertyValue(property);
}

void testComputed(String property, String value, String expected) {
    shouldBe(c.stripQuotes(computedStyle(property, value)), expected);
}

void testInner(String property, String value, String expected) {
     shouldBe(c.stripQuotes(innerStyle(property, value)), expected);
}

void main() {
    description('Test clip-path IRIs');
    document.head.appendHtml(htmlEL1, treeSanitizer: new NullTreeSanitizer());

    testInner("-webkit-clip-path", "url(#clip1)", "url(#clip1)");
    testInner("-webkit-clip-path", "url(clip.svg#clip1)", "url(clip.svg#clip1)");

    testComputed("-webkit-clip-path", "url(#clip1)", "url(#clip1)");
    testComputed("-webkit-clip-path", "url(clip.svg#clip1)", "url(clip.svg#clip1)");

    checkTestFailures();
}
