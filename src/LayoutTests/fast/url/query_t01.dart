/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test URLs that have a query string.
 */
import "../../testharness.dart";
import "resources/utilities.dart";

List cases = [ 
  // Regular ASCII case in some different encodings.
  ["foo=bar", "foo=bar"],
  // Allow question marks in the query without escaping
  ["as?df", "as?df"],
  // Always escape '#' since it would mark the ref.
  // Disabled because this test requires being able to set the query directly.
  // ["as#df", "as%23df"],
  // Escape some questionable 8-bit characters, but never unescape.
  ["\\x02hello\x7f bye", "%02hello%7F%20bye"],
  ["%40%41123", "%40%41123"],
  // Chinese input/output
  ["q=\u4F60\u597D", "q=%26%2320320%3B%26%2322909%3B"],
  // Invalid UTF-8/16 input should be replaced with invalid characters.
  ["q=\\ud800\\ud800", "q=%26%2355296%3B%26%2355296%3B"],
  // Don't allow < or > because sometimes they are used for XSS if the
  // URL is echoed in content. Firefox does this, IE doesn't.
  ["q=<asdf>", "q=%3Casdf%3E"],
  // Escape double quotemarks in the query.
  ["q=\"asdf\"", "q=%22asdf%22"],
];

void doTest(int i) {
  String test_vector = cases[i][0];
  String expected_result = cases[i][1];
  test((){
    Expect.equals(
      'http://www.example.com/?$expected_result/',
       canonicalize('http://www.example.com/?$test_vector/')
    );
    }, ' $i ["$test_vector", "$expected_result"]');
}

void main() {
    for (var i = 0; i < cases.length; ++i) {
      doTest(i);
    }
    checkTestFailures();
}
