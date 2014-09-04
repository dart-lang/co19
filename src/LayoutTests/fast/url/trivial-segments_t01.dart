/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test basic features of URL segmentation.
 */
import "dart:html";
import "../../../Utils/expect.dart";
import "../../testharness.dart";
import "resources/utilities.dart";

// [URL, [SCHEME, HOST, PORT, PATH, QUERY, REF]]
List cases = [ 
  ["http://example.com/", ["http:", "example.com", "", "/", "", ""]],
];

void doTest(int i) {
  String url = cases[i][0];
  List expected = cases[i][1];
  test((){
    Expect.equals(
      expected.toString(),
      segments(url).toString()
    );
    }, ' $i ["$url"]');
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
