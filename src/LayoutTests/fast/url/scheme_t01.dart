/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Canonicalization of URL schemes.
 */
import "../../testharness.dart";
import "resources/utilities.dart";

List cases = [ 
  ["http", "http"],
  ["HTTP", "http"],
  // These tests trigger the relative URL resolving behavior of
  // HTMLAnchorElement.href.  In order to test absolute URL parsing, we'd need
  // an API that always maps to absolute URLs.  If you know of one, please
  // enable these tests!
  // [" HTTP ", "%20http%20"],
  // ["htt: ", "htt%3A%20"],
  // ["\xe4\xbd\xa0\xe5\xa5\xbdhttp", "%E4%BD%A0%E5%A5%BDhttp"],
  // ["ht%3Atp", "ht%3atp"],
];

void doTest(int i) {
  String test_vector = cases[i][0];
  String expected_result = cases[i][1];
  test((){
    Expect.equals(
      '$expected_result://example.com/',
      canonicalize('$test_vector://example.com/')
    );
    }, ' $i ["$test_vector", "$expected_result"]');
}

void main() {
  for (var i = 0; i < cases.length; ++i) {
    doTest(i);
  }
  checkTestFailures();
}
