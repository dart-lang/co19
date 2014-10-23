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

void testQuery(query, expected) {
    var actual = window.styleMedia.matchMedium(query);
    shouldBe(actual, expected, query);
}

void main() {
    testQuery('(min-device-width: 0)', true);
    testQuery('(min-device-width: 1px)', true);
    testQuery('(min-device-width: 1deg)', false);
    testQuery('(min-device-width: 1)', false);
    testQuery('(min-device-width: solid)', false);
    testQuery('(min-device-width: "red")', false);
    checkTestFailures();
}
