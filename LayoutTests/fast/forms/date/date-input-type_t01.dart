/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Tests for writing and reading .type property of
 * HTMLInputElement.
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  InputElement input = document.createElement('input') as InputElement;
  document.body.append(input);

  void check(String value, String expected) {
    input.type = value;
    if (input.type == expected)
      testPassed('input.type for "' + value + '" is correctly "' + input.type + '".');
    else
      testFailed('input.type for "' + value + '" is incorrectly "' + input.type + '", should be "' + expected + '".');
  }

  check("date", "date");
  check("DATE", "date");
  check(" date ", "text");
}
