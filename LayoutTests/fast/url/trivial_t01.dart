/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test basic features of URL canonicalization.
 */
import "../../testharness.dart";
import "resources/utilities.dart";

// Format: [baseURL, relativeURL, expectedURL],
List cases = [ 
  ["http://example.com/", "http://example.com/"],
  ["/", "http://example.org/"]
];

void doTest(int i) {
  String baseURL = cases[i][0];
  String expectedURL = cases[i][1];
  test((){
    Expect.equals(
      expectedURL,
      canonicalize(baseURL)
    );
    }, ' $i ["$baseURL", "$expectedURL"]');
}

void main() {
  var originalBaseURL = canonicalize(".");
  setBaseURL("http://example.org/foo/bar");
  for (var i = 0; i < cases.length; ++i) {
    doTest(i);
  }
  checkTestFailures();
  setBaseURL(originalBaseURL);
}
