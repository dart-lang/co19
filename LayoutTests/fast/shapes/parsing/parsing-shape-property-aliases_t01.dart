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
import "../../../testharness.dart";
import "parsing-test-utils.dart";

// This test is only necessary until the prefixed CSS properties have been removed

String getAliasCSSValue(alias, property, value) {
    var element = document.createElement("div");
    element.style.setProperty(alias, value);
    return element.style.getPropertyValue(property);
}

void testPropertyAlias(alias, property, value) {
    shouldBe(getAliasCSSValue(alias, property, value), value);
}

void main() {
    description('Test that CSS Shapes properties with the -webkit prefix alias the unprefixed properties.');

    applyToEachArglist(
        testPropertyAlias,
        [// [alias, property, value]
         ["shape-outside", "shape-outside", "circle(0px at 0% 0%)"],
         ["shape-margin", "shape-margin", "10px"],
         ["shape-image-threshold", "shape-image-threshold", "0.5"]
        ]
    );

    checkTestFailures();
}
