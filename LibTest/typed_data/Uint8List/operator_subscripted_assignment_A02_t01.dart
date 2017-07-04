/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, int value)
 * ...
 * Throws an [RangeError] if index is out of bounds.
 * @description Checks that an exception is thrown as expected.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<int> list) {
  var l = new Uint8List.fromList(list);
  try {
    l[-1] = 1;
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[l.length] = 1;
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x80000000] = 1;
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x7fffffff] = 1;
    Expect.fail("RangeError is expected");
  } on RangeError {}
}

main() {
  check([]);
  check([1]);
  check([
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
  ]);
}