/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test URLs that have a port number.
 */
import "../../testharness.dart";
import "resources/utilities.dart";

List cases = [ 
  // Invalid input should be copied w/ failure.
  ["as df", ":as%20df"],
  ["-2", ":-2"],
  // Default port should be omitted.
  ["80", ""],
  ["8080", ":8080"],
  // Empty ports (just a colon) should also be removed
  ["", ""],
  // Code point with a numeric value U+1369 ETHIOPIC DIGIT ONE
  ["\u1369", ":%E1%8D%A9"],
  // Code point with a numerical mapping and value U+1D7D6 MATHEMATICAL BOLD DIGIT EIGHT
//  ["\uD835\uDFD6", ":%F0%9D%9F%96"], // invalid code point
];

void main() {
    for (var i = 0; i < cases.length; ++i) {
      String test_vector = cases[i][0];
      String expected_result = cases[i][1];
      shouldBe(canonicalize('http://www.example.com:$test_vector/'),
               'http://www.example.com$expected_result/',
               "$i");
    }
    // Unspecified port should mean always keep the port.
    shouldBe(canonicalize('foobar://www.example.com:80/'),
         'foobar://www.example.com:80/');
    checkTestFailures();
}
