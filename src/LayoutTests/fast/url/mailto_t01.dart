/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Tests mailto: URL canonicalization.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "resources/utilities.dart";

List cases = [ 
  ["addr1", "addr1"],
  ["addr1@foo.com", "addr1@foo.com"],

  // Trailing whitespace is stripped.
  ["addr1 \t ", "addr1"],
  ["addr1?to=jon", "addr1?to=jon"],
  ["addr1,addr2", "addr1,addr2"],
  ["addr1, addr2", "addr1, addr2"],
  ["addr1%2caddr2", "addr1%2caddr2"],

  // U+10300 input as UTF-16 surrogate pair, expected as escaped UTF-8
//  ["\uD800\uDF00", "%F0%90%8C%80"],
  ["addr1?", "addr1?"],

  // Null character should be escaped to %00
  // Not sure how to test null characters in JavaScript.  They appear to get
  // stripped out.
  // ["addr1\\0addr2?foo", "addr1%00addr2?foo"],
];

void main() {
    for (var i = 0; i < cases.length; ++i) {
      String test_vector = cases[i][0];
      String expected_result = cases[i][1];
      shouldBe(canonicalize('mailto:$test_vector'),
               'mailto:$expected_result',
               "$i");
    }
    // Invalid -- UTF-8 encoded surrogate value.
    shouldBeFalse(canonicalize('mailto:\xed\xa0\x80') == 'mailto:%EF%BF%BD', "UTF-8 encoded surrogate value");
    checkTestFailures();
}
