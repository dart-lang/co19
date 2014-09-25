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

void main() {
    description("This tests that storage methods throw exceptions when storage is disabled with reasonable messages.");

    shouldThrow((){window.sessionStorage;}, null, "sessionStorage");
    shouldThrow((){window.localStorage;}, null, "localStorage");
    checkTestFailures();
}
