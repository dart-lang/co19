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

const String htmlEL1 = r'''
    <style>
        * { font-size: 16px; }
        div { font-size: 8px; }
    </style>
''';

String setProperty(String value) {
    var div = document.createElement('div');
    document.body.append(div);
    div.style.setProperty("-webkit-mask-image", "none, none, none, none");
    div.style.setProperty("mask-source-type", value); // does not work

    var computedValue = div.getComputedStyle().getPropertyValue("mask-source-type"); // returns emty string
 //   div.remove();

    return computedValue;
}

void test(String value, String expected) {
    shouldBe(setProperty(value), expected);
}

void main() {
    document.head.appendHtml(htmlEL1);

    test("alpha, alpha, alpha, alpha", "alpha, alpha, alpha, alpha");
    test("luminance, alpha", "luminance, alpha, alpha, alpha");
    test("luminance, luminance, luminance, luminance", "luminance, luminance, luminance, luminance");
    test("auto, alpha, luminance, luminance", "alpha, alpha, luminance, luminance");

    checkTestFailures();
}
