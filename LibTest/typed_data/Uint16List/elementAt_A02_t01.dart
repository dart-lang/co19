/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion E elementAt(int index)
 * ...
 * The [index] must be non-negative and less than length.
 * @description Checks that a [RangeError] is thrown if the [index] is out
 * bounds.
 * @author msyabro
 */

import "dart:typed_data";
import "../../../Utils/expect.dart";

check(length) {
  var l = new Uint16List(length);
  try {
    l.elementAt(length + 1);
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l.elementAt(length);
    Expect.fail("RangeError is expected");
  } on RangeError {}
  try {
    l.elementAt(-1);
    Expect.fail("RangeError is expected");
  } on RangeError {}
}

main() {
  check(0);
  check(1);
  check(100);
  check(65536);
}
