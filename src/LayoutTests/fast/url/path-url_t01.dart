/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Canonicalization of path URLs
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "resources/utilities.dart";

List cases = [ 
  ["javascript:", "javascript:"],
  ["JavaScript:Foo", "javascript:Foo"],
  // Disabled because this gets treated as a relative URL.
  // [":\":This /is interesting;?#", ":\":This /is interesting;?#"],
];

void main() {
    for (var i = 0; i < cases.length; ++i) {
      String test_vector = cases[i][0];
      String expected_result = cases[i][1];
      shouldBe(canonicalize(test_vector),
               expected_result,
               "$i");
    }
    checkTestFailures();
}
