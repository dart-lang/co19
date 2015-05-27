/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void insert(int index, E value)
 * Inserts the element at position [index] in the list.
 * This increases the length of the list by one and shifts
 * all elements at or after the [index] towards the end of the list.
 * @description Checks that [UnsupportedError] is thrown
 * since [Int8List] is a fixed-size list.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  var l = new Int8List(10);
  try {
    l.insert(0, 0);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError catch(ok) {}
  Expect.equals(10, l.length);

  l = new Int8List(0);
  try {
    l.insert(0, 0);
    Expect.fail("UnsupportedError is expected");
  } on UnsupportedError catch(ok) {}
  Expect.equals(0, l.length);
}
