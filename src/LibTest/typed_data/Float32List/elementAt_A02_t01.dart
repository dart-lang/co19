/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * If [this] has fewer than [index] elements throws a RangeError.
 * @description Checks that a [RangeError] is thrown if [this]
 * has fewer than [index] elements.
 * @author msyabro
 */
import "dart:typed_data";
import "../../../Utils/expect.dart";

check(length) {
  var l = new Float32List(length);
  try {
    l.elementAt(length + 1);
    Expect.fail("RangeError is expected");
  } on RangeError catch(ok) {}
  try {
    l.elementAt(-1);
    Expect.fail("RangeError is expected");
  } on RangeError catch(ok) {}
}

main() {
  check(0);
  check(1);
  check(100);
  check(65536);
}
