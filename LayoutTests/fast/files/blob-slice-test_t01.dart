/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test Blob.slice().
 */
import "dart:html";
import "../../testcommon.dart";
import "resources/blob-slice-common.dart";

main() {
  sliceTestCases = [
    [2, 3, "2"],
    [2, 12, "23456789"],
    [2, 2, ""],
    [2, 1, ""],
    [2, -12, ""],
    [2, 2147483647, "23456789"],
    [2, -2147483648, ""],
    [2, 9223372036854775000, "23456789"],
    [2, -9223372036854775000, ""],
    [-2, -1, "8"],
    [-2, -2, ""],
    [-2, -3, ""],
    [-2, -12, ""],
    [-2, 2147483647, "89"],
    [-2, -2147483648, ""],
    [-2, 9223372036854775000, "89"],
    [-2, -9223372036854775000, ""],
    [0, null, "0123456789"],
    [2, null, "23456789"],
    [-2, null, "89"],
    [12, null, ""],
    [-12, null, "0123456789"],
    [2147483647, null, ""],
    [-2147483648, null, "0123456789"],
    [9223372036854775000, null, ""],
    [-9223372036854775000, null, "0123456789"],
    [null, null, "0123456789"],
    ];

  runTests()
  {
    blob = new Blob(["0123456789"]);
    /*file = new File(["0123456789"], "slice-test.txt");*/

    runNextTest();
  }

  asyncStart();
  runTests();
}
