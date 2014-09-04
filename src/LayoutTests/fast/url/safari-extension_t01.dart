/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Verify the canonicalization of Safari Extension URLs.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "resources/utilities.dart";

List safariExtensionTestSet = [ 
    ['safari-extension://', 'safari-extension://'],
    ['safari-extension://com.apple/', 'safari-extension://com.apple/'],
    ['safari-extension://com.ApPlE/', 'safari-extension://com.ApPlE/'],
    ['safari-extension://com.fête/', 'safari-extension://com.f%C3%AAte/'],
];

void main() {
    for (var i = 0; i < safariExtensionTestSet.length; ++i) {
        String src = canonicalize(safariExtensionTestSet[i][0]);
        String expected = safariExtensionTestSet[i][1];
        shouldBe('$src', '$expected');
    }
    checkTestFailures();
}
