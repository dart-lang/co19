/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void operator []=(int index, int value)
 * ... or throws an [RangeError] if index is out of bounds.
 * @description Checks that an exception is thrown as expected.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(List<double> list) {
  var l = new Float64List.fromList(list);
  try {
    l[-1] = 1.0;
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[l.length] = 1.0;
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x80000000] = 1.0;
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l[0x7fffffff] = 1.0;
    Expect.fail("RangeError is expected");
  } on RangeError {}
}

main() {
  check([]);
  check([1.0]);
  check([
    0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0,
    14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0
  ]);
}
