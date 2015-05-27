/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * @description Test resolution of relative UNIX-like URLs.
 */
import "../../testharness.dart";
import "resources/utilities.dart";

// Format: [baseURL, relativeURL, expectedURL],
List cases = [ 
  // On Unix we fall back to relative behavior since there's nothing else
  // reasonable to do.
  ["http://host/a", "\\\\\\\\Another\\\\path", "http://another/path"],

  // Even on Windows, we don't allow relative drive specs when the base
  // is not file.
  ["http://host/a", "/c:\\\\foo", "http://host/c:/foo"],
  ["http://host/a", "//c:\\\\foo", "http://c/foo"],
];

void main() {
  var originalBaseURL = canonicalize(".");
  for (var i = 0; i < cases.length; ++i) {
      String baseURL = cases[i][0];
      String relativeURL = cases[i][1];
      String expectedURL = cases[i][2];
      setBaseURL(baseURL);
      String res=canonicalize(relativeURL);
      shouldBe(res,
          expectedURL,
         ' $i canonicalize($relativeURL) is $res ');
  }
  checkTestFailures();
  setBaseURL(originalBaseURL);
}
